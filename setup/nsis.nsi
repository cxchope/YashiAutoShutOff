; �ýű�ʹ�� ������װ(az.eliang.com) ������
; ��װ�����ʼ���峣��
!define PRODUCT_NAME "��ʫ�����Զ��ػ�"
!define PRODUCT_VERSION "1.2.0"
!define PRODUCT_PUBLISHER "��S����Ԋ��CXC��"
!define PRODUCT_WEB_SITE "https://yoooooooooo.com/yashi/?p=4293"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\YashiAutoShutOff.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor /SOLID lzma
SetCompressorDictSize 32

; ������װ����Ȩ��(vista,win7,win8)
RequestExecutionLevel admin

; ------ MUI �ִ����涨�� ------
!include "MUI2.nsh"

; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "D:\SelfSync\YashiAutoShutOff\setup\Header.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "D:\SelfSync\YashiAutoShutOff\setup\Header.bmp"
!define MUI_ICON "D:\SelfSync\YashiAutoShutOff\YashiAutoShutOff\Resources\favicon.ico"
!define MUI_UNICON "D:\SelfSync\YashiAutoShutOff\YashiAutoShutOff\Resources\favicon.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "D:\SelfSync\YashiAutoShutOff\setup\Wizard.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "D:\SelfSync\YashiAutoShutOff\setup\Wizard.bmp"

; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!define MUI_LICENSEPAGE_RADIOBUTTONS
!insertmacro MUI_PAGE_LICENSE "D:\SelfSync\YashiAutoShutOff\setup\license.txt"
; ���ѡ��ҳ��
!insertmacro MUI_PAGE_COMPONENTS
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��ʼ�˵�����ҳ��
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "��ʫ���ܹػ�"
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
!insertmacro MUI_LANGUAGE "SimpChinese"

; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "setup.exe"
ELiangID 56ZVL5NJHQ     /*  ��װͳ�������ƣ�����ʫ�����Զ��ػ���  */
InstallDir "$PROGRAMFILES\��ʫ���ܹػ�"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUninstDetails show
BrandingText "KagYashi Software Installer"

;��װ���汾�Ÿ�ʽ����Ϊx.x.x.x��4������,ÿ��������Χ0~65535,��:2.0.1.2
;��ʹ������ͳ��,�汾�Ž��������ֲ�ͬ�汾�İ�װ���,��ʱ�����û������д��ȷ�İ汾��
!define INSTALL_VERSION "1.2.1.0"

VIProductVersion "${INSTALL_VERSION}"
VIAddVersionKey /LANG=${LANG_SimpChinese} "ProductName"      "��ʫ���ܹػ�"
VIAddVersionKey /LANG=${LANG_SimpChinese} "Comments"         "��ʫ���ܹػ�(��S����Ԋ��CXC��)"
VIAddVersionKey /LANG=${LANG_SimpChinese} "CompanyName"      "��S����Ԋ��CXC��"
VIAddVersionKey /LANG=${LANG_SimpChinese} "LegalCopyright"   "��S����Ԋ��CXC��(https://yoooooooooo.com/yashi/?p=4293)"
VIAddVersionKey /LANG=${LANG_SimpChinese} "FileDescription"  "��ʫ���ܹػ�"
VIAddVersionKey /LANG=${LANG_SimpChinese} "ProductVersion"   "${INSTALL_VERSION}"
VIAddVersionKey /LANG=${LANG_SimpChinese} "FileVersion"      "${INSTALL_VERSION}"

Section "������" SEC01
  SetOutPath "$INSTDIR"
  File "D:\SelfSync\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiAutoShutOff.exe"
  File "D:\SelfSync\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiAutoShutOff.exe.config"
  File "D:\SelfSync\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiAutoShutOff.pdb"

; ������ʼ�˵���ݷ�ʽ
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫ�����Զ��ػ�.lnk" "$INSTDIR\YashiAutoShutOff.exe"
  CreateShortCut "$DESKTOP\��ʫ�����Զ��ػ�.lnk" "$INSTDIR\YashiAutoShutOff.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫ���㶨ʱ�ػ�.lnk" "$INSTDIR\YashiShutOffMini.exe"
  CreateShortCut "$DESKTOP\��ʫ���㶨ʱ�ػ�.lnk" "$INSTDIR\YashiShutOffMini.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫWindows���ܼ������޸�����.lnk" "$INSTDIR\YashiAutoShutOffLodctr.exe"
  CreateShortCut "$DESKTOP\��ʫWindows���ܼ������޸�����.lnk" "$INSTDIR\YashiAutoShutOffLodctr.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫ��Ļȡɫ��.lnk" "$INSTDIR\YashiColorMeasurement.exe"
  CreateShortCut "$DESKTOP\��ʫ��Ļȡɫ��.lnk" "$INSTDIR\YashiColorMeasurement.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section "��Ϣ��ʾ����" SEC02
  SetOutPath "$INSTDIR"
  File "D:\SelfSync\YashiAutoShutOff\YashiMsgViewer\bin\Release\YashiMsgViewer.com"
  File "D:\SelfSync\YashiAutoShutOff\YashiMsgViewer\bin\Release\YashiMsgViewer.iobj"
  File "D:\SelfSync\YashiAutoShutOff\YashiMsgViewer\bin\Release\YashiMsgViewer.ipdb"
  File "D:\SelfSync\YashiAutoShutOff\YashiMsgViewer\bin\Release\YashiMsgViewer.pdb"
