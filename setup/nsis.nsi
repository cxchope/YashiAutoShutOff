; ��װ�����ʼ���峣��
!define PRODUCT_NAME "��ʫ�����Զ��ػ�"
!define PRODUCT_VERSION "1.2.2"
!define PRODUCT_PUBLISHER "��S����Ԋ"
!define PRODUCT_WEB_SITE "https://yoooooooooo.com/yashi/?p=4293"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\YashiAutoShutOff.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor /SOLID lzma

; ������װ����Ȩ��(vista,win7,win8)
RequestExecutionLevel admin

; ------ MUI �ִ����涨�� ------
!include "MUI2.nsh"

; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "C:\Users\yashi\GitHub\YashiAutoShutOff\setup\Header.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "C:\Users\yashi\GitHub\YashiAutoShutOff\setup\Header.bmp"
!define MUI_ICON "C:\Users\yashi\GitHub\YashiAutoShutOff\favicon.ico"
!define MUI_UNICON "C:\Users\yashi\GitHub\YashiAutoShutOff\favicon.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\Users\yashi\GitHub\YashiAutoShutOff\setup\Wizard.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "C:\Users\yashi\GitHub\YashiAutoShutOff\setup\Wizard.bmp"

; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!insertmacro MUI_PAGE_LICENSE "C:\Users\yashi\GitHub\YashiAutoShutOff\setup\license.txt"
; ���ѡ��ҳ��
!insertmacro MUI_PAGE_COMPONENTS
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��ʼ�˵�����ҳ��
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "��ʫ�����Զ��ػ�"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!define MUI_FINISHPAGE_RUN "$INSTDIR\YashiAutoShutOff.exe"
!insertmacro MUI_PAGE_FINISH

; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; ��װ�����������������
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "TradChinese"

; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "setup.exe"
ELiangID 56ZVL5NJHQ     /*  ��װͳ�������ƣ�����ʫ�����Զ��ػ���  */
InstallDir "$PROGRAMFILES\��ʫ�����Զ��ػ�"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUninstDetails show
BrandingText "Yashi Soft"

;��װ���汾�Ÿ�ʽ����Ϊx.x.x.x��4������,ÿ��������Χ0~65535,��:2.0.1.2
;��ʹ������ͳ��,�汾�Ž��������ֲ�ͬ�汾�İ�װ���,��ʱ�����û������д��ȷ�İ汾��
;!define INSTALL_VERSION "2.0.1.2"

;VIProductVersion "${INSTALL_VERSION}"
;VIAddVersionKey /LANG=${LANG_SimpChinese} "ProductName"      "��ʫ�����Զ��ػ�"
;VIAddVersionKey /LANG=${LANG_SimpChinese} "Comments"         "��ʫ�����Զ��ػ�(��S����Ԋ)"
;VIAddVersionKey /LANG=${LANG_SimpChinese} "CompanyName"      "��S����Ԋ"
;VIAddVersionKey /LANG=${LANG_SimpChinese} "LegalCopyright"   "��S����Ԋ(https://yoooooooooo.com/yashi/?p=4293)"
;VIAddVersionKey /LANG=${LANG_SimpChinese} "FileDescription"  "��ʫ�����Զ��ػ�"
;VIAddVersionKey /LANG=${LANG_SimpChinese} "ProductVersion"   "${INSTALL_VERSION}"
;VIAddVersionKey /LANG=${LANG_SimpChinese} "FileVersion"      "${INSTALL_VERSION}"

Section "������" SEC01
  SetOutPath "$INSTDIR"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiAutoShutOff.exe"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiAutoShutOff.exe.config"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiAutoShutOff.pdb"

