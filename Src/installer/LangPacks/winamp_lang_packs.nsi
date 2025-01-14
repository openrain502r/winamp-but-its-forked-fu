!define PRODUCT_NAME "Winamp Language Packs"
!define PRODUCT_VERSION "v1.7"
;!define PRODUCT_SUB_VERSION "1177"
!define WINAMP "Winamp"
!define MUI_COMPONENTSPAGE_SMALLDESC "Select which Language Packs to install"
!define MUI_FINISHPAGE_RUN_TEXT "Run Winamp"
!define /date MyTIMESTAMP "%Y/%m/%d at %H:%M:%S"
!define Minimal_Version "5.9"
!define UNINSTALLER "Uninstall_Winamp_Lang_Packs.exe"
!define UNINSTALL "Winamp Language Packs"

;Set Compression
SetCompress force
SetCompressor /solid lzma

; MUI 2.0 compatible ------
!include "MUI2.nsh"
!include "sections.nsh"
!include "LogicLib.nsh"
!include "WordFunc.nsh"
!include "WinVer.nsh"

XPStyle on
BrandingText "${PRODUCT_NAME} -- built on ${MyTIMESTAMP}"

; detect winamp path from uninstall string if available
InstallDirRegKey HKLM \
                 "Software\Microsoft\Windows\CurrentVersion\Uninstall\Winamp" \
                 "UninstallString"
				 
;Request Administrator Privileges
RequestExecutionLevel admin

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "graphics\wabanner.bmp"
!define MUI_HEADERTEXT
!define MUI_ICON "graphics\install.ico"
!define MUI_UNICON "graphics\uninstall.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "graphics\welcome55.bmp"

;Run Custom Function On Start For Winamp Checks
!define MUI_CUSTOMFUNCTION_GUIINIT My_GUIInit

;Version information for Windows Explorer
VIProductVersion "1.7.0.0"
VIAddVersionKey "ProductName" "${PRODUCT_NAME} ${PRODUCT_VERSION}"
VIAddVersionKey "Comments" "Winamp Language Packs Installer"
VIAddVersionKey "LegalCopyright" ""
VIAddVersionKey "Company" "Winamp SA"
VIAddVersionKey "FileDescription" "${PRODUCT_NAME} ${PRODUCT_VERSION} Installer"
VIAddVersionKey "FileVersion" "1.7.0.0"

; Welcome page
	
!define MUI_WELCOMEPAGE_TITLE "${PRODUCT_NAME}"
!define MUI_WELCOMEPAGE_TEXT "This package contains the following Language Packs:$\r$\n  \
													•  Dutch (Nederlands)$\r$\n  \
													•  French (Français)$\r$\n  \
													•  German (Deutsch)$\r$\n  \
													•  Hungarian (Magyar)$\r$\n  \
													•  Italian$\r$\n  \
													•  Indonesian (id-id)$\r$\n  \
													•  Japanese (ja-jp)$\r$\n  \
													•  Portuguese (pt-br)$\r$\n  \
													•  Romanian (ro-ro)$\r$\n  \
													•  Russian (Русский)$\r$\n  \
													•  Spanish (es-us)$\r$\n  \
													•  Swedish (sv-se)$\r$\n  \
													•  Turkish (Türkçe)$\r$\n  \
													•  Czech (cz-cz)$\r$\n  \
													•  Korean (ko-kr)$\r$\n  \
													•  Chinese (zh-cn | zh-tw)$\r$\n"

!insertmacro MUI_PAGE_WELCOME				
													
; Directory page
!define MUI_TEXT_DIRECTORY_TITLE "${PRODUCT_NAME}"
!define MUI_TEXT_DIRECTORY_SUBTITLE "Choose Folder"
DirText "Please select your Winamp path below; the installer will usually detect your Winamp installation path automatically (you will be able to proceed when Winamp is detected):"
!insertmacro MUI_PAGE_DIRECTORY

; Instfiles components
!define MUI_TEXT_COMPONENTS_TITLE "${PRODUCT_NAME}"
!define MUI_TEXT_COMPONENTS_SUBTITLE "Choose Components"
!define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Available Language Packs"
!define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Expand to deselect individual language packs"
!insertmacro MUI_PAGE_COMPONENTS

; Instfiles page
!define MUI_TEXT_INSTALLING_TITLE "${PRODUCT_NAME}"
!define MUI_TEXT_INSTALLING_SUBTITLE "Installing..."
!insertmacro MUI_PAGE_INSTFILES

