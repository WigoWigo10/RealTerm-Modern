program realterm;

{%File 'Readme.txt'}
{%File 'change_log.txt'}

uses
  Forms,
  Graphics,
  // gnugettext in 'gnugettext.pas', {-> REMOVIDO TEMPORARIAMENTE}
  PicProgN in 'PicProgN.pas',
  realterm1 in 'realterm1.pas' {Form1},
  { ADSpcEmu in 'ADSpcEmu.pas', -> REMOVIDO TEMPORARIAMENTE (depende de AsyncPro) }
  { StBits in '..\..\units\turbopower\systools\source\StBits.pas', -> REMOVIDO TEMPORARIAMENTE (caminho antigo) }
  M545X in 'M545X.pas',
  RTAboutBox in 'RTAboutBox.pas' {AboutBox},
  EscapeString in 'EscapeString.pas',
  ModbusCRC in 'ModbusCRC.pas',
  realterm_TLB in 'realterm_TLB.pas',
  RealtermIntf in 'RealtermIntf.pas' {RealtermIntf: CoClass},
  SpyNagDialog in 'SpyNagDialog.pas' {SpyNagDlg},
  { D6OnHelpFix in 'D6OnHelpFix.pas', -> REMOVIDO TEMPORARIAMENTE (provavelmente obsoleto) }
  ScanPorts in 'ScanPorts.pas' {FormScanPorts},
  { HexStringForm in 'HexStringForm.pas' {PagesDlg}, -> REMOVIDO TEMPORARIAMENTE (pode ter dependências) }
  CRC8 in 'CRC8.pas',
  HexEmulator in 'HexEmulator.pas',
  Checksums in 'Checksums.pas',
  { sc in '..\..\units\TetaSerialCop 2.0\SOURCE\Sc.pas', -> REMOVIDO TEMPORARIAMENTE (caminho antigo) }
  I2Cx in 'I2Cx.pas',
  ComportFinder in 'ComportFinder.pas';

{$R *.TLB}

{$R *.RES}

begin
  // Use delphi.mo for runtime library translations, if it is there
  AddDomainForResourceString('delphi');

  // This one is not needed, because 'Arial' should not be translated,
  // but is here as an example
  TP_GlobalIgnoreClass(TFont);

  Application.Initialize;
  Application.Title := 'Realterm: Serial Capture and Binary Terminal';
  FormScanPorts:=TFormScanPorts.Create(Application);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSpyNagDlg, SpyNagDlg);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TPagesDlg, PagesDlg);
  Application.Run;
end.
