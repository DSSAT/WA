unit MultiFr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DynamicSkinForm, Vcl.StdCtrls,
  SkinCtrls, Vcl.Mask, SkinBoxCtrls, spSkinShellCtrls;

type
  TfrmMulti = class(TForm)
    btnSave: TspSkinButton;
    btnCancel: TspSkinButton;
    spSkinPanel1: TspSkinPanel;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinFileEdit1: TspSkinFileEdit;
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinFileEdit2: TspSkinFileEdit;
    spSkinStdLabel3: TspSkinStdLabel;
    spSkinDirectoryEdit1: TspSkinDirectoryEdit;
    spSkinSaveDialog1: TspSkinSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure spSkinFileEdit1Change(Sender: TObject);
    procedure spSkinFileEdit2Change(Sender: TObject);
    procedure spSkinDirectoryEdit1Change(Sender: TObject);
  private
    function SaveEnabled : boolean;
  public
    { Public declarations }
  end;

var
  frmMulti: TfrmMulti;

implementation

{$R *.dfm}

uses MainFr;

procedure TfrmMulti.FormCreate(Sender: TObject);
begin
  spSkinFileEdit1.OD.Title := 'Select Incomplete Weather File';
  spSkinFileEdit2.OD.Title := 'Select MultiYears Historical Weather File';

  spSkinDirectoryEdit1.SD.DialogWidth := 380;
  spSkinDirectoryEdit1.SD.DialogHeight := 380;
  spSkinDirectoryEdit1.SD.Title := 'Select Folder for Predicted Weather File';
end;

function TfrmMulti.SaveEnabled : boolean;
begin
   Result := false;
   if (UpperCase(ExtractFileExt(spSkinFileEdit1.Text)) = '.WTH') and
      (UpperCase(ExtractFileExt(spSkinFileEdit2.Text)) = '.WTH') and
      (spSkinDirectoryEdit1.Text <> '') then
   Result := true;
end;


procedure TfrmMulti.spSkinDirectoryEdit1Change(Sender: TObject);
begin
  btnSave.Enabled := SaveEnabled;
end;

procedure TfrmMulti.spSkinFileEdit1Change(Sender: TObject);
begin
  btnSave.Enabled := SaveEnabled;
end;

procedure TfrmMulti.spSkinFileEdit2Change(Sender: TObject);
begin
  btnSave.Enabled := SaveEnabled;
end;

end.