; Finish page
!define MUI_TEXT_FINISH_TITLE "${PRODUCT_NAME}"
!define MUI_TEXT_FINISH_SUBTITLE "Done"
!define MUI_FINISHPAGE_RUN "$INSTDIR\winamp.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "graphics\welcome55.bmp"
!define MUI_UNWELCOMEPAGE_TEXT "This wizard will guide you through the uninstallation of ${PRODUCT_NAME}.$\n$\nBefore starting the uninstallation, make sure $WINAMP is not running.$\n$\nClick Next to continue."
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!define MUI_UNFINISHPAGE_TEXT "${PRODUCT_NAME} has been uninstalled from your $WINAMP installation.$\n$\nClick Finish to close this wizard."
!insertmacro MUI_UNPAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Winamp_Language_Packs_v1.7.exe"
InstallDir "$PROGRAMFILES\Winamp\"
ShowInstDetails hide

; Page components

SectionGroup "Winamp Language Packs" SEC01

Section "German (Deutsch)" SEC011
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-de-de.wlz"
SectionEnd

Section "Dutch (Nederlands)" SEC012
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-nl-nl.wlz"
SectionEnd

Section "French (Français)" SEC013
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-fr-fr.wlz"
SectionEnd

Section "Hungarian (Magyar)" SEC014
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-hu-hu.wlz"
SectionEnd

Section "Italian (it-it)" SEC015
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-it-it.wlz"
SectionEnd

Section "Japanese (ja-jp)" SEC016
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-ja-jp.wlz"
SectionEnd

Section "Korean (ko-kr)" SEC017
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-ko-kr.wlz"
SectionEnd

;Section "Polish (Polski)" SEC018
;SetOutPath "$INSTDIR\Lang"
;SetOverwrite on
;File "..\..\resources\languages\Winamp-pl-pl.wlz"
;SectionEnd

Section "Portuguese (pt-br)" SEC019
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-pt-br.wlz"
SectionEnd

Section "Romanian (ro-ro)" SEC0110
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-ro-ro.wlz"
SectionEnd

Section "Russian (Русский)" SEC0111
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-ru-ru.wlz"
SectionEnd

Section "Spanish (es-us)" SEC0112
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-es-us.wlz"
SectionEnd

Section "Swedish (sv-se)" SEC0113
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-sv-se.wlz"
SectionEnd

Section "Turkish (Türkçe)" SEC0114
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-tr-tr.wlz"
SectionEnd

Section "Czech (cz-cz)" SEC0118
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-cz-cz.wlz"
SectionEnd

Section "Indonesian (id-id)" SEC0115
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-id-id.wlz"
SectionEnd

Section "Chinese (zh-cn)" SEC0116
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-zh-cn.wlz"
SectionEnd

Section "Chinese/Taiwanese (zh-tw)" SEC0117
SetOutPath "$INSTDIR\Lang"
SetOverwrite on
File "..\..\resources\languages\Winamp-zh-tw.wlz"
SectionEnd

SectionGroupEnd

Section
 ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "DisplayName" "Winamp Language Packs"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "UninstallString" "$\"$INSTDIR\${UNINSTALLER}$\""
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "NoRepair" 1
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "Publisher" "Winamp SA"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "HelpLink" "http://forums.winamp.com/forumdisplay.php?f=169"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "InstallLocation" "$INSTDIR\Lang"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "URLInfoAbout" "http://forums.winamp.com/forumdisplay.php?f=8"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "URLUpdateInfo" "https://www.winamp.com"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "DisplayIcon" "$\"$INSTDIR\${UNINSTALLER}$\""
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "QuietUninstallString" "$\"$INSTDIR\${UNINSTALLER}$\" /S"
;  Call GetInstalledSize
;  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}" "EstimatedSize" "$GetInstalledSize.total"
WriteUninstaller "$INSTDIR\${UNINSTALLER}"
SectionEnd

Section "Uninstall"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL}"
  Delete "$INSTDIR\Lang\Winamp-de-de.wlz"
  Delete "$INSTDIR\Lang\Winamp-es-us.wlz"
  Delete "$INSTDIR\Lang\Winamp-it-it.wlz"
  Delete "$INSTDIR\Lang\Winamp-hu-hu.wlz"
  Delete "$INSTDIR\Lang\Winamp-id-id.wlz"
  Delete "$INSTDIR\Lang\Winamp-cz-cz.wlz"
  Delete "$INSTDIR\Lang\Winamp-ru-ru.wlz"
  Delete "$INSTDIR\Lang\Winamp-ro-ro.wlz"
  Delete "$INSTDIR\Lang\Winamp-fr-fr.wlz"
  Delete "$INSTDIR\Lang\Winamp-pt-br.wlz"
  Delete "$INSTDIR\Lang\Winamp-ja-jp.wlz"
  Delete "$INSTDIR\Lang\Winamp-sv-se.wlz"
  Delete "$INSTDIR\Lang\Winamp-zh-cn.wlz"
  Delete "$INSTDIR\Lang\Winamp-ko-kr.wlz"
  Delete "$INSTDIR\Lang\Winamp-zh-tw.wlz"
  Delete "$INSTDIR\Lang\Winamp-nl-nl.wlz"
  Delete "$INSTDIR\Lang\Winamp-tr-tr.wlz"
 ;Delete "$INSTDIR\Lang\Winamp-pl-pl.wlz"
  Delete "$INSTDIR\${UNINSTALLER}"
