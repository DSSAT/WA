unit DeleteProjFr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DynamicSkinForm, Vcl.StdCtrls, Vcl.Mask,
  SkinBoxCtrls, spSkinShellCtrls, Vcl.ComCtrls, SkinCtrls;

type
  TfrmDeleteProj = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinDirectoryEdit1: TspSkinDirectoryEdit;
    spSkinFileListView1: TspSkinFileListView;
    btnDelete: TspSkinButton;
    spSkinButton2: TspSkinButton;
    spSkinScrollBar1: TspSkinScrollBar;
    spSkinStdLabel1: TspSkinStdLabel;
    procedure FormShow(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure spSkinDirectoryEdit1Change(Sender: TObject);
    procedure spSkinFileListView1Click(Sender: TObject);
    procedure spSkinButton2Click(Sender: TObject);
  private
    { Private declarations }
    function DeleteEnable : boolean;
  public
    { Public declarations }
  end;

var
  frmDeleteProj: TfrmDeleteProj;

implementation

{$R *.dfm}

uses MainFr, ModDataFr;

procedure TfrmDeleteProj.FormShow(Sender: TObject);
begin
  spSkinDirectoryEdit1.Text := ProjectFolder;
  spSkinFileListView1.Root := spSkinDirectoryEdit1.Text;
  btnDelete.Enabled := DeleteEnable;
end;

procedure TfrmDeleteProj.btnDeleteClick(Sender: TObject);
begin
  DeleteFile(spSkinDirectoryEdit1.Text+'\'+spSkinFileListView1.Selected.Caption);
  spSkinFileListView1.Update;
  spSkinFileListView1.Refresh;
  btnDelete.Enabled := DeleteEnable;
end;

procedure TfrmDeleteProj.spSkinButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDeleteProj.spSkinDirectoryEdit1Change(Sender: TObject);
begin
  spSkinFileListView1.Root := spSkinDirectoryEdit1.Text;
  spSkinFileListView1.Update;
  spSkinFileListView1.Refresh;
  btnDelete.Enabled := DeleteEnable;
end;


procedure TfrmDeleteProj.spSkinFileListView1Click(Sender: TObject);
begin
  btnDelete.Enabled := DeleteEnable;
end;

function TfrmDeleteProj.DeleteEnable : boolean;
var
  i : integer;
begin
  Result := false;
  if (spSkinFileListView1.Items.Count<> 0) then
  begin
    for i := 0 to spSkinFileListView1.Items.Count - 1 do
      if spSkinFileListView1.Items.Item[i].Selected then
        Result := true;;
  end;
end;

end.
