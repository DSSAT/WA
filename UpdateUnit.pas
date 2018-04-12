unit UpdateUnit;

interface
  function IsConnectedToInternet: Boolean;
  procedure CheckforUpdates;

const
 INTERNET_CONNECTION_MODEM = 1;
 INTERNET_CONNECTION_LAN = 2;
 INTERNET_CONNECTION_PROXY = 4;
 INTERNET_CONNECTION_MODEM_BUSY = 8;

implementation

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl,
  ToolWin, ComCtrls, ImgList, Menus, ShellAPI, ExtCtrls, ShlObj, URLMon,
  ExtDlgs, Buttons, ActiveX, SkinHint, SkinData, DynamicSkinForm,
  SkinCtrls, SkinPrinter, SkinMenus, SkinBoxCtrls, spSkinShellCtrls,
  spMessages, SkinTabs, spButtonGroup, SkinExCtrls,
  WUpdate,
  WhatsNewFr, MainFr;


function InternetGetConnectedState(lpdwFlags: LPDWORD;
      dwReserved: DWORD): BOOL; stdcall; external 'WININET.DLL';

function IsConnectedToInternet: Boolean;
var
  dwConnectionTypes: Integer;
begin
 try
  dwConnectionTypes := INTERNET_CONNECTION_MODEM +
                       INTERNET_CONNECTION_LAN +
                       INTERNET_CONNECTION_PROXY;
  if InternetGetConnectedState(@dwConnectionTypes, 0) then
    Result := true
  else
    Result := false;
 except
  Result := false;
 end;
end;

function Whatsnew : Boolean;
var
  WhatsNewFrm : TWhatsNewFrm;
begin
  WhatsNewFrm := TWhatsNewFrm.Create(nil);
  try
    WhatsNewFrm.ShowModal;

    if FileExists('c:\DSSAT47\Tools\WeatherAnalogue\whatsnewwa.txt') then
      DeleteFile('c:\DSSAT47\Tools\WeatherAnalogue\whatsnewwa.txt');

    case WhatsNewFrm.ModalResult of
        mrOk : result := true;
        mrCancel : result := false;
    end;
  finally
    WhatsNewFrm.Free;
  end;
end;

procedure CheckforUpdates;
var
  WebUpdate1: TWebUpdate;
begin
   try
      try
        WebUpdate1 := TWebUpdate.Create(nil);
        If IsConnectedToInternet Then
        begin
          WebUpdate1.FTPPassive := true;
          WebUpdate1.Port := 21;
          WebUpdate1.UpdateType := ftpUpdate;
          WebUpdate1.ShowDownloadProgress := true;

          WebUpdate1.Host := '6f7.a92.myftpupload.com';
          WebUpdate1.UserID := 'dssatupdater';
          WebUpdate1.Password := 'xpm#sawk6Jlwf';
          Webupdate1.FTPDirectory := 'waupdate';
          WebUpdate1.URL := 'ftp://6f7.a92.myftpupload.com/waupdate/version.INF';
          WebUpdate1.TimeOut := 180000;
          if WebUpdate1.NewVersionAvailable then
          begin
            if MainForm.spSkinMessage1.MessageDlg ('There is a new version of WeatherAnalogue is available.'+chr(13)+
               'Would you like to update?', mtConfirmation, [mbYes, mbNo], 0) = MrNo
            then
               //Close
               Exit
            else
            begin
               if whatsnew then
               begin
                 if MainForm.spSkinMessage1.MessageDlg ('Download update file(s)?', mtConfirmation, [mbYes, mbNo], 0) = MrYes
                 then
                   WebUpdate1.DoUpdate(true)
                 else
                   exit;
               end
               else
                 exit;
            end;
          end
          else
          begin
            MainForm.spSkinMessage1.MessageDlg('No new version of WeatherAnalogue is available!', mtInformation,
                 [mbOk], 0);
          end;
        end
        else
            MainForm.spSkinMessage1.MessageDlg('No Internet connection!', mtInformation, [mbOk], 0);
      except
           begin
             MainForm.spSkinMessage1.MessageDlg('Error connecting FTP site!', mtError, [mbOk], 0);
             exit;
           end;
      end;
   finally
    WebUpdate1.Free;
   end;
end;


end.
