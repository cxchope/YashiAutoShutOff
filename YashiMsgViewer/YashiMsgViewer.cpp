// YashiMsgViewer.cpp : �������̨Ӧ�ó������ڵ㡣
//

#include "stdafx.h"
#include <windows.h>
#include <string>
#include <iostream>
using namespace std;
int main(int argc, char* argv[])
{
	string name = "Yashi application message viewer";
	string docmd = "title " + name;
	system(docmd.c_str());
	if (argc == 2 && (strcmp(argv[1], "-viewer")==0 || strcmp(argv[1], "--viewer")==0 || strcmp(argv[1], "/viewer")==0)) {
		system("cls");
		bool run = true;
		bool echo = true;
		bool time = false;
		try {
			while (run)
			{
				string cmd;
				cmd.resize(100);
				getline(cin, cmd);
				if (cmd.compare("@exit") == 0)
				{
					run = false;
				}
				else if ((cmd.compare("@clear") == 0) || (cmd.compare("@cls") == 0))
				{
					system("cls");
				}
				else if ((cmd.compare("@echo on") == 0))
				{
					echo = true;
				}
				else if ((cmd.compare("@echo off") == 0))
				{
					echo = false;
				}
				else if ((cmd.compare("@time on") == 0))
				{
					time = true;
				}
				else if ((cmd.compare("@time off") == 0))
				{
					time = false;
				}
				else if (cmd.length() > 6 && cmd.substr(0, 7).compare("@title ") == 0)
				{
					system(cmd.c_str());
				}
				else
				{
					if (echo)
					{
						if (time)
						{
							SYSTEMTIME st = { 0 };
							GetLocalTime(&st);
							printf("[%d-%02d-%02d %02d:%02d:%02d:%03d] ",st.wYear,st.wMonth,st.wDay,st.wHour,st.wMinute,st.wSecond,st.wMilliseconds);
						}
						printf(cmd.c_str());
						printf("\n");
					}
				}
			}
			system("cls");
		}
		catch (double e) {
			printf("Yashi application message viewer error: %g", e);
			return (int)e;
		}
	}
	else if (argc == 2 && (strcmp(argv[1], "-help")==0 || strcmp(argv[1], "--help")==0 || strcmp(argv[1], "/help")==0 || strcmp(argv[1], "/?")==0))
	{
		printf("��ʫ�����Ϣ��ʾ����\n\n");
		printf("�÷��� <thisapp> [ --viewer | --help ]\n");
		printf("û�в�������ʾ��ʾ�˳���\n");
		printf("--viewer������ģʽ������\n");
		printf("--help����ʾ�˰�����\n");
		printf("\n�����﷨��\n");
		printf("@exit���˳��˳���\n");
		printf("@echo [ on | off ]����ʾ���������Ĭ��on����\n");
		printf("@time [ on | off ]����ʾʱ�䣨Ĭ��off����\n");
		printf("@cls / clear����������\n");
		printf("@title�����ñ�������ʾ���֡�\n");
		printf("������¼����Ϣ��\n\n");
		system("pause");
	}
	else
	{
		printf("�����������ʫӦ���е�һ���֣����ܵ������С�\n");
		system("pause");
	}
	
    return 0;
	
}