SectionEnd

Section "��Ļȡɫ��" SEC03
  SetOutPath "$INSTDIR"
  File "D:\SelfSync\YashiAutoShutOff\YashiColorMeasurement\bin\Release\YashiColorMeasurement.exe"
  File "D:\SelfSync\YashiAutoShutOff\YashiColorMeasurement\bin\Release\YashiColorMeasurement.exe.config"
  File "D:\SelfSync\YashiAutoShutOff\YashiColorMeasurement\bin\Release\YashiColorMeasurement.pdb"
SectionEnd

Section "���ܼ������޸�����" SEC04
  SetOutPath "$INSTDIR"
  File "D:\SelfSync\YashiAutoShutOff\YashiAutoShutOffLodctr\bin\Release\YashiAutoShutOffLodctr.exe"
  File "D:\SelfSync\YashiAutoShutOff\YashiAutoShutOffLodctr\bin\Release\YashiAutoShutOffLodctr.exe.config"
  File "D:\SelfSync\YashiAutoShutOff\YashiAutoShutOffLodctr\bin\Release\YashiAutoShutOffLodctr.pdb"
SectionEnd

Section "��ݶ�ʱ�ػ�����" SEC05
  SetOutPath "$INSTDIR"
  File "D:\SelfSync\YashiAutoShutOff\YashiShutOffMini\bin\Release\YashiShutOffMini.exe"
  File "D:\SelfSync\YashiAutoShutOff\YashiShutOffMini\bin\Release\YashiShutOffMini.exe.config"
  File "D:\SelfSync\YashiAutoShutOff\YashiShutOffMini\bin\Release\YashiShutOffMini.pdb"
SectionEnd

Section /O "Դ����(������)" SEC06
  SetOutPath "$INSTDIR"
  File "D:\SelfSync\YashiAutoShutOff\setup\downloadcode.bat"
  SetOverwrite ifnewer
  File "D:\wget.exe"
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteINIStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\������ʫ���ܹػ���ҳ.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\ж����ʫ���ܹػ�.lnk" "$INSTDIR\uninst.exe"
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
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "��ʫ�����Զ��ػ���������"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "������������ʱ������ͬ�������ǰϵͳ��Ϣ��������Ϊ��������ο���"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "���԰�����ȡ�������ɫ���룬�Ա�����ɫģʽ������������"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "Windows���ܼ�������ʱ��������󣬵��±���������������������Գ����ô˹���һ���޸���"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC05} "�ǳ�С�ɵĶ�ʱ�ػ����򣬼���ռ��ϵͳ��Դ��"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC06} "��װwget��Դ���������������ļ���"
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
  Delete "$INSTDIR\YashiAutoShutOff.vshost.exe"
  Delete "$INSTDIR\YashiAutoShutOff.vshost.exe.config"
  Delete "$INSTDIR\YashiAutoShutOff.vshost.exe.manifest"
  Delete "$INSTDIR\YashiMsgViewer.com"
  Delete "$INSTDIR\YashiMsgViewer.iobj"
  Delete "$INSTDIR\YashiMsgViewer.ipdb"
  Delete "$INSTDIR\YashiMsgViewer.pdb"
  Delete "$INSTDIR\YashiColorMeasurement.exe"
  Delete "$INSTDIR\YashiColorMeasurement.exe.config"
  Delete "$INSTDIR\YashiColorMeasurement.pdb"
  Delete "$INSTDIR\YashiColorMeasurement.vshost.exe"
  Delete "$INSTDIR\YashiColorMeasurement.vshost.exe.config"
  Delete "$INSTDIR\YashiColorMeasurement.vshost.exe.manifest"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.exe"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.exe.config"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.pdb"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.vshost.exe"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.vshost.exe.config"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.vshost.exe.manifest"
  Delete "$INSTDIR\YashiShutOffMini.exe"
  Delete "$INSTDIR\YashiShutOffMini.exe.config"
  Delete "$INSTDIR\YashiShutOffMini.pdb"
  Delete "$INSTDIR\YashiShutOffMini.vshost.exe"
  Delete "$INSTDIR\YashiShutOffMini.vshost.exe.config"
  Delete "$INSTDIR\YashiShutOffMini.xml"
  Delete "$INSTDIR\downloadcode.bat"
  Delete "$INSTDIR\wget.exe"

  Delete "$SMPROGRAMS\$ICONS_GROUP\������ʫ���ܹػ���ҳ.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\ж����ʫ���ܹػ�.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\��ʫ���ܹػ�.lnk"
  Delete "$DESKTOP\��ʫ���ܹػ�.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"


  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
SectionEnd

/* ���� NSIS �ű��༭����,���� Function ���α�������� Section ����֮���д,�Ա��ⰲװ�������δ��Ԥ֪������. */

Function un.onInit
FunctionEnd

Function un.onUninstSuccess
FunctionEnd
