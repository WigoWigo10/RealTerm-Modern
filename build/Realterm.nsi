; Script for RealTerm-Modern

; --- DEFINIÇÕES DO PROJETO ---
!define PRODUCT_NAME "RealTerm"
!define PRODUCT_VERSION "3.0.0.0" ; MODIFICADO: Versão inicial da modernização
!define PRODUCT_PUBLISHER "Seu Nome ou Grupo" ; MODIFICADO
!define PRODUCT_WEB_SITE "https://github.com/WigoWigo10/RealTerm-Modern" ; MODIFICADO

; --- CAMINHOS RELATIVOS (BASEADO NA LOCALIZAÇÃO DESTE SCRIPT) ---
; MODIFICADO: Removemos o SOURCEDIR fixo e usamos caminhos relativos
!define PROJECT_ROOT ".." ; A raiz do projeto está um nível acima da pasta /build
!define BIN_DIR "${PROJECT_ROOT}\bin\Win32\Release" ; Pega o executável da compilação Release
!define ASSETS_DIR "${PROJECT_ROOT}\assets" ; Para arquivos como fontes, ícones, etc.
!define DOCS_DIR "${PROJECT_ROOT}\docs"
!define SRC_DIR "${PROJECT_ROOT}\src"
!define LIB_DIR "${PROJECT_ROOT}\lib"
!define README_FILE "${PROJECT_ROOT}\README.md"
!define LICENSE_FILE "${PROJECT_ROOT}\LICENSE"

SetCompressor lzma

; --- CONFIGURAÇÃO DA INTERFACE (MUI) ---
!include "MUI2.nsh" ; MODIFICADO: Usando a versão moderna da UI

!define MUI_ABORTWARNING
!define MUI_ICON "${ASSETS_DIR}\realterm_Icon.ico" ; MODIFICADO: Usar um ícone do projeto
!define MUI_UNICON "${ASSETS_DIR}\realterm_Icon.ico" ; MODIFICADO

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "${LICENSE_FILE}" ; MODIFICADO: Adiciona página de licença
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_SHOWREADME "${README_FILE}" ; MODIFICADO: Mostrar o README.md
!define MUI_FINISHPAGE_RUN "$INSTDIR\realterm.exe"
!define MUI_FINISHPAGE_RUN_PARAMETERS "/regserver"
!define MUI_FINISHPAGE_RUN_TEXT "Register Realterm automation server"
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

; --- CONFIGURAÇÕES GERAIS DO INSTALADOR ---
Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "${PROJECT_ROOT}\${PRODUCT_NAME}_${PRODUCT_VERSION}_setup.exe" ; MODIFICADO: Salva o instalador na raiz
InstallDir "$PROGRAMFILES\RealTerm"
InstallDirRegKey HKLM "Software\${PRODUCT_NAME}" "Install_Dir"
ShowInstDetails show
ShowUnInstDetails show

; --- SEÇÃO PRINCIPAL DE INSTALAÇÃO ---
Section "RealTerm (Required)" SEC01
  SectionIn RO
  SetOutPath "$INSTDIR"

  ; MODIFICADO: Copia os arquivos das pastas corretas
  File "${BIN_DIR}\realterm.exe"
  File "${README_FILE}"
  File "${LICENSE_FILE}"

  ; Supondo que você criou uma pasta 'assets' para estes arquivos
  File "${ASSETS_DIR}\term_hex.FON"
  File "${ASSETS_DIR}\hexcsv2dec.exe"

  ; Instalar fonte
  !insertmacro InstallFONFont "${ASSETS_DIR}\term_hex.FON"
  SendMessage ${HWND_BROADCAST} ${WM_FONTCHANGE} 0 0 /TIMEOUT=5000

  ; Criar atalhos
  CreateDirectory "$SMPROGRAMS\RealTerm"
  CreateShortCut "$SMPROGRAMS\RealTerm\RealTerm.lnk" "$INSTDIR\realterm.exe"
  CreateShortCut "$DESKTOP\RealTerm.lnk" "$INSTDIR\realterm.exe"
  CreateShortCut "$SMPROGRAMS\RealTerm\Uninstall.lnk" "$INSTDIR\uninstall.exe"
SectionEnd

Section "Documentation" SEC02
  SetOutPath "$INSTDIR\docs"
  File "${DOCS_DIR}\change_log.txt"
  
  CreateShortCut "$SMPROGRAMS\RealTerm\Change Log.lnk" "$INSTDIR\docs\change_log.txt"
SectionEnd

; --- SEÇÃO DE DESINSTALAÇÃO ---
Section "Uninstall"
  ; Deletar arquivos e pastas
  Delete "$INSTDIR\realterm.exe"
  Delete "$INSTDIR\README.md"
  Delete "$INSTDIR\LICENSE"
  Delete "$INSTDIR\term_hex.FON"
  Delete "$INSTDIR\hexcsv2dec.exe"
  RMDir /r "$INSTDIR\docs"

  ; Deletar atalhos
  Delete "$SMPROGRAMS\RealTerm\*.lnk"
  Delete "$DESKTOP\RealTerm.lnk"
  RMDir "$SMPROGRAMS\RealTerm"

  ; Deletar chaves de registro
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
  DeleteRegKey HKLM "Software\${PRODUCT_NAME}"
SectionEnd