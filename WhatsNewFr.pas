unit WhatsNewFr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DynamicSkinForm, Vcl.StdCtrls,
  SkinBoxCtrls, SkinCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, spMessages;

type
  TWhatsNewFrm = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    spSkinMemo1: TspSkinMemo;
    IdFTP1: TIdFTP;
    spSkinMessage1: TspSkinMessage;
    spSkinScrollBar1: TspSkinScrollBar;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WhatsNewFrm: TWhatsNewFrm;

implementation

{$R *.dfm}

uses MainFr;

procedure TWhatsNewFrm.FormShow(Sender: TObject);
begin
  try
  IdFTP1.Host := '6f7.a92.myftpupload.com';
  IdFTP1.Username := 'dssatupdater';
  IdFTP1.Password := 'xpm#sawk6Jlwf';
  IdFTP1.Port := 21;

  IdFTP1.Connect;
  IdFTP1.ChangeDir('waupdate');
  if IdFTP1.Connected then
  begin
   IdFTP1.Get('whatsnewwa.txt','c:\DSSAT47\Tools\WeatherAnalogue\whatsnewwa.txt',true);
   spSkinMemo1.Lines.LoadFromFile('c:\DSSAT47\Tools\WeatherAnalogue\whatsnewwa.txt');
  end;

  if assigned(IdFTP1) then
  begin
   IdFTP1.Disconnect;
   IdFTP1.Free;
  end;
  except
    spSkinMessage1.MessageDlg('Error connecting FTP site!', mtError, [mbOk], 0);
    exit;
  end;
end;

end.