SectionEnd

Function GetFileVersion

   !define GetFileVersion `!insertmacro GetFileVersionCall`
   !macro GetFileVersionCall _FILE _RESULT
      Push `${_FILE}`
      Call GetFileVersion
      Pop ${_RESULT}
   !macroend

   Exch $0
   Push $1
   Push $2
   Push $3
   Push $4
   Push $5
   Push $6
   ClearErrors

   GetDllVersion '$0' $1 $2
   IfErrors error
       IntOp $3 $1 / 0x00010000
       IntOp $4 $1 & 0x0000FFFF
       IntOp $5 $2 / 0x00010000
       IntOp $6 $2 & 0x0000FFFF
       StrCpy $0 '$3.$4.$5.$6'
   goto end

   error:
      SetErrors
      StrCpy $0 ''

   end:
   Pop $6
   Pop $5
   Pop $4
   Pop $3
   Pop $2
   Pop $1
   Exch $0

FunctionEnd

Function CheckWinampVersion

	${GetFileVersion} "$INSTDIR\winamp.exe" $R0 ; Get Winamp.exe version information, $R0 = Actual Version
		
	${if} $R0 != "" ; check if Version info is not empty
		${VersionCompare} $R0 ${Minimal_Version} $R1 ; $R1 = Result $R1=0  Versions are equal, $R1=1  Version1 is newer, $R1=2  Version2 is newer
		${if} $R1 = "2"
			MessageBox MB_OK "Winamp Language Packs require at least Winamp ${Minimal_Version} or above.$\r$\nPlease update your Winamp version before you can install this update.$\r$\nInstallation will now be aborted."
			Quit
		${EndIf}		
	${Else}
		MessageBox MB_OK "Winamp wasn't detected on this system.$\r$\nPlease install the latest Winamp version from Winamp.com$\r$\nbefore you can install this update.$\r$\nInstallation will now be aborted." ; version info is empty, something goes wrong. Display message and exit
		Quit
	${EndIf}
			
FunctionEnd

Function CheckWinampInstallation

	;MessageBox MB_OK "$INSTDIR\winamp.exe"

	${If} ${FileExists} "$INSTDIR\winamp.exe" ;check if Winamp.exe exists
		;
	${Else}
		MessageBox MB_OK "Winamp wasn't detected on this system.$\r$\nPlease install the latest Winamp version from Winamp.com$\r$\nbefore you can install this plugin update.$\r$\nInstallation will now be aborted." ;no winamp.exe
		Quit
	${EndIf}

FunctionEnd

;Detect WindowsVersion and running Winamp instances

Function .onInit

	; check windows version

	${If} ${IsWin95}
	${OrIf} ${IsWinNT4}
	${OrIf} ${IsWin98}
	${OrIf} ${IsWinME}
	${OrIf} ${IsWin2000}
	${OrIf} ${IsWinXP}
		MessageBox MB_OK|MB_ICONEXCLAMATION "Windows version too old!$\r$\nThis update will not run on Windows 9x/NT4/ME/2k/XP.$\r$\nInstallation will now be aborted."
		Quit
	${EndIf}

/*	
	${If} ${IsWinXP}
	${OrIf} ${IsWin2003}
		MessageBox MB_OK|MB_ICONEXCLAMATION "This update is not recommended for Windows XP.$\r$\n$\r$\nInstallation will now be aborted."
		Quit
	${EndIf}
*/
!define WINAMP_FILE_EXIT 40001

!ifdef INTERCEPT_MULTIPLE_INSTANCES
  System::Call 'kernel32::CreateMutexA(i 0, i 0, t "WinampMbApiSetup") i .r1 ?e'
  Pop $R0

  StrCmp $R0 0 noprevinst
    ReadRegStr $R0 HKCU "${PLUGIN_INSTREGKEY}" "WindowHandle"
    System::Call 'user32::SetForegroundWindow(i $R0) i ?e'
    Abort
	
  noprevinst:
!endif

  FindWindow $R0 "Winamp v1.x"
  IntCmp $R0 0 ok
    MessageBox MB_YESNO|MB_ICONEXCLAMATION "Please close all instances of Winamp before installing this update!$\r$\n\
Close Winamp now?" IDYES checkagain IDNO no
    checkagain:
      FindWindow $R0 "Winamp v1.x"
      IntCmp $R0 0 ok
      SendMessage $R0 ${WM_COMMAND} ${WINAMP_FILE_EXIT} 0
      Goto checkagain
    no:
       ; quit installer
  ok:

FunctionEnd

Function My_GUIInit
	Call CheckWinampInstallation
	Call CheckWinampVersion
FunctionEnd
