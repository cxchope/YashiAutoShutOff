﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace YashiColorMeasurement
{
    public partial class Form1 : Form
    {
        bool isdebug = false;
        string olddebug = "";

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Text = Language.s(0) + " - " + Language.s(1);
            label1.Text = Language.s(2) + ":";
            label2.Text = Language.s(3) + ":";
            label3.Text = Language.s(4) + ":";
            label4.Text = Language.s(5);
            button1.Text = Language.s(6) + " Alt+&Z " + Language.s(7);
#if DEBUG
            isdebug = true;
            Text = Text + "(DEBUG)";
#endif
            Location = new Point(Screen.PrimaryScreen.Bounds.Width - this.Size.Width - 100, Screen.PrimaryScreen.Bounds.Height - this.Size.Height - 100); //设置初始窗口位置  
        }

        private void button1_Click(object sender, EventArgs e)
        {
            pictureBox4.BackColor = pictureBox5.BackColor;
            pictureBox3.Visible = !pictureBox3.Visible;
            timer1.Enabled = !pictureBox3.Visible;
        }

        private void textBox1_DoubleClick(object sender, EventArgs e)
        {
            timer2.Enabled = false;
            textBox1.SelectAll();
            Clipboard.SetDataObject(textBox1.Text);
            pictureBox6.Visible = true;
            timer2.Enabled = true;
        }

        private void textBox2_DoubleClick(object sender, EventArgs e)
        {
            timer2.Enabled = false;
            textBox2.SelectAll();
            Clipboard.SetDataObject(textBox2.Text);
            pictureBox6.Visible = true;
            timer2.Enabled = true;
        }

        private void textBox3_DoubleClick(object sender, EventArgs e)
        {
            timer2.Enabled = false;
            textBox3.SelectAll();
            Clipboard.SetDataObject(textBox3.Text);
            pictureBox6.Visible = true;
            timer2.Enabled = true;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            int[] c = Screenshot.mousePixelColorXYRGBA();
            textBox1.Text = c[0] + " , " + c[1];
            textBox2.Text = c[2] + " , " + c[3] + " , " + c[4];
            textBox3.Text = c[0] + "-" + c[1] + "-" + c[2] + "-" + c[3] + "-" + c[4];
            if (isdebug && !textBox3.Text.Equals(olddebug))
            {
                Console.WriteLine("[" + DateTime.Now.ToString() + ":" + DateTime.Now.Millisecond + "] " + textBox3.Text);
                olddebug = textBox3.Text;
            }
            pictureBox5.BackColor = Color.FromArgb(c[2], c[3], c[4]);
            textBox4.Text = ColorTranslator.ToHtml(pictureBox5.BackColor);
        }

        private void Form1_Activated(object sender, EventArgs e)
        {
            panel1.Visible = false;
        }

        private void Form1_Deactivate(object sender, EventArgs e)
        {
            panel1.Visible = true;
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            pictureBox6.Visible = false;
            timer2.Enabled = false;
        }

        private void textBox4_DoubleClick(object sender, EventArgs e)
        {
            timer2.Enabled = false;
            textBox4.SelectAll();
            Clipboard.SetDataObject(textBox4.Text);
            pictureBox6.Visible = true;
            timer2.Enabled = true;
        }
    }
}