; ������ʼ�˵���ݷ�ʽ
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateDirectory "$DESKTOP\${PRODUCT_NAME}����"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫ�����Զ��ػ�.lnk" "$INSTDIR\YashiAutoShutOff.exe"
  CreateShortCut "$DESKTOP\��ʫ�����Զ��ػ�.lnk" "$INSTDIR\YashiAutoShutOff.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫ���㶨ʱ�ػ�.lnk" "$INSTDIR\YashiShutOffMini.exe"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}����\��ʫ���㶨ʱ�ػ�.lnk" "$INSTDIR\YashiShutOffMini.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫWindows���ܼ������޸�����.lnk" "$INSTDIR\YashiAutoShutOffLodctr.exe"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}����\��ʫWindows���ܼ������޸�����.lnk" "$INSTDIR\YashiAutoShutOffLodctr.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫ��Ļȡɫ��.lnk" "$INSTDIR\YashiColorMeasurement.exe"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}����\��ʫ��Ļȡɫ��.lnk" "$INSTDIR\YashiColorMeasurement.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\������������ֹ����.lnk" "$INSTDIR\SleepPreventer.exe"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}����\������������ֹ����.lnk" "$INSTDIR\SleepPreventer.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\����Դ����.lnk" "$INSTDIR\YashiDownload.exe"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}����\����Դ����.lnk" "$INSTDIR\YashiDownload.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section "��Ϣ��ʾ����" SEC02
  SetOutPath "$INSTDIR"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiMsgViewer\bin\Release\YashiMsgViewer.com"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiMsgViewer\bin\Release\YashiMsgViewer.iobj"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiMsgViewer\bin\Release\YashiMsgViewer.ipdb"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiMsgViewer\bin\Release\YashiMsgViewer.pdb"
SectionEnd

Section "��Ļȡɫ��" SEC03
  SetOutPath "$INSTDIR"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiColorMeasurement\bin\Release\YashiColorMeasurement.exe"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiColorMeasurement\bin\Release\YashiColorMeasurement.exe.config"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiColorMeasurement\bin\Release\YashiColorMeasurement.pdb"
SectionEnd

Section "���ܼ������޸�����" SEC04
  SetOutPath "$INSTDIR"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOffLodctr\bin\Release\YashiAutoShutOffLodctr.exe"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOffLodctr\bin\Release\YashiAutoShutOffLodctr.exe.config"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOffLodctr\bin\Release\YashiAutoShutOffLodctr.pdb"
SectionEnd

Section "������������ֹ����" SEC05
  SetOutPath "$INSTDIR"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\SleepPreventer-master\SleepPreventer\bin\Release\SleepPreventer.exe"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\SleepPreventer-master\SleepPreventer\bin\Release\SleepPreventer.pdb"
SectionEnd

Section "��ݶ�ʱ�ػ�����" SEC06
  SetOutPath "$INSTDIR"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiShutOffMini\bin\Release\YashiShutOffMini.exe"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiShutOffMini\bin\Release\YashiShutOffMini.exe.config"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiShutOffMini\bin\Release\YashiShutOffMini.pdb"
SectionEnd

Section "LanguagePack:zh-CN" SEC07
  SetOutPath "$INSTDIR\Language"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\Language\YashiAutoShutOff_zh-CN.language"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiColorMeasurement\bin\Release\Language\YashiColorMeasurement_zh-CN.language"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOffLodctr\bin\Release\Language\YashiAutoShutOffLodctr_zh-CN.language"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\SleepPreventer-master\SleepPreventer\bin\Release\Language\SleepPreventer_zh-CN.language"
SectionEnd

Section "LanguagePack:zh-TW" SEC08
  SetOutPath "$INSTDIR\Language"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\Language\YashiAutoShutOff_zh-TW.language"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiColorMeasurement\bin\Release\Language\YashiColorMeasurement_zh-TW.language"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOffLodctr\bin\Release\Language\YashiAutoShutOffLodctr_zh-TW.language"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\SleepPreventer-master\SleepPreventer\bin\Release\Language\SleepPreventer_zh-TW.language"
SectionEnd

Section "Դ����������" SEC09
  SetOutPath "$INSTDIR"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiDownload\bin\Release\YashiDownload.exe"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiDownload\bin\Release\YashiDownload.exe.config"
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiDownload\bin\Release\YashiDownload.pdb"
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteINIStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\������ʫ�����Զ��ػ���ҳ.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\ж����ʫ�����Զ��ػ�.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\YashiAutoShutOff.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\YashiAutoShutOff.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; �����������
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "Main program|��ʫ�����Զ��ػ���������"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "Information display tool|������������ʱ������ͬ�������ǰϵͳ��Ϣ��������Ϊ��������ο���"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "Screen color picker|���԰�����ȡ�������ɫ���룬�Ա�����ɫģʽ������������"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "Performance counter repair|Windows���ܼ�������ʱ��������󣬵��±���������������������Գ����ô˹���һ���޸���"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC05} "Stop screen off and sleep|h46incon��д������ɫ�ⶨģʽ��Ӧ��ֹ��Ļ�رպ����ߣ���ֹʧ�ܡ�"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC06} "Mini program|�ǳ�С�ɵĶ�ʱ�ػ����򣬼���ռ��ϵͳ��Դ��"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC07} "�����������԰�|Simplified Chinese language pack"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC08} "���w���ģ��_�����Z�԰�|Traditional Chinese (Taiwan) language pack"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC09} "source downloader|��װԴ������������"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

