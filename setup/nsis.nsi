; �ýű�ʹ�� ������װ(az.eliang.com) ������
; ��װ�����ʼ���峣��
!define PRODUCT_NAME "��ʫ�����Զ��ػ�"
!define PRODUCT_VERSION "1.1"
!define PRODUCT_PUBLISHER "��S����Ԋ"
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
!define MUI_HEADERIMAGE_BITMAP "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\Resources\mingYSN.png"
!define MUI_HEADERIMAGE_UNBITMAP "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\Resources\mingYSN.png"
!define MUI_ICON "C:\Users\yashi\GitHub\YashiAutoShutOff\favicon.ico"
!define MUI_UNICON "C:\Users\yashi\GitHub\YashiAutoShutOff\favicon.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\Resources\mingYSN.png"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\Resources\mingYSN.png"

; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!define MUI_LICENSEPAGE_RADIOBUTTONS
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
!insertmacro MUI_LANGUAGE "SimpChinese"

; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "setup.exe"
ELiangID 56ZVL5NJHQ     /*  ��װͳ�������ƣ�����ʫ�����Զ��ػ���  */
InstallDir "$PROGRAMFILES\��ʫ�����Զ��ػ�"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUninstDetails show
BrandingText "Kagurazaka Yashi"

;��װ���汾�Ÿ�ʽ����Ϊx.x.x.x��4������,ÿ��������Χ0~65535,��:2.0.1.2
;��ʹ������ͳ��,�汾�Ž��������ֲ�ͬ�汾�İ�װ���,��ʱ�����û������д��ȷ�İ汾��
!define INSTALL_VERSION "1.1.0.0"

VIProductVersion "${INSTALL_VERSION}"
VIAddVersionKey /LANG=${LANG_SimpChinese} "ProductName"      "��ʫ�����Զ��ػ�"
VIAddVersionKey /LANG=${LANG_SimpChinese} "Comments"         "��ʫ�����Զ��ػ�(��S����Ԋ)"
VIAddVersionKey /LANG=${LANG_SimpChinese} "CompanyName"      "��S����Ԋ"
VIAddVersionKey /LANG=${LANG_SimpChinese} "LegalCopyright"   "��S����Ԋ(https://yoooooooooo.com/yashi/?p=4293)"
VIAddVersionKey /LANG=${LANG_SimpChinese} "FileDescription"  "��ʫ�����Զ��ػ�"
VIAddVersionKey /LANG=${LANG_SimpChinese} "ProductVersion"   "${INSTALL_VERSION}"
VIAddVersionKey /LANG=${LANG_SimpChinese} "FileVersion"      "${INSTALL_VERSION}"

Section "��ʫ���ܹػ�" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiAutoShutOff.exe"

; ������ʼ�˵���ݷ�ʽ
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫ�����Զ��ػ�.lnk" "$INSTDIR\YashiAutoShutOff.exe"
  CreateShortCut "$DESKTOP\��ʫ�����Զ��ػ�.lnk" "$INSTDIR\YashiAutoShutOff.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\��ʫ���㶨ʱ�ػ�.lnk" "$INSTDIR\YashiShutOffMini.exe"
  CreateShortCut "$DESKTOP\��ʫ���㶨ʱ�ػ�.lnk" "$INSTDIR\YashiShutOffMini.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\�޸�Windows���ܼ�����.lnk" "$INSTDIR\YashiAutoShutOffLodctr.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section "HTTP���ӿ�" SEC05
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\System.Net.Http.dll"
SectionEnd

Section "��ʫ��ʱ�ػ�mini" SEC03
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiShutOffMini.exe"
SectionEnd

Section "Windows���ܼ������޸�����" SEC04
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiAutoShutOffLodctr.exe"
SectionEnd

Section "��ʫϵͳ��Ϣ��ʾ��" SEC02
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "C:\Users\yashi\GitHub\YashiAutoShutOff\YashiAutoShutOff\bin\Release\YashiMsgViewer.com"
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
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} ""
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} ""
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} ""
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} ""
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC05} ""
!insertmacro MUI_FUNCTION_DESCRIPTION_END

/******************************
*  �����ǰ�װ�����ж�ز���  *
******************************/

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\YashiAutoShutOff.exe"
  Delete "$INSTDIR\System.Net.Http.dll"
  Delete "$INSTDIR\YashiShutOffMini.exe"
  Delete "$INSTDIR\YashiAutoShutOffLodctr.exe"
  Delete "$INSTDIR\YashiMsgViewer.com"

  Delete "$SMPROGRAMS\$ICONS_GROUP\������ʫ�����Զ��ػ���ҳ.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\ж����ʫ�����Զ��ػ�.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\��ʫ�����Զ��ػ�.lnk"
  Delete "$DESKTOP\��ʫ�����Զ��ػ�.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\��ʫ���㶨ʱ�ػ�.lnk"
  Delete "$DESKTOP\��ʫ���㶨ʱ�ػ�.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\�޸�Windows���ܼ�����.lnk"

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
