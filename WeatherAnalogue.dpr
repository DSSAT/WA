program WeatherAnalogue;

uses
  Forms,
  LMDClass,
  LMDUtils,
  MainFr in 'MainFr.pas' {MainForm},
  AboutFr in 'AboutFr.pas' {AboutFrm},
  ModDataFr in 'ModDataFr.pas' {ModData: TDataModule},
  ConfigureFr in 'ConfigureFr.pas' {frmConfigure},
  fmxutils in 'fmxutils.pas',
  MultiFr in 'MultiFr.pas' {frmMulti},
  SeparateFr in 'SeparateFr.pas' {frmSeparate},
  UpdateUnit in 'UpdateUnit.pas',
  WhatsNewFr in 'WhatsNewFr.pas' {WhatsNewFrm},
  DeleteProjFr in 'DeleteProjFr.pas' {frmDeleteProj},
  HelpFile in 'HelpFile.pas';

{$R *.res}

begin

  if LMDApplication.IsPrevRunning then
  begin
    LMDActivatePrevInstance;
    exit;
  end;

  Application.Initialize;

  Application.MainFormOnTaskBar := False;

  Application.HelpFile := 'C:\DSSAT47\Tools\WeatherAnalogue\WeatherAnalogue.chm';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TWhatsNewFrm, WhatsNewFrm);
  Application.CreateForm(TModData, ModData);
  Application.Run;
end.