/******************************
*  �����ǰ�װ�����ж�ز���  *
******************************/

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\YashiAutoShutOff.exe"
  Delete "$INSTDIR\YashiAutoShutOff.exe.config"
  Delete "$INSTDIR\YashiAutoShutOff.pdb"
  Delete "$INSTDIR\YashiMsgViewer.com"
  Delete "$INSTDIR\YashiMsgViewer.iobj"
  Delete "$INSTDIR\YashiMsgViewer.ipdb"
  Delete "$INSTDIR\YashiMsgViewer.pdb"
  Delete "$INSTDIR\YashiColorMeasurement.exe"
  Delete "$INSTDIR\YashiColorMeasurement.exe.config"
  Delete "$INSTDIR\YashiColorMeasurement.pdb"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.exe"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.exe.config"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.pdb"
  Delete "$INSTDIR\SleepPreventer.exe"
  Delete "$INSTDIR\SleepPreventer.pdb"
  Delete "$INSTDIR\YashiShutOffMini.exe"
  Delete "$INSTDIR\YashiShutOffMini.exe.config"
  Delete "$INSTDIR\YashiShutOffMini.pdb"
  Delete "$INSTDIR\YashiAutoShutOff_zh-CN.language"
  Delete "$INSTDIR\YashiColorMeasurement_zh-CN.language"
  Delete "$INSTDIR\YashiAutoShutOffLodctr_zh-CN.language"
  Delete "$INSTDIR\SleepPreventer_zh-CN.language"
  Delete "$INSTDIR\YashiAutoShutOff_zh-TW.language"
  Delete "$INSTDIR\YashiColorMeasurement_zh-TW.language"
  Delete "$INSTDIR\YashiAutoShutOffLodctr_zh-TW.language"
  Delete "$INSTDIR\SleepPreventer_zh-TW.language"
  Delete "$INSTDIR\YashiDownload.exe"
  Delete "$INSTDIR\YashiDownload.exe.config"
  Delete "$INSTDIR\YashiDownload.exe.pdb"

  Delete "$SMPROGRAMS\$ICONS_GROUP\������ʫ�����Զ��ػ���ҳ.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\ж����ʫ�����Զ��ػ�.lnk"

  Delete "$SMPROGRAMS\$ICONS_GROUP\��ʫ�����Զ��ػ�.lnk"
  Delete "$DESKTOP\��ʫ�����Զ��ػ�.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\��ʫ���㶨ʱ�ػ�.lnk"
  Delete "$DESKTOP\${PRODUCT_NAME}����\��ʫ���㶨ʱ�ػ�.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\��ʫWindows���ܼ������޸�����.lnk"
  Delete "$DESKTOP\${PRODUCT_NAME}����\��ʫWindows���ܼ������޸�����.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\��ʫ��Ļȡɫ��.lnk"
  Delete "$DESKTOP\${PRODUCT_NAME}����\��ʫ��Ļȡɫ��.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\������������ֹ����.lnk"
  Delete "$DESKTOP\${PRODUCT_NAME}����\������������ֹ����.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\����Դ����.lnk"
  Delete "$DESKTOP\${PRODUCT_NAME}����\����Դ����.lnk"


  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$DESKTOP\${PRODUCT_NAME}"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
SectionEnd

/* ���� NSIS �ű��༭����,���� Function ���α�������� Section ����֮���д,�Ա��ⰲװ�������δ��Ԥ֪������. */

Function un.onInit
FunctionEnd

Function un.onUninstSuccess
FunctionEnd
