﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace SleepPreventer
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
			ts_setter_ =  new TExcState(this.Handle);
			
			// Init option_cb_dic_
            opt_cb_dic_[TExcState.AWAY_MODE] = this.checkBox1;
            opt_cb_dic_[TExcState.SYS_REQ] = this.checkBox2;
            opt_cb_dic_[TExcState.DISPLAY_REQ] = this.checkBox3;
            opt_cb_dic_[TExcState.AWAKE_IN_LID_CLODE] = this.checkBox4;

			foreach (KeyValuePair<uint, CheckBox> item in opt_cb_dic_)
			{
                uint opt = item.Key;
                CheckBox cb = item.Value;
                cb_opt_dic_[cb] = opt;
                cb.Text = Public.opt_name_dic_[opt];
				cb.Click += new System.EventHandler(this.OptionCBClick);
			}
            this.Text = Public.kProgramName;
			SetCheckBoxState();

            ts_setter_.AddValChangeCB(
					new TExcState.ValChangeCB(this.SetCheckBoxState));

            notify_icon_ = new MyNotifyIcon(this, ts_setter_, false);
        }

        private void SetValueFromCheckBox(object obj)
        {
            CheckBox cb = (CheckBox)obj;
            uint value = cb_opt_dic_[cb];
            if ( ! ts_setter_.TrySetState(value, cb.Checked)) {
                MessageBox.Show("系统不支持该选项");
            }
        }
		
		private void SetCheckBoxState()
        {
			// Set option state
			uint opt = ts_setter_.State;
			foreach (KeyValuePair<uint, CheckBox> item in opt_cb_dic_)
			{
                item.Value.Checked = ((opt & item.Key) != 0);
			}
        }

        private void OptionCBClick(object sender, EventArgs e)
        {
            SetValueFromCheckBox(sender);
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            notify_icon_.Dispose();
        }

		protected override void WndProc(ref Message m)
		{
			if (ts_setter_ != null && ts_setter_.PreMessageFilter(ref m))
			{
                return;
			}
			const int WM_SYSCOMMAND = 0x112;
			//const int SC_CLOSE = 0xF060;
			const int SC_MINIMIZE = 0xF020;
			//const int SC_MAXIMIZE = 0xF030;
            //if (true && (m.Msg == Win32API.WM_POWERBROADCAST) )
            //{
            //    MessageBox.Show("Power mode Changed! wndproc");
            //    return;
            //}
			if (m.Msg == WM_SYSCOMMAND)
			{
				if (m.WParam.ToInt32() == SC_MINIMIZE)
				{
					this.Hide();
					return;
				}
			}
			base.WndProc(ref m);
		}

		private void button1_Click(object sender, EventArgs e)
		{
			AboutBox1 about_box =  new AboutBox1();
			about_box.Show(this);
		}

		private TExcState ts_setter_;
        private MyNotifyIcon notify_icon_;

        Dictionary<uint, CheckBox> opt_cb_dic_ = new Dictionary<uint, CheckBox>();
        Dictionary<CheckBox, uint> cb_opt_dic_ = new Dictionary<CheckBox, uint>();

        private void Form1_Load(object sender, EventArgs e)
        {
            Text = Language.s(0) + " - " +Language.s(1);
            label1.Text = Language.s(5);
            checkBox1.Text = Language.s(6);
            checkBox3.Text = Language.s(7);
            checkBox2.Text = Language.s(8);
            checkBox4.Text = Language.s(9);
            button1.Text = Language.s(10);
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            //e.Cancel = true;
            //if (MessageBox.Show("将停止本程序所有功能并完全退出，继续？", "退出", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            //{
            //    e.Cancel = false;
            //    Application.Exit();
            //}
        }
    }
}
