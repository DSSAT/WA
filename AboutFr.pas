unit AboutFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ShellAPI, Buttons, ComCtrls, ExtCtrls,
  Menus, ImgList, GIFImage,DynamicSkinForm, SkinCtrls,
  Registry, SkinTabs, jpeg, spButtonGroup, Vcl.Imaging.GIFImg;

type
  TAboutFrm = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinExPanel1: TspSkinExPanel;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinStdLabel3: TspSkinStdLabel;
    spSkinNotebook1: TspSkinNotebook;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    spSkinPageControl1: TspSkinPageControl;
    spSkinTabSheet1: TspSkinTabSheet;
    spSkinTextLabel1: TspSkinTextLabel;
    spSkinTabSheet2: TspSkinTabSheet;
    spSkinButtonGroup1: TspSkinButtonGroup;
    function  Get_MSInfo : String;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure WSU1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image3Click(Sender: TObject);
    procedure spSkinButtonGroup1Items0Click(Sender: TObject);
    procedure spSkinButtonGroup1Items1Click(Sender: TObject);
    procedure spSkinButtonGroup1Items2Click(Sender: TObject);
    procedure spSkinButtonGroup1Items3Click(Sender: TObject);
    procedure spSkinButtonGroup1Items4Click(Sender: TObject);
    procedure spSkinButtonGroup1Items5Click(Sender: TObject);
    procedure spSkinButtonGroup1Items6Click(Sender: TObject);
    procedure Item7(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutFrm: TAboutFrm;

implementation

Uses FMXUtils, ModDataFr, MainFr;

{$R *.DFM}

procedure TAboutFrm.SpeedButton1Click(Sender: TObject);
var
  Target  : string;
  ErrCode : integer;
begin
  Target := Get_MSINFO;
  if Target <> '' then
  begin
    ErrCode := ShellExecute (Application.Handle, PChar('open'),
               PChar (Target),PCHar (''),nil,SW_NORMAL);
    MainForm.HandleError (ErrCode,Target);
  end;
end;

function TAboutFrm.Get_MSInfo : String;
var
  Regist: TRegistry;
begin
  Regist := TRegistry.Create;
  Regist.RootKey := HKEY_LOCAL_MACHINE;
  if Regist.OpenKeyReadOnly('Software\Microsoft\Shared Tools\MSInfo') then
    Result := Regist.ReadString('Path')
  else
    Result := '';
  Regist.CloseKey;
  Regist.Free;
end;

procedure TAboutFrm.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TAboutFrm.FormShow(Sender: TObject);
begin
  spSkinPageControl1.ActivePageIndex := 0;
  spSkinNotebook1.PageIndex := 0;
  AboutFrm.Caption := 'About '+ MainForm.rzVersionInfo1.FileDescription;
  with spSkinTextLabel1 do
  begin
    Lines.Clear;
    Lines.Add (MainForm.rzVersionInfo1.FileDescription+' ('+ MainForm.rzVersionInfo1.FileVersion+')');
    Lines.Add ('Program executed '+IntToStr(ProgramStarts)+' times.');
    Lines.Add ('Legal Copyright © '+ MainForm.rzVersionInfo1.Copyright);
    Lines.Add ('Internal Filename: '+MainForm.rzVersionInfo1.InternalName);
    Lines.Add ('');
    Lines.Add ('DSSAT v4.7.0 Software');
    Lines.Add ('');
    Lines.Add ('G. Hoogenboom, C.H. Porter, V. Shelia, K.J. Boote,');
    Lines.Add ('U. Singh, J.W. White, L.A. Hunt, R. Ogoshi, J.I. Lizaso, J. Koo,');
    Lines.Add ('S. Asseng, A. Singels, L.P. Moreno, and J.W. Jones. 2017.');
    Lines.Add ('');
    Lines.Add ('');
    Lines.Add ('Decision Support System for Agrotechnology Transfer(DSSAT)');
    Lines.Add ('Version 4.7.0 (www.DSSAT.net)');
    Lines.Add ('DSSAT Foundation, Gainesville, Florida, USA.');
  end;

  spSkinStdLabel1.Caption := 'Serial Number '+RegNo;
  spSkinStdLabel2.Caption := 'Registered to Company '+Company;
  spSkinStdLabel3.Caption := 'Registered to User '+RegUser;
end;


procedure TAboutFrm.WSU1Click(Sender: TObject);
var
  ErrCode : integer;
  s       : string;
begin
  s := 'http://www.sasa.org.za/sasri.aspx';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
              PChar (s),PCHar(''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,s);
end;


procedure TAboutFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutFrm.Image3Click(Sender: TObject);
begin
  spSkinNotebook1.PageIndex := 0;
  spskintextlabel1.Visible  := true;
  spSkinNotebook1.PageIndex := 0;
end;

procedure TAboutFrm.spSkinButtonGroup1Items1Click(Sender: TObject);
var
  ErrCode : integer;
  WebSite : string;
begin

  WebSite := 'http://www.IFDC.org';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (WebSite),PCHar (''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,Website);
end;

procedure TAboutFrm.spSkinButtonGroup1Items2Click(Sender: TObject);
var
  ErrCode : integer;
  WebSite : string;
begin
  WebSite := 'http://www.ifpri.org/';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (WebSite),PCHar (''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,Website);
end;

procedure TAboutFrm.spSkinButtonGroup1Items3Click(Sender: TObject);
var
  ErrCode : integer;
  WebSite : string;
begin
  WebSite := 'http://www.ifas.ufl.edu/';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (WebSite),PCHar (''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,Website);
end;

procedure TAboutFrm.spSkinButtonGroup1Items0Click(Sender: TObject);
var
  ErrCode : integer;
  WebSite : string;
begin
  WebSite := 'http://dssat.net';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (WebSite),PCHar (''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,Website);
end;

procedure TAboutFrm.spSkinButtonGroup1Items4Click(Sender: TObject);
var
  ErrCode : integer;
  WebSite : string;
begin
  WebSite := 'http://www.uoguelph.ca/';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (WebSite),PCHar (''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,Website);
end;

procedure TAboutFrm.spSkinButtonGroup1Items5Click(Sender: TObject);
var
  ErrCode : integer;
  WebSite : string;
begin
  WebSite := 'http://www.ctahr.hawaii.edu';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (WebSite),PCHar (''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,Website);
end;

procedure TAboutFrm.spSkinButtonGroup1Items6Click(Sender: TObject);
var
  ErrCode : integer;
  WebSite : string;
begin
  WebSite := 'http://www1.etsia.upm.es/GRUPOSINV/AgSystems/ENGLISH/principaleng.htm';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (WebSite),PCHar (''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,Website);
end;

procedure TAboutFrm.Item7(Sender: TObject);
var
  ErrCode : integer;
  WebSite : string;
begin
  WebSite := 'http://www.ars.usda.gov/main/site_main.htm?modecode=53-47-00-00';
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (WebSite),PCHar (''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,Website);

end;

end.
