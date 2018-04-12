unit MainFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ShellAPI,
  Math, SkinCtrls, SkinBoxCtrls, SkinData, DynamicSkinForm,
  Mask, spSkinShellCtrls, Menus, spMessages,
  SkinHint, GIFImage, SkinExCtrls, jpeg, ImgList, sppngimagelist, Registry,
  RzStatus, Vcl.FileCtrl, Vcl.HTMLHelpViewer, System.ImageList;

type
  TMainForm = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinData1: TspSkinData;
    spCompressedStoredSkin1: TspCompressedStoredSkin;
    spSkinMainMenuBar1: TspSkinMainMenuBar;
    spSkinMainMenu1: TspSkinMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    spSkinMessage1: TspSkinMessage;
    spSkinHint1: TspSkinHint;
    spSkinNotebook1: TspSkinNotebook;
    spSkinGroupBox1: TspSkinGroupBox;
    spSkinScrollBar1: TspSkinScrollBar;
    spSkinScrollBar2: TspSkinScrollBar;
    rgrChoice: TspSkinRadioGroup;
    spSkinGroupBox2: TspSkinGroupBox;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel2: TspSkinStdLabel;
    sfeSep: TspSkinFileEdit;
    sfeMulti: TspSkinFileEdit;
    spSkinGroupBox3: TspSkinGroupBox;
    cboYearsType: TspSkinComboBox;
    btnGo: TspSkinButton;
    spSkinListBox1: TspSkinListBox;
    spSkinLinkImage1: TspSkinLinkImage;
    spSkinGroupBox4: TspSkinGroupBox;
    spSkinStdLabel6: TspSkinStdLabel;
    sseGroupSize: TspSkinSpinEdit;
    spSkinMenuEx1: TspSkinMenuEx;
    RichEditLOG: TspSkinMemo;
    HelpMenu1: TMenuItem;
    HelpContentsItem1: TMenuItem;
    HelpSearchItem1: TMenuItem;
    HelpHowToUseItem1: TMenuItem;
    N5: TMenuItem;
    Reportaproblem1: TMenuItem;
    N6: TMenuItem;
    HelpAboutItem1: TMenuItem;
    SmallImageList: TImageList;
    spSkinWaveLabel1: TspSkinWaveLabel;
    Configure1: TMenuItem;
    btnViewProj: TspSkinButton;
    RzVersionInfo1: TRzVersionInfo;
    mnuSep: TMenuItem;
    spPngImageList2: TspPngImageList;
    OpenProject1: TMenuItem;
    ImageList1: TImageList;
    spSkinToolBar1: TspSkinToolBar;
    spSkinSpeedButOpen: TspSkinSpeedButton;
    spSkinSpeedButClear: TspSkinSpeedButton;
    spSkinSpeedButRun: TspSkinSpeedButton;
    spSkinSpeedButConf: TspSkinSpeedButton;
    spSkinSpeedButton5: TspSkinSpeedButton;
    spSkinSpeedButExit: TspSkinSpeedButton;
    spSkinStatusPanel1: TspSkinStatusPanel;
    btnRun: TspSkinButton;
    mnuNew1: TMenuItem;
    mnuFileSep: TMenuItem;
    Edit1: TMenuItem;
    Edit2: TMenuItem;
    Delete1: TMenuItem;
    btnSave: TspSkinButton;
    btnClear: TspSkinButton;
    N1: TMenuItem;
    mnuFileMulti1: TMenuItem;
    flbProjects: TFileListBox;
    btnDelete: TspSkinButton;
    N2: TMenuItem;
    btnEditProj: TspSkinButton;
    spSkinSpeedButtonHome: TspSkinSpeedButton;
    spSkinOpenDialog1: TspSkinOpenDialog;
    N3: TMenuItem;
    CheckforUpdates1: TMenuItem;
    spSkinSaveDialog1: TspSkinSaveDialog;
    SepProj: TspSkinSpeedButton;
    MultiYearProj: TspSkinSpeedButton;
    procedure HandleError (var ErrCode: integer; FileOpen: string);
    procedure About1Click(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetSubDirs(const sRootDir: string);
    procedure spSkinListBox1Click(Sender: TObject);
    procedure spSkinToolBarEx1Items2Click(Sender: TObject);
    procedure Reportaproblem1Click(Sender: TObject);
    procedure Read_Registry;
    procedure LoadSkin(AFileName: String);
    procedure FileSearch(const PathName, FileName : string;
                         const InDir : boolean; var RFile : string);
    procedure Write_Registry;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HelpContents(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Configure1Click(Sender: TObject);
    procedure btnViewProjClick(Sender: TObject);
    procedure rgrChoiceClick(Sender: TObject);
    procedure cboYearsTypeChange(Sender: TObject);
    procedure OpenProject1Click(Sender: TObject);
    procedure spSkinSpeedButClearClick(Sender: TObject);
    procedure spSkinSpeedButRunClick(Sender: TObject);
    procedure spSkinSpeedButExitClick(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure ExecuteChm(const RelPath : string);
    procedure Exit1Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure mnuFileSepClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure mnuFileMulti1Click(Sender: TObject);
    procedure btnEditProjClick(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure spSkinSpeedButtonHomeClick(Sender: TObject);
    procedure CheckforUpdates1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure sfeSepChange(Sender: TObject);
    procedure sfeMultiChange(Sender: TObject);
    procedure RichEditLOGChange(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure HelpSearchItem1Click(Sender: TObject);
    procedure HelpHowToUseItem1Click(Sender: TObject);
  private
    { Private declarations }

    function FilesInProjectFolder : integer;
    function isSelectedFromListBox : boolean;
    procedure ReadProFile;
  public
    { Public declarations }
    procedure UpdateProjectFolderListBox;
  end;

var
  MainForm: TMainForm;
  FIniFile : TRegIniFile;


implementation

uses ModDataFr, AboutFr, Configurefr, fmxutils, SeparateFr, MultiFr, UpdateUnit,
  DeleteProjFr;

{$R *.dfm}

procedure TMainForm.HandleError (var ErrCode: integer; FileOpen: string);
var
  FileExt : string;
begin
  FileExt := UpperCase (ExtractFileExt(FileOpen));
  case ErrCode of
    -1                     : spSkinMessage1.MessageDlg ('RR_DaysAreNotContinuous!', mtInformation,[mbOk], 0);
    -2                     : spSkinMessage1.MessageDlg ('ERR_YearsAreNotContinuous!', mtInformation,[mbOk], 0);
    -3                     : spSkinMessage1.MessageDlg ('ERR_ReadFromFile!', mtInformation,[mbOk], 0);
    -4                     : spSkinMessage1.MessageDlg ('ERR_WriteToFile!', mtInformation,[mbOk], 0);
    -5                     : spSkinMessage1.MessageDlg ('ERR_CloseFile!', mtInformation,[mbOk], 0);
    -10                    : spSkinMessage1.MessageDlg ('ERR_StringToIntConvert!', mtInformation,[mbOk], 0);
    -11                    : spSkinMessage1.MessageDlg ('ERR_StringToDoubleConvert!', mtInformation,[mbOk], 0);
    -50                    : spSkinMessage1.MessageDlg ('TERR_Parameters!', mtInformation,[mbOk], 0);
    0                      : spSkinMessage1.MessageDlg ('The operating system is out of memory or resources!', mtInformation,[mbOk], 0);
    ERROR_FILE_NOT_FOUND   : spSkinMessage1.MessageDlg ('The specified file was not found!', mtInformation,[mbOk], 0);
    ERROR_PATH_NOT_FOUND   : spSkinMessage1.MessageDlg ('The specified path was not found!', mtInformation,[mbOk], 0);
    ERROR_BAD_FORMAT       : spSkinMessage1.MessageDlg ('The .EXE file is invalid (non-Win32 .EXE or error in .EXE image)!', mtInformation,[mbOk], 0);
    SE_ERR_ACCESSDENIED    : spSkinMessage1.MessageDlg ('The operating system denied access to the specified file!', mtInformation,[mbOk], 0);
    SE_ERR_ASSOCINCOMPLETE : spSkinMessage1.MessageDlg ('The filename association is incomplete or invalid!', mtInformation,[mbOk], 0);
    SE_ERR_DDEBUSY         : spSkinMessage1.MessageDlg ('The DDE transaction could not be completed because other DDE transactions were being processed!', mtInformation,[mbOk], 0);
    SE_ERR_DDEFAIL         : spSkinMessage1.MessageDlg ('The DDE transaction failed!', mtInformation,[mbOk], 0);
    SE_ERR_DDETIMEOUT      : spSkinMessage1.MessageDlg ('The DDE transaction could not be completed because the request timed out!', mtInformation,[mbOk], 0);
    SE_ERR_DLLNOTFOUND     : spSkinMessage1.MessageDlg ('The specified dynamic-link library was not found!', mtInformation,[mbOk], 0);
    SE_ERR_NOASSOC         : spSkinMessage1.MessageDlg ('There is no application associated with the given filename extension!', mtInformation,[mbOk], 0);
    SE_ERR_OOM             : spSkinMessage1.MessageDlg ('There was not enough memory to complete the operation!', mtInformation,[mbOk], 0);
    SE_ERR_SHARE           : spSkinMessage1.MessageDlg ('A sharing violation occurred!', mtInformation,[mbOk], 0);
  end;
end;

function IsStrFloatNum(s: string): Boolean;
begin
  try
    StrToFloat(s);
    Result := True;
  except
    Result := False;
  end;
end;

function IsStrIntNum(s : string):boolean;
begin
  try
    StrToInt(s);
    Result := True;
  except
    Result := False;
  end;
end;

function IsNumeric(s: String) : Boolean;
var
  code  : Integer;
  value : Double;
begin
  val(s, value, code);
  Result := (code = 0);
end;

procedure Unifrom_White_Characters(var s : string);
var
  i : integer;
begin
  for i := 1 to Length(s) do
    if s[i] in WHITE_CHAR_SET then s[i] := ' ';
end;

procedure Read_Cold_Warm_Neutral_Years( copProgParam : TProgramParameters;
                                        var refBulkData : TBulkData);

var
        fc , fw , fn    : TEXTfile;
        i,j{,k }        : integer;
        s1             : string;
        year            : integer;
begin
        AssignFile(fn,copProgParam.NeutralFileFullName);
        AssignFile(fc,copProgParam.ColdFileFullName);
        AssignFile(fw,copProgParam.WarmFileFullName);
       
        //==========================================
        // Neutral Years
        try
                reset(fn);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
                //exit;
        end;

        i:=1;
        SetLength(refBulkData.NeutralYears.ArrYears,i);
        while not eof(fn) do
        begin
                Readln(fn,s1);
                s1:=Trim(s1);
                try
                        year:=StrToInt(s1);
                except
                        on EConvertError do MainForm.HandleError(ERR_StringToIntConvert,'');
                end;

                refBulkData.NeutralYears.ArrYears[i-1]:=year;
                i:=i+1;
                SetLength(refBulkData.NeutralYears.ArrYears,i);
        end;
        refBulkData.NeutralYears.ArrSize:=i-1;
        SetLength(refBulkData.NeutralYears.ArrYears,refBulkData.NeutralYears.ArrSize);
        refBulkData.NeutralYears.ArrStartIndex:=0;
        refBulkData.NeutralYears.ArrEndIndex:=i-2;

        for i:=0 to refBulkData.NeutralYears.ArrSize-1 do
                for j:=i+1 to refBulkData.NeutralYears.ArrSize-1 do
                        begin
                                if refBulkData.NeutralYears.ArrYears[i]>refBulkData.NeutralYears.ArrYears[j] then
                                begin
                                        year:=refBulkData.NeutralYears.ArrYears[i];
                                        refBulkData.NeutralYears.ArrYears[i]:=refBulkData.NeutralYears.ArrYears[j];
                                        refBulkData.NeutralYears.ArrYears[j]:=year;
                                end;
                        end;

        //==========================================
        // Cold Years
        try
                reset(fc);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
                //exit;
        end;

        i:=1;
        SetLength(refBulkData.ColdYears.ArrYears,i);
        while not eof(fc) do
        begin
                Readln(fc,s1);
                s1:=Trim(s1);
                try
                        year:=StrToInt(s1);
                except
                        on EConvertError do MainForm.HandleError(ERR_StringToIntConvert,'');
                end;

                refBulkData.ColdYears.ArrYears[i-1]:=year;
                i:=i+1;
                SetLength(refBulkData.ColdYears.ArrYears,i);
        end;
        refBulkData.ColdYears.ArrSize:=i-1;
        SetLength(refBulkData.ColdYears.ArrYears,refBulkData.ColdYears.ArrSize);
        refBulkData.ColdYears.ArrStartIndex:=0;
        refBulkData.ColdYears.ArrEndIndex:=i-2;

        for i:=0 to refBulkData.ColdYears.ArrSize-1 do
                for j:=i+1 to refBulkData.ColdYears.ArrSize-1 do
                        begin
                                if refBulkData.ColdYears.ArrYears[i]>refBulkData.ColdYears.ArrYears[j] then
                                begin
                                        year:=refBulkData.ColdYears.ArrYears[i];
                                        refBulkData.ColdYears.ArrYears[i]:=refBulkData.ColdYears.ArrYears[j];
                                        refBulkData.ColdYears.ArrYears[j]:=year;
                                end;
                        end;

        //=============================================
        // Warm Years
        try
                reset(fw);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
                //exit;
        end;

        i:=1;
        SetLength(refBulkData.WarmYears.ArrYears,i);
        while not eof(fw) do
        begin
                Readln(fw,s1);
                s1:=Trim(s1);
                try
                        year:=StrToInt(s1);
                except
                        on EConvertError do MainForm.HandleError(ERR_StringToIntConvert,'');
                end;

                refBulkData.WarmYears.ArrYears[i-1]:=year;
                i:=i+1;
                SetLength(refBulkData.WarmYears.ArrYears,i);
        end;
        refBulkData.WarmYears.ArrSize:=i-1;
        SetLength(refBulkData.WarmYears.ArrYears,refBulkData.WarmYears.ArrSize);
        refBulkData.WarmYears.ArrStartIndex:=0;
        refBulkData.WarmYears.ArrEndIndex:=i-2;

        for i:=0 to refBulkData.WarmYears.ArrSize-1 do
                for j:=i+1 to refBulkData.WarmYears.ArrSize-1 do
                        begin
                                if refBulkData.WarmYears.ArrYears[i]>refBulkData.WarmYears.ArrYears[j] then
                                begin
                                        year:=refBulkData.WarmYears.ArrYears[i];
                                        refBulkData.WarmYears.ArrYears[i]:=refBulkData.WarmYears.ArrYears[j];
                                        refBulkData.WarmYears.ArrYears[j]:=year;
                                end;
                        end;

        try
                CloseFile(fn);
        except
                on EInOutError do MainForm.HandleError(ERR_CloseFile,'');
        end;

        try
                CloseFile(fc);
        except
                on EInOutError do MainForm.HandleError(ERR_CloseFile,'');
        end;

        try
                CloseFile(fw);
        except
                on EInOutError do MainForm.HandleError(ERR_CloseFile,'');
        end;
end;

procedure Extract_AutomaticFile_Data(   copProgParam : TProgramParameters;
                                        var refAutomaticFile : TAutomaticFile;
                                        var refBulkData : TBulkData);
const
        group           = 3;
        group2          = 2*group;
        ignore          = 2;
var
        i,j,k,p,q,t     :       integer;
        s1,s2           :       string;
        auto_file       :       TextFile;
        file_name       :       string;
        arr             :       array[1..group] of string;
        arr2            :       array[1..group2] of string;
begin
  file_name:='';

  if copProgParam.AutoFileType=FILE_Seperate then
    file_name := copProgParam.AutoSeperateFileFullName
  else
    file_name := copProgParam.AutoIntegrateFileFullName;

  AssignFile(auto_file,file_name);

  try
    Reset(auto_file);
  except
    on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
  end;

  // find number of redunent lines in automatic file
  i:=0;
  while not eof(auto_file) do
  begin
    Readln(auto_file,s1);
    i:=i+1;
    Unifrom_White_Characters(s1);

    s1:=Trim(s1)+' ';
    k:=Pos(' ',s1);
    s2 := copy (s1,1,k-1);
    if IsNumeric(s2) then break;
  end;

  i:=i-1; // actual redundent lines

        try
                Reset(auto_file);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
        end;

        // discard redundent lines
        for j:=1 to i do
                Readln(auto_file,s1);


        i:=1;  // for reading from file
        j:=1;  // for arr & group
        q:=1;  // for arr2 & group2
        t:=1;  // for array of automatic data
        while not eof(auto_file) do
          begin
                Readln(auto_file,arr[j]);
                Unifrom_White_Characters(arr[j]);
                s2:=Trim(arr[j])+' ';
                p:=1;
                while s2<>'' do
                  begin
                        s2:=TrimLeft(s2);
                        k:=Pos(' ',s2);
                        s1 := copy (s2,1,k-1);
                        Delete(s2,1,k);
                        if p > ignore then
                          begin
                                arr2[q]:=trim(s1);
                                q:=q+1;
                          end;
                        p:=p+1;
                  end;
                if (i mod group) = 0 then
                  begin
                      j:=1;
                      q:=1;

                      SetLength(refAutomaticFile.ArrAutomatic,t);
                      refAutomaticFile.ArrAutomatic[t-1].FileNameRefrence    := arr2[1];
                      refAutomaticFile.ArrAutomatic[t-1].FilePathRefrence    := IncludeTrailingBackSlash(arr2[2]);
                      refAutomaticFile.ArrAutomatic[t-1].FileFullNameRefrence:= refAutomaticFile.ArrAutomatic[t-1].FilePathRefrence+
                                                                                refAutomaticFile.ArrAutomatic[t-1].FileNameRefrence;

                      refAutomaticFile.ArrAutomatic[t-1].FileNameHistory    := arr2[3];
                      refAutomaticFile.ArrAutomatic[t-1].FilePathHistory    := IncludeTrailingBackSlash(arr2[4]);
                      refAutomaticFile.ArrAutomatic[t-1].FileFullNameHistory:= refAutomaticFile.ArrAutomatic[t-1].FilePathHistory+
                                                                               refAutomaticFile.ArrAutomatic[t-1].FileNameHistory;

                      refAutomaticFile.ArrAutomatic[t-1].FileNamePredict    := ChangeFileExt(arr2[5],'.WTG');

                      refAutomaticFile.ArrAutomatic[t-1].FilePathPredict    := IncludeTrailingBackSlash(arr2[6]);
                      refAutomaticFile.ArrAutomatic[t-1].FileFullNamePredict:= refAutomaticFile.ArrAutomatic[t-1].FilePathPredict+
                                                                               refAutomaticFile.ArrAutomatic[t-1].FileNamePredict;


                      t:=t+1;
                  end
                else
                  begin
                      j:=j+1;
                  end;
                i:=i+1;
          end; // while not eof ...
        refAutomaticFile.ArrSize:=t-1;
        refAutomaticFile.ArrStartIndex:=0;
        refAutomaticFile.ArrEndIndex:=t-2;
        try
                CloseFile(auto_file);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
        end;

end;

procedure Interpret_FileName( FullFileName : string;
                              var Path : string;
                              var FileName : string;
                              var Extension : string;
                              var Year : integer;       // 4 digit
                              var Pattern : string
                             );
const
  len_state    = 2;
  len_station  = 2;
  len_year     = 2;
var
  s1           : string;
  index        : integer;
  twoDigit     : integer;
begin
  Path:=ExtractFilePath(FullFileName);
  FileName:=ExtractFileName(FullFileName);
  Extension:=ExtractFileExt(FullFileName);
  index:=len_state+len_station+1;
  s1:=Copy(FileName,index,len_year);
  try
    Year:=StrToInt(s1);
  except
    on EConvertError do MainForm.HandleError(ERR_StringToIntConvert,'');
  end;

  Pattern:=Copy(FileName,1,len_state+len_station)+'*'+Extension;

  twoDigit := CURRENT_YEAR mod 100;
  if Year <= twoDigit then
    Year := 2000 + Year
  else
    Year := 1900 + Year;
end;

procedure Interpret_Year_Day_Code( s : string;
                                   var year : integer;                          // 4 digit
                                   var day : integer
                                 );
const
  PATTERN_YEAR  = 2;
  PATTERN_DAY   = 3;
var
  s1,s2         :  string;
begin
  s  := Trim(s);
  s1 := Copy(s,1,PATTERN_YEAR);
  s2 := Copy(s,PATTERN_YEAR+1,PATTERN_DAY);
  year := StrToInt(s1);

  if year <= (CURRENT_YEAR mod 100) then
    year := 2000 + year
  else
    year := 1900 + year;

  day := StrToInt(s2);
end;

// used both for refrence and history files that each one may contains more that 1 year 
procedure Read_One_Data_File(var refYearData : TYearData;
                                var Year1 : integer;
                                var Year2 : integer;
                                var Day11 : integer;
                                var Day12 : integer;
                                var Day21 : integer;
                                var Day22 : integer;
                                var DaysContinous1 : boolean;
                                var DaysContinous2 : boolean);
var
        x               :       double;
        i,j,k           :       integer;
        data_file       :       TEXTfile;
        s,s1,s2         :       string;
        year,day        :       integer;
        sw              :       boolean;
        arrDays         :       array of Integer;
        y1,y2           :       integer;
        d1,d2           :       integer;
        passedOneTime   :       boolean;
begin
        AssignFile(data_file,refYearData.FileFullName);
        try
                Reset(data_file);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
        end;

        // find number of redundant lines in History file
        i:=0;
        while not eof(data_file) do
          begin
                Readln(data_file,s1);
                i:=i+1;
                Unifrom_White_Characters(s1);

                s1:=Trim(s1)+' ';
                k:=Pos(' ',s1);
                s2 := copy (s1,1,k-1);
                if IsNumeric(s2) then
                        break;
        end;
        i:=i-1; // actual redundant lines

        try
                Reset(data_file);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
        end;

        // discard redundant lines
        for j:=1 to i do
                Readln(data_file,s1);

        passedOneTime:=false;
        i:=0; // current line
        while not eof(data_file) do
          begin
                Readln(data_file,s);
                Unifrom_White_Characters(s);
                SetLength(refYearData.ArrWeather,i+1);
                SetLength(arrDays,i+1);
                s2:=Trim(s)+' ';
                j:=1; //current column
                while s2<>'' do
                begin
                        s2:=TrimLeft(s2);
                        k:=Pos(' ',s2);
                        s1 := copy (s2,1,k-1);
                        if s1<>'' then
                                x:=StrToFloat(s1);
                        Delete(s2,1,k);

                        case j of
                                1 : begin  // extract day NO from the first column
                                        s1:=Trim(s1);
                                        Interpret_Year_Day_Code(s1,year,day);
                                        arrDays[i]:=day;

                                        // extract years in datafile
                                        // we suppose that there is no more than 2 years in a datafile
                                        if i=0 then
                                          begin
                                                y1:=year;
                                                y2:=year;
                                                day11:=day;
                                                day12:=day;
                                                day21:=day;
                                                day22:=day;
                                          end
                                        else
                                          begin
                                                if (year<>y1) and (passedOneTime=false) then
                                                  begin
                                                        passedOneTime:=true;
                                                        y2:=year;
                                                        day12:=arrDays[i-1];
                                                        day21:=arrDays[i];
                                                  end;
                                          end;
                                    end;
                                2 : refYearData.ArrWeather[i].Rad:=x;
                                3 : refYearData.ArrWeather[i].Tmax:=x;
                                4 : refYearData.ArrWeather[i].Tmin:=x;
                                5 : refYearData.ArrWeather[i].Rain:=x;
                        end;
                        j:=j+1;
                end;
                i:=i+1;
         end;

        refYearData.ArrSize:=i; // since we started from i:=0;
        refYearData.ArrStartIndex:=0;
        refYearData.ArrEndIndex:=i-1;

        Year1:=y1;
        Year2:=y2;
        if passedOneTime then
          begin
                day22:=arrDays[i-1];
          end
        else
          begin
                day12:=arrDays[i-1];
                day21:=day11;
                day22:=day12;
          end;

        //decide whether days are continuous or not
        j:=abs(day12-day11)+1; // since day11 & day12 are not ordered
        sw:=true;
        d1:=arrDays[0];
        for i:=1 to j-1 do
                begin
                        d2:=arrDays[i];
                        if d2-d1<>1 then
                           begin
                                sw:=false;
                                break;
                           end;
                        d1:=d2;
                end;
        DaysContinous1:=sw;

        sw:=true;
        d1:=arrDays[j];
        for i:=j+1 to High(arrDays) do
                begin
                        d2:=arrDays[i];
                        if d2-d1<>1 then
                           begin
                                sw:=false;
                                break;
                           end;
                        d1:=d2;
                end;
        DaysContinous2:=sw;

        refYearData.AreDaysContinuous:=DaysContinous1 and DaysContinous2;


        arrDays:=nil;
        try
                CloseFile(data_file);
        except
                on EInOutError do MainForm.HandleError(ERR_CloseFile,'');
        end;

end;

procedure Read_One_Multi_History_Data_File(  //   copProgParam : TProgramParameters;
                                                var refBulkData : TBulkData);
var
        x               :       double;
        i,j,k           :       integer;
        multi_data_file :       TEXTfile;
        s,s1,s2         :       string;
        year,day        :       integer;
        YearsOK         :       boolean;
        arrDays         :       array of Integer;
        y1,y2           :       integer;
        y,d             :       integer;
begin
        AssignFile(multi_data_file,refBulkData.AutomaticFileParameters.FileFullNameHistory);
        try
                Reset(multi_data_file);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
        end;

        // find number of redundant lines in Muti_History file
        i:=0;
        while not eof(multi_data_file) do
          begin
                Readln(multi_data_file,s1);
                i:=i+1;
                Unifrom_White_Characters(s1);

                s1:=Trim(s1)+' ';
                k:=Pos(' ',s1);
                s2 := copy (s1,1,k-1);
                if IsNumeric(s2) then
                        break;
        end;
        i:=i-1; // actual redundant lines

        try
                Reset(multi_data_file);
        except
                on EInOutError do MainForm.HandleError(ERR_ReadFromFile,'');
        end;

        // discard redundant lines
        for j:=1 to i do
                Readln(multi_data_file,s1);

        // y1,y2 are used to distinguish the ghange of years in lines
        y:=0; // year index
        d:=0; // day index
        i:=0; // current line
        while not eof(multi_data_file) do
          begin
                Readln(multi_data_file,s);
                Unifrom_White_Characters(s);
                
                // happens just one time for the first line
                if i=0 then
                  begin
                        s2:=Trim(s)+' ';
                        s1 := copy (s2,1, Pos(' ',s2) -1 );
                        Interpret_Year_Day_Code(s1,year,day);
                        y1:=year;
                        y2:=year;
                        SetLength(refBulkData.ArrYears,1);
                        refBulkData.ArrYears[0].YearNO:=year;
                        SetLength(refBulkData.ArrYears[0].ArrWeather,1);
                        refBulkData.ArrYears[0].ArrSize:=1;
                        refBulkData.ArrYears[0].ArrStartIndex:=0;
                        refBulkData.ArrYears[0].ArrEndIndex:=0;
                  end;

                s2:=Trim(s)+' ';
                j:=1;
                while s2<>'' do
                begin
                        s2:=TrimLeft(s2);
                        k:=Pos(' ',s2);
                        s1 := copy (s2,1,k-1);
                        if s1<>'' then
                                x:=StrToFloat(s1);
                        Delete(s2,1,k);

                        case j of
                                1 : begin  // extract year & day from the first column
                                        s1:=Trim(s1);
                                        Interpret_Year_Day_Code(s1,year,day);
                                        y2:=year;
                                    end;
                                2 : refBulkData.ArrYears[y].ArrWeather[d].Rad:=x;
                                3 : refBulkData.ArrYears[y].ArrWeather[d].Tmax:=x;
                                4 : refBulkData.ArrYears[y].ArrWeather[d].Tmin:=x;
                                5 : refBulkData.ArrYears[y].ArrWeather[d].Rain:=x;
                        end;
                        j:=j+1;
                end;

                i:=i+1;
                d:=d+1;
                SetLength(refBulkData.ArrYears[y].ArrWeather,d+1);

                if y2<>y1 then
                  begin
                        y1:=y2;
                        y:=y+1;
                        SetLength(refBulkData.ArrYears,y+1);
                        refBulkData.ArrYears[y].YearNO:=y2;
                        refBulkData.ArrYears[y].ArrSize:=1;
                        refBulkData.ArrYears[y].ArrStartIndex:=0;
                        refBulkData.ArrYears[y].ArrEndIndex:=0;
                        SetLength(refBulkData.ArrYears[y].ArrWeather,2);  // '2' since we must consider space for the second day too

                        refBulkData.ArrYears[y].ArrWeather[0]:=refBulkData.ArrYears[y-1].ArrWeather[d-1];
                        SetLength(refBulkData.ArrYears[y-1].ArrWeather,d-1); // 'd-1' since we had d:=d+1
                        refBulkData.ArrYears[y-1].ArrSize:=d-1;
                        refBulkData.ArrYears[y-1].ArrStartIndex:=0;
                        refBulkData.ArrYears[y-1].ArrEndIndex:=d-2;
                        d:=1;
                  end;

         end; // while not eof(...)
         //make the correct length for the last line of the last year
         SetLength(refBulkData.ArrYears[y].ArrWeather,d);
         refBulkData.ArrYears[y].ArrSize:=d;
         refBulkData.ArrYears[y].ArrStartIndex:=0;
         refBulkData.ArrYears[y].ArrEndIndex:=d-1;

         // decide weather days and years are continous or not
         YearsOK:=true;
         y1:=refBulkData.ArrYears[0].YearNO;
         for i:=1 to Length(refBulkData.ArrYears)-1 do
                begin
                        if Length(refBulkData.ArrYears[i].ArrWeather)<365 then
                                refBulkData.ArrYears[i].AreDaysContinuous:=false;
                        y2:=refBulkData.ArrYears[i].YearNO;
                        if y2-y1<>1 then
                           begin
                                YearsOK:=false;
                           end;
                        y1:=y2;
                end;
        refBulkData.AreYearsContinuous:=YearsOK;


        ////////////////////////////////////////////
        MainForm.RichEditLOG.Lines.Add('   Reading MulitiYears File :');
        for i:=0 to Length(refBulkData.ArrYears)-1 do
                begin
                        str(refBulkData.ArrYears[i].YearNO,s);
                        MainForm.RichEditLOG.Lines.Add('    '+s);
                end;



        arrDays:=nil;
        try
                CloseFile(multi_data_file);
        except
                on EInOutError do MainForm.HandleError(ERR_CloseFile,'');
        end;
end;

// refrence file may be consisted of 2 years
// it uses Read_One_Data_File(...)
procedure Read_Refrence_File(var refBulkData : TBulkData);
var
        i               :       integer;
        y1,y2           :       integer;
        d11,d12,d21,d22 :       integer;
        tmpYearData     :       TYearData;
        c1,c2           :       boolean;
begin
        tmpYearData.FileFullName:=refBulkData.AutomaticFileParameters.FileFullNameRefrence;

        Read_One_Data_File(tmpYearData,y1,y2,d11,d12,d21,d22,c1,c2);

        refBulkData.RefrenceYear.YearNO1:=y1;
        refBulkData.RefrenceYear.YearNO2:=y2;
        refBulkData.RefrenceYear.Day11:=d11;
        refBulkData.RefrenceYear.Day12:=d12;
        refBulkData.RefrenceYear.Day21:=d21;
        refBulkData.RefrenceYear.Day22:=d22;
        refBulkData.RefrenceYear.Len1:=d12-d11+1;
        refBulkData.RefrenceYear.Len2:=d22-d21+1;

        SetLength(refBulkData.RefrenceYear.ArrWeather,Length(tmpYearData.ArrWeather));
        //copy from temporary variable to refrence place
        for i:=0 to Length(tmpYearData.ArrWeather)-1 do
           begin
                refBulkData.RefrenceYear.ArrWeather[i]:=tmpYearData.ArrWeather[i];
           end;

        refBulkData.RefrenceYear.ArrSize:=Length(tmpYearData.ArrWeather);
        refBulkData.RefrenceYear.ArrStartIndex:=0;
        refBulkData.RefrenceYear.ArrEndIndex:=Length(tmpYearData.ArrWeather)-1;
end;

procedure Calculate_Statistical_Data_For_Rearranged_Datas(var refRearrangedData : TRearrangedYearData);
// days data should be previously available for refYearData
const
  eps = 0.0001;
var
  i,j         : integer;
  t1,t2,t3,t4 : double;
begin
  refRearrangedData.Mean_Rad  := 0;
  refRearrangedData.Mean_Tmax := 0;
  refRearrangedData.Mean_Tmin := 0;
  refRearrangedData.Mean_Rain := 0;

  for i := 0 to High(refRearrangedData.arrWeather) do
  begin
    refRearrangedData.Mean_Rad  := refRearrangedData.Mean_Rad  + refRearrangedData.ArrWeather[i].Rad;
    refRearrangedData.Mean_Tmax := refRearrangedData.Mean_Tmax + refRearrangedData.ArrWeather[i].Tmax;
    refRearrangedData.Mean_Tmin := refRearrangedData.Mean_Tmin + refRearrangedData.ArrWeather[i].Tmin;
    refRearrangedData.Mean_Rain := refRearrangedData.Mean_Rain + refRearrangedData.ArrWeather[i].Rain;
  end;

  refRearrangedData.Mean_Rad  := refRearrangedData.Mean_Rad  / Length(refRearrangedData.arrWeather);
  refRearrangedData.Mean_Tmax := refRearrangedData.Mean_Tmax / Length(refRearrangedData.arrWeather);
  refRearrangedData.Mean_Tmin := refRearrangedData.Mean_Tmin / Length(refRearrangedData.arrWeather);
  refRearrangedData.Mean_Rain := refRearrangedData.Mean_Rain / Length(refRearrangedData.arrWeather);


  t1 := 0;
  t2 := 0;
  t3 := 0;
  t4 := 0;

  for i := 0 to High(refRearrangedData.arrWeather) do
  begin
    t1 := t1 + Power(refRearrangedData.ArrWeather[i].Rad  - refRearrangedData.Mean_Rad, 2);
    t2 := t2 + Power(refRearrangedData.ArrWeather[i].Tmax - refRearrangedData.Mean_Tmax,2);
    t3 := t3 + Power(refRearrangedData.ArrWeather[i].Tmin - refRearrangedData.Mean_Tmin,2);
    t4 := t4 + Power(refRearrangedData.ArrWeather[i].Rain - refRearrangedData.Mean_Rain,2);
  end;

  i := Length(refRearrangedData.arrWeather);

  refRearrangedData.SD_Rad  := Sqrt(t1 / (Length(refRearrangedData.arrWeather) - 1));
  refRearrangedData.SD_Tmax := Sqrt(t2 / (Length(refRearrangedData.arrWeather) - 1));
  refRearrangedData.SD_Tmin := Sqrt(t3 / (Length(refRearrangedData.arrWeather) - 1));
  refRearrangedData.SD_Rain := Sqrt(t4 / (Length(refRearrangedData.arrWeather) - 1));

  if refRearrangedData.SD_Rad  = 0.0 then refRearrangedData.SD_Rad  := eps;
  if refRearrangedData.SD_Tmax = 0.0 then refRearrangedData.SD_Tmax := eps;
  if refRearrangedData.SD_Tmin = 0.0 then refRearrangedData.SD_Tmin := eps;
  if refRearrangedData.SD_Rain = 0.0 then refRearrangedData.SD_Rain := eps;

        // for calculating .TRN files , normalizing
        // Length of refYearData.ArrNormalizedWeather is already set in Read_One_Data_File(...)
        ///////////////////////////
  j := High(refRearrangedData.arrWeather);
  j := length(refRearrangedData.arrWeather);
  j := length(refRearrangedData.ArrNormalizedWeather);

  SetLength(refRearrangedData.ArrNormalizedWeather, Length(refRearrangedData.arrWeather));

  for i := 0 to High(refRearrangedData.arrWeather) do
  begin
    refRearrangedData.ArrNormalizedWeather[i].Rad  :=(refRearrangedData.ArrWeather[i].Rad  - refRearrangedData.Mean_Rad)  / refRearrangedData.SD_Rad;
    refRearrangedData.ArrNormalizedWeather[i].Tmax :=(refRearrangedData.ArrWeather[i].Tmax - refRearrangedData.Mean_Tmax) / refRearrangedData.SD_Tmax;
    refRearrangedData.ArrNormalizedWeather[i].Tmin :=(refRearrangedData.ArrWeather[i].Tmin - refRearrangedData.Mean_Tmin) / refRearrangedData.SD_Tmin;
    refRearrangedData.ArrNormalizedWeather[i].Rain :=(refRearrangedData.ArrWeather[i].Rain - refRearrangedData.Mean_Rain) / refRearrangedData.SD_Rain;
  end;
end;

procedure Read_History_Data_Seperate(
                                //copAutomaticData : TAutomaticData;
                                var refBulkData : TBulkData
                                );
type
        TFileData = record
                FileName        :       string;
                Year            :       integer;
        end;
        TFileArray = array of TFileData;

var
        SearchRecord            :       TSearchRec;
        Pattern                 :       string;
        Path,FileName,
        Exten                   :       string;
        Year                    :       integer;
        i,j                     :       integer;
        err                     :       integer;
        arrFile                 :       TFileArray;
        tmpFD                   :       TFileData;
        y1,y2                   :       integer;
        d11,d12,d21,d22         :       integer;
        c1,c2                   :       boolean;
begin
        Interpret_FileName(refBulkData.AutomaticFileParameters.FileFullNameHistory,Path,FileName,Exten,Year,Pattern);
        refBulkData.AutomaticFileParameters.FilePathHistory:=ExtractFilePath(refBulkData.AutomaticFileParameters.FileFullNameHistory);
        err:=FindFirst(refBulkData.AutomaticFileParameters.FilePathHistory+Pattern,faAnyFile,SearchRecord);
        if err = 0 then  // err=0, so find is successful
           begin
                i:=1;
                repeat
                        if (SearchRecord.Name<>'.') and (SearchRecord.Name<>'..') then
                           begin
                                SetLength(arrFile,i);

                                Interpret_FileName(SearchRecord.Name,Path,FileName,Exten,Year,Pattern);
                                arrFile[i-1].FileName:=SearchRecord.Name;
                                arrFile[i-1].Year:=Year;
                                i:=i+1;
                           end;
                until FindNext(SearchRecord)<>0 ;
           end; // if k=0 ...
        FindClose(SearchRecord);


        // sorting
        for i:=0 to High(arrFile) do
           begin
                for j:=i+1 to High(arrFile) do
                        if arrFile[i].Year>arrFile[j].Year then
                           begin
                                tmpFD:=arrFile[i];
                                arrFile[i]:=arrFile[j];
                                arrFile[j]:=tmpFD;
                           end;
               ////////////////
               MainForm.RichEditLOG.Lines.Add('    '+arrFile[i].FileName);
           end;
        // set correct parameters for refBulkData
        SetLength(refBulkData.ArrYears,High(arrFile)+1);
        for i:=0 to High(arrFile) do
           begin
                refBulkData.ArrYears[i].YearNO:=arrFile[i].Year;
                refBulkData.ArrYears[i].FileFullName:=refBulkData.AutomaticFileParameters.FilePathHistory +arrFile[i].FileName;
                refBulkData.ArrYears[i].FileName:=ExtractFileName(arrFile[i].FileName);
                refBulkData.ArrYears[i].FilePath:=ExtractFilePath(arrFile[i].FileName);
                Read_One_Data_File(refBulkData.ArrYears[i],y1,y2,d11,d12,d21,d22,c1,c2);
           end;

        arrFile:=nil;

end;

procedure Just_Copy_History_To_Rearranged_Data(var refBulkData : TBulkData);
var
        i,j             :       integer;
begin

        SetLength(refBulkData.ArrRearrangedYears, Length(refBulkData.ArrYears) );
        for i:=0 to Length(refBulkData.ArrRearrangedYears)-1 do
          begin
                SetLength(refBulkData.ArrRearrangedYears[i].ArrWeather, Length(refBulkData.ArrYears[i].ArrWeather) );
                for j:=0 to Length(refBulkData.ArrYears[i].ArrWeather)-1 do
                        refBulkData.ArrRearrangedYears[i].ArrWeather[j]:=refBulkData.ArrYears[i].ArrWeather[j];

                refBulkData.ArrRearrangedYears[i].YearNO1:=refBulkData.ArrYears[i].YearNO;
                refBulkData.ArrRearrangedYears[i].YearNO2:=refBulkData.ArrYears[i].YearNO;
          end;
end;

procedure Just_Copy_Refrence_To_Rearranged_Data(var refBulkData : TBulkData);
var
        i,j             :       integer;
        len1,len2       :       integer;
begin
        // since we just want to use old method for calculating D,
        // here we just copy the second part of RefrenceYear ( days=1..# )
        // and set the new length
        len1:=Length(refBulkData.RefrenceYear.ArrWeather);
        SetLength(refBulkData.RearrangedRefrenceYear.ArrWeather,len1);
        for i:=0 to len1-1 do
          begin
                refBulkData.RearrangedRefrenceYear.ArrWeather[i]:=refBulkData.RefrenceYear.ArrWeather[i];
          end;
        refBulkData.RearrangedRefrenceYear.YearNO1:=refBulkData.RefrenceYear.YearNO1;
        refBulkData.RearrangedRefrenceYear.YearNO2:=refBulkData.RefrenceYear.YearNO2;
        refBulkData.RearrangedRefrenceYear.Day11:=refBulkData.RefrenceYear.Day11;
        refBulkData.RearrangedRefrenceYear.Day12:=refBulkData.RefrenceYear.Day12;
        refBulkData.RearrangedRefrenceYear.Day21:=refBulkData.RefrenceYear.Day21;
        refBulkData.RearrangedRefrenceYear.Day22:=refBulkData.RefrenceYear.Day22;
        refBulkData.RearrangedRefrenceYear.Len1:=refBulkData.RefrenceYear.Len1;
        refBulkData.RearrangedRefrenceYear.Len2:=refBulkData.RefrenceYear.Len2;


        if refBulkData.RearrangedRefrenceYear.YearNO1=refBulkData.RearrangedRefrenceYear.YearNO2 then
           begin
                // we just have one year in refrencefile
                SetLength(refBulkData.RearrangedRefrenceYear.ArrNormalizedWeather,Length(refBulkData.RearrangedRefrenceYear.ArrWeather) );
                for i:=0 to High(refBulkData.RearrangedRefrenceYear.ArrWeather) do
                  begin
                        refBulkData.RearrangedRefrenceYear.ArrNormalizedWeather[i]:=refBulkData.RearrangedRefrenceYear.ArrWeather[i];
                  end;
           end
        else
           begin
                len1:=refBulkData.RearrangedRefrenceYear.Day12 - refBulkData.RearrangedRefrenceYear.Day11 + 1;

                  //????????? test len2 ????????
                j:=High(refBulkData.RearrangedRefrenceYear.ArrWeather );
                len2:=High(refBulkData.RearrangedRefrenceYear.ArrWeather)-len1+1;
                SetLength(refBulkData.RearrangedRefrenceYear.ArrWeather,len2);
                SetLength(refBulkData.RearrangedRefrenceYear.ArrNormalizedWeather,len2);
                for i:=len1-1 to High(refBulkData.RearrangedRefrenceYear.ArrWeather) do
                  begin
                        refBulkData.RearrangedRefrenceYear.ArrWeather[i-(len1-1)]:=refBulkData.RearrangedRefrenceYear.ArrWeather[i];
                        refBulkData.RearrangedRefrenceYear.ArrNormalizedWeather[i-(len1-1)]:=refBulkData.RearrangedRefrenceYear.ArrWeather[i-(len1-1)];
                  end;
           end;
end;

procedure Just_Copy_Data_To_Rearranged_Data(var refBulkData : TBulkData);
var
        i,j           :       integer;
        len1,len2       :       integer;
        w               :       integer;

        s1,s2,s3:string;
begin
        ///////////////
        j:=Length(refBulkData.ArrYears);

        SetLength(refBulkData.ArrRearrangedYears, Length(refBulkData.ArrYears) );
        j:=Length(refBulkData.ArrRearrangedYears);
        for i:=0 to Length(refBulkData.ArrRearrangedYears)-1 do
          begin
                /////////////////////
                j:=Length(refBulkData.ArrYears[i].ArrWeather);

                SetLength(refBulkData.ArrRearrangedYears[i].ArrWeather, Length(refBulkData.ArrYears[i].ArrWeather) );
                for j:=0 to Length(refBulkData.ArrYears[i].ArrWeather)-1 do
                        refBulkData.ArrRearrangedYears[i].ArrWeather[j]:=refBulkData.ArrYears[i].ArrWeather[j];

                refBulkData.ArrRearrangedYears[i].YearNO1:=refBulkData.ArrYears[i].YearNO;
                refBulkData.ArrRearrangedYears[i].YearNO2:=refBulkData.ArrYears[i].YearNO;

          end;

        // since we just want to use old method for calculating D,
        // here we just copy the second part of RefrenceYear ( days=1..# )
        // and set the new length

        if refBulkData.RefrenceYear.YearNO1=refBulkData.RefrenceYear.YearNO2 then
           begin
                // we just have one year in refrencefile
                SetLength(refBulkData.RefrenceYear.ArrNormalizedWeather,Length(refBulkData.RefrenceYear.ArrWeather) );
                for i:=0 to High(refBulkData.RefrenceYear.ArrWeather) do
                  begin
                        refBulkData.RefrenceYear.ArrNormalizedWeather[i]:=refBulkData.RefrenceYear.ArrWeather[i];//[i-(len1-1)];
                  end;
           end
        else
           begin
                len1:=refBulkData.RefrenceYear.Day12 - refBulkData.RefrenceYear.Day11 + 1;

                  //????????? test len2 ????????
                j:=High(refBulkData.RefrenceYear.ArrWeather );
                len2:=High(refBulkData.RefrenceYear.ArrWeather)-len1+1;
                SetLength(refBulkData.RefrenceYear.ArrWeather,len2);
                SetLength(refBulkData.RefrenceYear.ArrNormalizedWeather,len2);
                for i:=len1-1 to High(refBulkData.RefrenceYear.ArrWeather) do
                  begin
                        refBulkData.RefrenceYear.ArrWeather[i-(len1-1)]:=refBulkData.RefrenceYear.ArrWeather[i];
                        refBulkData.RefrenceYear.ArrNormalizedWeather[i-(len1-1)]:=refBulkData.RefrenceYear.ArrWeather[i-(len1-1)];
                  end;
           end;


        ////////////////////
        MainForm.RichEditLOG.Lines.Add(' # Just Copying');
        w:=length(refBulkData.ArrRearrangedYears);
        for i:=0 to length(refBulkData.ArrRearrangedYears)-1 do
           begin
                s3:=IntToStr(i);
                s1:=inttostr(refBulkData.ArrRearrangedYears[i].YearNO1);
                s2:=inttostr(refBulkData.ArrRearrangedYears[i].YearNO2);
                MainForm.RichEditLOG.Lines.Add('     '+s3+' > '+s1+'   '+s2);
           end;
end;


procedure Make_Rearranged_Data( //copProgParam : TProgramParameters;
                                var refBulkData : TBulkData);
var
        i,j,k           :       integer;
        len,
        len1,len2       :       integer;
        l1,l2           :       integer;
        w               :       integer;
begin
        if refBulkData.RefrenceYear.YearNO1<>refBulkData.RefrenceYear.YearNO2 then
           begin
                len1:=refBulkData.RefrenceYear.Len1;
                len2:=refBulkData.RefrenceYear.Len2;

                SetLength(refBulkData.ArrRearrangedYears,Length(refBulkData.ArrYears)-1);

                for i:=0 to Length(refBulkData.ArrYears)-2 do
                  begin
                        l1:=Length(refBulkData.ArrYears[i].Arrweather);
                        l2:=Length(refBulkData.ArrYears[i+1].Arrweather);

                        w:=len1+len2;
                        SetLength(refBulkData.ArrRearrangedYears[i].ArrWeather, w );

                        k:=0;
                        for j:=l1-len1 to l1-1 do
                          begin
                                refBulkData.ArrRearrangedYears[i].ArrWeather[k]:=refBulkData.ArrYears[i].ArrWeather[j];
                                k:=k+1;
                          end;

                        l2:=len2;
                        for j:=0 to l2-1 do
                          begin
                                refBulkData.ArrRearrangedYears[i].ArrWeather[k]:=refBulkData.ArrYears[i+1].ArrWeather[j];
                                k:=k+1;
                          end;

                      refBulkData.ArrRearrangedYears[i].YearNO1:=refBulkData.ArrYears[i].YearNO;
                      refBulkData.ArrRearrangedYears[i].YearNO2:=refBulkData.ArrYears[i+1].YearNO;
                
                end; // for i
           end // if ...<>...
        else
           begin
                len:=Length(refBulkData.RefrenceYear.ArrWeather);

                SetLength(refBulkData.ArrRearrangedYears , Length(refBulkData.ArrYears));

                for i:=0 to High(refBulkData.ArrYears) do
                  begin
                        refBulkData.ArrRearrangedYears[i].YearNO1:= refBulkData.ArrYears[i].YearNO;
                        refBulkData.ArrRearrangedYears[i].YearNO2:= refBulkData.ArrYears[i].YearNO;

                        SetLength(refBulkData.ArrRearrangedYears[i].ArrWeather ,len );


                        for j:=0 to len-1 do
                          begin
                                refBulkData.ArrRearrangedYears[i].ArrWeather[j]:=refBulkData.ArrYears[i].ArrWeather[j]; 
                          end;
                        
                  end;

           end; // else
end;

procedure Make_Rearranged_Refrence( //copProgParam : TProgramParameters;
                                var refBulkData : TBulkData);
var
  i, len :       integer;
begin
  len := Length(refBulkData.RefrenceYear.ArrWeather);
  SetLength (refBulkData.RearrangedRefrenceYear.ArrWeather , len );

  for i := 0 to len - 1 do
     refBulkData.RearrangedRefrenceYear.ArrWeather[i] := refBulkData.RefrenceYear.ArrWeather[i];

  refBulkData.RearrangedRefrenceYear.YearNO1 := refBulkData.RefrenceYear.YearNO1;
  refBulkData.RearrangedRefrenceYear.YearNO2 := refBulkData.RefrenceYear.YearNO2;
end;

procedure Make_Groups_On_Rearranged_Data(
                                        var refBulkData : TBulkData;
                                        group           : integer);

var
        ArrGroup        :       array of TWeatherData;
        i,j,k       :       integer;
        len1   :       integer;
        count           :       integer;
        IndexLow,
        IndexHigh       :       integer;
        sum1,sum2,
        sum3,sum4       :       double;
begin
        for i:=0 to High(refBulkData.ArrRearrangedYears) do
           begin
                len1:=Length(refBulkData.ArrRearrangedYears[i].ArrWeather);
                count:=Ceil(len1/group);
                SetLength(ArrGroup,count);

                for j:=1 to count do
                  begin
                        IndexLow:=(j-1)*group;
                        if j<>count then
                                IndexHigh:=j*group-1
                        else
                                IndexHigh:=High(refBulkData.ArrRearrangedYears[i].ArrWeather);

                        sum1:=0;
                        sum2:=0;
                        sum3:=0;
                        sum4:=0;
                        for k:=IndexLow to IndexHigh do
                          begin
                                sum1:=sum1+refBulkData.ArrRearrangedYears[i].ArrWeather[k].Rad;
                                sum2:=sum2+refBulkData.ArrRearrangedYears[i].ArrWeather[k].Tmax;
                                sum3:=sum3+refBulkData.ArrRearrangedYears[i].ArrWeather[k].Tmin;
                                sum4:=sum4+refBulkData.ArrRearrangedYears[i].ArrWeather[k].Rain;
                          end;
                        ArrGroup[j-1].Rad:=sum1;
                        ArrGroup[j-1].Tmax:=sum2;
                        ArrGroup[j-1].Tmin:=sum3;
                        ArrGroup[j-1].Rain:=sum4;
                  end;

                SetLength(refBulkData.ArrRearrangedYears[i].ArrWeather,count);
                for j:=0 to High(ArrGroup) do
                  begin
                        refBulkData.ArrRearrangedYears[i].ArrWeather[j]:=ArrGroup[j];
                  end;

           end;
end;


procedure Make_Groups_On_Rearranged_Refrence(
                                        var refBulkData : TBulkData;
                                        group           : integer);

var
        ArrGroup        :       array of TWeatherData;
        j,k       :       integer;
        len1   :       integer;
        count           :       integer;
        IndexLow,
        IndexHigh       :       integer;
        sum1,sum2,
        sum3,sum4       :       double;
begin
        len1:=Length(refBulkData.RearrangedRefrenceYear.ArrWeather);
        count:=Ceil(len1/group);
        SetLength(ArrGroup,count);

        for j:=1 to count do
          begin
                IndexLow:=(j-1)*group;
                if j<>count then
                        IndexHigh:=j*group-1
                else
                        IndexHigh:=High(refBulkData.RearrangedRefrenceYear.ArrWeather);

                sum1:=0;
                sum2:=0;
                sum3:=0;
                sum4:=0;
                for k:=IndexLow to IndexHigh do
                  begin
                        sum1:=sum1+refBulkData.RearrangedRefrenceYear.ArrWeather[k].Rad;
                        sum2:=sum2+refBulkData.RearrangedRefrenceYear.ArrWeather[k].Tmax;
                        sum3:=sum3+refBulkData.RearrangedRefrenceYear.ArrWeather[k].Tmin;
                        sum4:=sum4+refBulkData.RearrangedRefrenceYear.ArrWeather[k].Rain;
                  end;
                ArrGroup[j-1].Rad:=sum1;
                ArrGroup[j-1].Tmax:=sum2;
                ArrGroup[j-1].Tmin:=sum3;
                ArrGroup[j-1].Rain:=sum4;
          end;
        SetLength(refBulkData.RearrangedRefrenceYear.ArrWeather,count);
        for j:=0 to High(ArrGroup) do
           begin
                refBulkData.RearrangedRefrenceYear.ArrWeather[j]:=ArrGroup[j];
           end;
end;

procedure Calculate_D(var refBulkData : TBulkData);
var
  i,j,k     : integer;
  arrIndex  : array of integer;
  len1,len2 : integer;
  t         : TD_Data;   
begin
  // find correct indices of years
  case refBulkData.AlgorithmType of
    ALG_NORMAL  : begin
                    SetLength(arrIndex,Length(refBulkData.arrYears));
                    for i:=0 to High(arrIndex) do arrIndex[i]:=i;
                  end;
    ALG_Neutral : begin
                    k:=0;
                    for i:=0 to High(refBulkData.NeutralYears.arrYears) do
                    begin
                      for j:=0 to High(refBulkData.arrYears) do
                      begin
                        if refBulkData.NeutralYears.arrYears[i]=refBulkData.ArrYears[j].YearNO then
                        begin
                          SetLength(arrIndex,k+1);
                          arrIndex[k]:=j;
                          k:=k+1;
                        end;
                      end;
                    end;
                  end;
       ALG_COLD : begin
                    k:=0;
                    for i:=0 to High(refBulkData.ColdYears.arrYears) do
                    begin
                      for j:=0 to High(refBulkData.arrYears) do
                      begin
                        if refBulkData.ColdYears.arrYears[i]=refBulkData.ArrYears[j].YearNO then
                        begin
                          SetLength(arrIndex,k+1);
                          arrIndex[k]:=j;
                          k:=k+1;
                        end;
                      end;
                    end;
                  end;
       ALG_WARM : begin
                    k:=0;
                    for i:=0 to High(refBulkData.WarmYears.arrYears) do
                    begin
                      for j:=0 to High(refBulkData.arrYears) do
                      begin
                        if refBulkData.WarmYears.arrYears[i]=refBulkData.ArrYears[j].YearNO then
                        begin
                          SetLength(arrIndex,k+1);
                          arrIndex[k]:=j;
                          k:=k+1;
                        end;
                      end;
                    end;
                  end;
  end; // case

  len1:=Length(arrIndex);
  SetLength(refBulkData.D,len1);
  SetLength(refBulkData.arrData,len1);

  //????????????????????????
  len2:=refBulkData.EndDay-refBulkData.StartDay+1;

  for i:=0 to len1-1 do
  begin
    SetLength(refBulkData.arrData[i],len2);
    refBulkData.D[i].Value:=0;
  end;
          // sorting
  for i:=0 to len1-1 do
    for j:=i to len1-1 do
    begin
      if refBulkData.D[i].Value>refBulkData.D[j].Value then
      begin
        t:=refBulkData.D[i];
        refBulkData.D[i]:=refBulkData.D[j];
        refBulkData.D[j]:=t;
      end;
    end;
end;

procedure Calculate_D_Old_Method(var refBulkData : TBulkData);
var
        i,j,k           :       integer;
        arrIndex        :       array of integer;
        len1,len2       :       integer;
        temp            :       TD_Data;
        s,s1,s2         :       string;

begin
        // find correct indices of years
        case refBulkData.AlgorithmType of
                ALG_NORMAL :
                        begin
                                SetLength(arrIndex,Length(refBulkData.ArrRearrangedYears));
                                for i:=0 to High(arrIndex) do
                                        arrIndex[i]:=i;
                        end;
                ALG_Neutral :
                        begin
                                k:=0;
                                for i:=0 to High(refBulkData.NeutralYears.arrYears) do
                                  begin
                                        for j:=0 to High(refBulkData.arrYears) do
                                          begin
                                                if refBulkData.NeutralYears.arrYears[i]=refBulkData.ArrRearrangedYears[j].YearNO1 then
                                                  begin
                                                        SetLength(arrIndex,k+1);
                                                        arrIndex[k]:=j;
                                                        k:=k+1;
                                                  end;
                                          end;
                                  end;
                        end;
                ALG_COLD :
                        begin
                                k:=0;
                                for i:=0 to High(refBulkData.ColdYears.arrYears) do
                                  begin
                                        for j:=0 to High(refBulkData.arrYears) do
                                          begin
                                                if refBulkData.ColdYears.arrYears[i]=refBulkData.ArrRearrangedYears[j].YearNO1 then
                                                  begin
                                                        SetLength(arrIndex,k+1);
                                                        arrIndex[k]:=j;
                                                        k:=k+1;
                                                  end;
                                          end;
                                  end;
                        end;
                ALG_WARM :
                        begin
                                k:=0;
                                for i:=0 to High(refBulkData.WarmYears.arrYears) do
                                  begin
                                        for j:=0 to High(refBulkData.arrYears) do
                                          begin
                                                if refBulkData.WarmYears.arrYears[i]=refBulkData.ArrRearrangedYears[j].YearNO1 then
                                                  begin
                                                        SetLength(arrIndex,k+1);
                                                        arrIndex[k]:=j;
                                                        k:=k+1;
                                                  end;
                                          end;
                                  end;
                        end;
                
        end; // case

        len1:=Length(arrIndex);
        SetLength(refBulkData.D,len1);
        SetLength(refBulkData.arrData,len1);


        len2:=Length(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather);

        for i:=0 to len1-1 do
          begin
                SetLength(refBulkData.arrData[i],len2);
                refBulkData.D[i].Value:=0;
          end;

        for i:=0 to len1-1 do
          begin
                for j:=0 to len2-1 do
                  begin
                        refBulkData.arrData[i,j].Value:=Sqrt(
                                Power(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather[j].Rad - refBulkData.ArrRearrangedYears[arrIndex[i]].arrNormalizedWeather[j].Rad , 2)+
                                Power(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather[j].Tmax - refBulkData.ArrRearrangedYears[arrIndex[i]].arrNormalizedWeather[j].Tmax , 2)+
                                Power(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather[j].Tmin - refBulkData.ArrRearrangedYears[arrIndex[i]].arrNormalizedWeather[j].Tmin , 2)+
                                Power(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather[j].Rain - refBulkData.ArrRearrangedYears[arrIndex[i]].arrNormalizedWeather[j].Rain , 2)
                                );
                        refBulkData.arrData[i,j].Rad:=refBulkData.ArrRearrangedYears[arrIndex[i]].arrWeather[j].Rad;
                        refBulkData.arrData[i,j].Tmax:=refBulkData.ArrRearrangedYears[arrIndex[i]].arrWeather[j].Tmax;
                        refBulkData.arrData[i,j].Tmin:=refBulkData.ArrRearrangedYears[arrIndex[i]].arrWeather[j].Tmin;
                        refBulkData.arrData[i,j].Rain:=refBulkData.ArrRearrangedYears[arrIndex[i]].arrWeather[j].Rain;

                        refBulkData.D[i].Value:=refBulkData.D[i].Value+refBulkData.arrData[i,j].Value;
                  end;
                refBulkData.D[i].Value:=refBulkData.D[i].Value / ( Length(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather) );
                refBulkData.D[i].Year:=refBulkData.ArrRearrangedYears[arrIndex[i]].YearNO1;
          end;

          // sorting
          for i:=0 to len1-1 do
                for j:=i to len1-1 do
                  begin
                        if refBulkData.D[i].Value>refBulkData.D[j].Value then
                           begin
                                temp:=refBulkData.D[i];
                                refBulkData.D[i]:=refBulkData.D[j];
                                refBulkData.D[j]:=temp;
                           end;
                  end;

          ///////////////////////////////
          str(refBulkData.AlgorithmType,s);
          MainForm.RichEditLOG.Lines.Add(' # OLD Method ');
          MainForm.RichEditLOG.Lines.Add('  Algorithm type = '+s);
          for i:=0 to high(refBulkData.D) do
             begin
                        str(refBulkData.D[i].Year,s1);
                        str(refBulkData.D[i].Value:4:4,s2);
                        MainForm.RichEditLOG.Lines.Add('     '+s1+'  => '+s2);
             end;
end;

// using group algorithm
procedure Calculate_D_New_Method(var refBulkData : TBulkData);
var
        i,j          :       integer;
        len1,len2       :       integer;
        temp            :       TD_Data;
        s,s1,s2         :       string;
begin
        len1:=Length(refBulkData.ArrRearrangedYears);
        len2:=Length(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather);

        SetLength(refBulkData.arrData,len1);
        SetLength(refBulkData.D,len1);

        for i:=0 to len1-1 do
          begin
                SetLength(refBulkData.arrData[i],len2);
                refBulkData.D[i].Value:=0;
          end;

        for i:=0 to len1-1 do
          begin
                for j:=0 to len2-1 do
                  begin
                        refBulkData.arrData[i,j].Value:=Sqrt(
                                Power(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather[j].Rad - refBulkData.ArrRearrangedYears[i].arrNormalizedWeather[j].Rad , 2)+
                                Power(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather[j].Tmax - refBulkData.ArrRearrangedYears[i].arrNormalizedWeather[j].Tmax , 2)+
                                Power(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather[j].Tmin - refBulkData.ArrRearrangedYears[i].arrNormalizedWeather[j].Tmin , 2)+
                                Power(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather[j].Rain - refBulkData.ArrRearrangedYears[i].arrNormalizedWeather[j].Rain , 2)
                                );
                        refBulkData.arrData[i,j].Rad:=refBulkData.ArrRearrangedYears[i].arrWeather[j].Rad;
                        refBulkData.arrData[i,j].Tmax:=refBulkData.ArrRearrangedYears[i].arrWeather[j].Tmax;
                        refBulkData.arrData[i,j].Tmin:=refBulkData.ArrRearrangedYears[i].arrWeather[j].Tmin;
                        refBulkData.arrData[i,j].Rain:=refBulkData.ArrRearrangedYears[i].arrWeather[j].Rain;

                        refBulkData.D[i].Value:=refBulkData.D[i].Value+refBulkData.arrData[i,j].Value;
                  end;
                refBulkData.D[i].Value:=refBulkData.D[i].Value / ( Length(refBulkData.RearrangedRefrenceYear.arrNormalizedWeather) );
                refBulkData.D[i].Year:=refBulkData.ArrRearrangedYears[i].YearNO1;
          end;

          // sorting
          for i:=0 to len1-1 do
                for j:=i to len1-1 do
                  begin
                        if refBulkData.D[i].Value>refBulkData.D[j].Value then
                           begin
                                temp:=refBulkData.D[i];
                                refBulkData.D[i]:=refBulkData.D[j];
                                refBulkData.D[j]:=temp;
                           end;
                  end;

          ///////////////////////////////
          str(refBulkData.AlgorithmType,s);
          MainForm.RichEditLOG.Lines.Add(' # NEW Method ');
          MainForm.RichEditLOG.Lines.Add('  Algorithm type = '+s);
          for i:=0 to high(refBulkData.D) do
             begin
                        str(refBulkData.D[i].Year,s1);
                        str(refBulkData.D[i].Value:4:4,s2);
                        MainForm.RichEditLOG.Lines.Add('     '+s1+'  => '+s2);
             end;
end;


procedure Conclude_Final_OLD(var refBulkData : TBulkData);
var
        i             :       integer;
        index           :       integer;
        len1,len2       :       integer;
        year_best       :       integer;
        s               :       string;
begin
        year_best:=refBulkData.D[0].Year;

        for i:=0 to High(refBulkData.ArrYears) do
           begin
                if refBulkData.ArrYears[i].YearNO=year_best then
                   begin
                        index:=i;
                        break;
                   end;
           end;

        len1:=Length(refBulkData.RefrenceYear.ArrWeather );
        len2:=Length(refBulkData.ArrYears[index].ArrWeather );

        SetLength(refBulkData.ArrFinalResult, len2);

        ////////////////////////
        str(year_best,s);
        MainForm.RichEditLOG.Lines.Add('      The Best Year= '+s+#10);

        for i:=0 to len2-1 do
          begin
                if i<len1 then
                  begin
                        refBulkData.ArrFinalResult[i]:=refBulkData.RefrenceYear.ArrWeather[i];
                  end
                else
                  begin
                        refBulkData.ArrFinalResult[i]:=refBulkData.ArrYears[index].ArrWeather[i];
                  end;
          end;
end;

procedure Conclude_Final_New(var refBulkData : TBulkData);
var
        i             :       integer;
        index           :       integer;
        len1,len2       :       integer;
        year_best       :       integer;
        s               :       string;
begin
        year_best:=refBulkData.D[0].Year;

        for i:=0 to High(refBulkData.ArrYears) do
           begin
                if refBulkData.ArrYears[i].YearNO=year_best then
                   begin
                        index:=i;
                        break;
                   end;
           end;

        len1:=Length(refBulkData.RefrenceYear.ArrWeather );
        len2:=Length(refBulkData.ArrYears[index].ArrWeather );

        SetLength(refBulkData.ArrFinalResult, len2);

        ////////////////////////
        str(year_best,s);
        MainForm.RichEditLOG.Lines.Add('      The Best Year= '+s+#10);

        for i:=0 to len2-1 do
          begin
                if i<len1 then
                  begin
                        refBulkData.ArrFinalResult[i]:=refBulkData.RefrenceYear.ArrWeather[i];
                  end
                else
                  begin
                        refBulkData.ArrFinalResult[i]:=refBulkData.ArrYears[index].ArrWeather[i];
                  end;
          end;
end;

function Combine_Year_Day(y : integer; d : integer): string;
var
        s,s1,s2       :       string;
begin
        y:=y mod 100;
        str(y,s1);
        if y<10 then
                s1:='0'+s1;

        str(d,s2);
        if d<10 then
           begin
                s2:='00'+s2;
           end
        else
           if d<100 then
                begin
                        s2:='0'+s2
                end;

        s:=s1+s2;
        Combine_Year_Day:=s;
end;

procedure Dump_Result(var refBulkData : TBulkData);
       //var refAutomaticData : TAutomaticData);
const
  blank           = '     ';
var
  i            :       integer;
  result_file     :       TEXTFile;
  s1,s2,s3,s4     :       string;
  s               :       string;

  // for  procedure Interpret_FileName
  FullFileName : string;
  Path : string;
  FileName : string;
  Extension : string;
  Year : integer;
  Pattern : string;

  LastTwoDigit : string;
  refFile : TextFile;
  FileHeaderLine : string;
  slist : TStringList;
begin
  // to get last 2 digit from 4 digit predicted year
  Interpret_FileName(refBulkData.AutomaticFileParameters.FileFullNamePredict,
    Path, FileName, Extension, Year, Pattern);
  LastTwoDigit := copy(IntToStr(year),3,2);

  AssignFile(refFile, refBulkData.AutomaticFileParameters.FileFullNameRefrence);
  try
    Reset(refFile);
    sList := TStringList.Create;
    while (Copy(FileHeaderLine,1,5) <> '@DATE') do
    begin
      ReadLn(refFile, FileHeaderLine);
      sList.Add(FileHeaderLine);
    end;
  finally
    CloseFile(refFile);
  end;

  AssignFile(result_file,refBulkData.AutomaticFileParameters.FileFullNamePredict);
  try
    Rewrite(result_file);
  except
    on EInOutError do MainForm.HandleError(ERR_WriteToFile,'');
  end;

  // writing header lines
  for FileHeaderLine in sList do
    Writeln(result_file,FileHeaderLine);
  sList.Free;

  for i:=0 to High(refBulkData.ArrFinalResult) do
    begin

      s:=Combine_Year_Day(refBulkData.D[0].Year,i+1);

      // correct year for output
      Delete(s,1,2);
      Insert(LastTwoDigit,s,1);

      // exclude last additional line when year is 365
      if ((not isLeapYear(Year)) and (i=High(refBulkData.ArrFinalResult))) then
        break;

      // formated output to file
      writeln( result_file,s,
                          refBulkData.ArrFinalResult[i].Rad:6:1,
                          refBulkData.ArrFinalResult[i].Tmax:6:1,
                          refBulkData.ArrFinalResult[i].Tmin:6:1,
                          refBulkData.ArrFinalResult[i].Rain:6:1
             );
    end;

  try
    CloseFile(result_file);
  except
    on EInOutError do MainForm.HandleError(ERR_CloseFile,'');
  end;
end;

procedure Seperate_OLD(
               var PP      :       TProgramParameters;
               var AF      :       TAutomaticFile;
               var BD      :       TBulkData );
var
        i,j           :       integer;
                       
begin
        for i:=0 to High(AF.ArrAutomatic) do
          begin
                BD.AutomaticFileParameters.FileFullNameRefrence:=AF.ArrAutomatic[i].FileFullNameRefrence;
                BD.AutomaticFileParameters.FileFullNameHistory:=AF.ArrAutomatic[i].FileFullNameHistory;
                BD.AutomaticFileParameters.FileFullNamePredict:=AF.ArrAutomatic[i].FileFullNamePredict;

                MainForm.RichEditLOG.Lines.Add(' # Start Processing Refrence File: '+ BD.AutomaticFileParameters.FileFullNameRefrence);
                MainForm.RichEditLOG.Lines.Add(' # Strat Processing History File: '+ BD.AutomaticFileParameters.FileFullNameHistory);
                MainForm.RichEditLOG.Lines.Add(' # Dumping Predict File: '+ BD.AutomaticFileParameters.FileFullNamePredict);

                Read_Refrence_File(BD);
                Just_Copy_Refrence_To_Rearranged_Data(BD);
                Calculate_Statistical_Data_For_Rearranged_Datas(BD.RearrangedRefrenceYear);

                Read_History_Data_Seperate(BD);
                Just_Copy_History_To_Rearranged_Data(BD);
                for j:=0 to High(BD.ArrRearrangedYears) do
                   begin
                        Calculate_Statistical_Data_For_Rearranged_Datas(BD.ArrRearrangedYears[j]);
                   end;
                Calculate_D_Old_Method(BD);

                Conclude_Final_OLD(BD);

                Dump_Result(BD);
          end; //for i
end;

procedure Seperate_NEW(
               var PP      :       TProgramParameters;
               var AF      :       TAutomaticFile;
               var BD      :       TBulkData );
var
        i,j           :       integer;
                       
begin
        for i:=0 to High(AF.ArrAutomatic) do
          begin
                BD.AutomaticFileParameters.FileFullNameRefrence:=AF.ArrAutomatic[i].FileFullNameRefrence;
                BD.AutomaticFileParameters.FileFullNameHistory:=AF.ArrAutomatic[i].FileFullNameHistory;
                BD.AutomaticFileParameters.FileFullNamePredict:=AF.ArrAutomatic[i].FileFullNamePredict;


                MainForm.RichEditLOG.Lines.Add(' # Start Processing Refrence File: '+ BD.AutomaticFileParameters.FileFullNameRefrence);
                MainForm.RichEditLOG.Lines.Add(' # Strat Processing History File: '+ BD.AutomaticFileParameters.FileFullNameHistory);
                MainForm.RichEditLOG.Lines.Add(' # Dumping Predict File: '+ BD.AutomaticFileParameters.FileFullNamePredict);

                Read_Refrence_File(BD);
                Make_Rearranged_Refrence(BD);
                Make_Groups_On_Rearranged_Refrence(BD,PP.GroupSize);
                Calculate_Statistical_Data_For_Rearranged_Datas(BD.RearrangedRefrenceYear);

                Read_History_Data_Seperate(BD);
                Make_Rearranged_Data(BD);
                Make_Groups_On_Rearranged_Data(BD,PP.GroupSize);
                for j:=0 to High(BD.ArrRearrangedYears) do
                   begin
                        Calculate_Statistical_Data_For_Rearranged_Datas(BD.ArrRearrangedYears[j]);
                   end;
                Calculate_D_New_Method(BD);

                Conclude_Final_New(BD);

                Dump_Result(BD);
          end; //for i
end;

procedure Integrate_OLD(
               var PP      :       TProgramParameters;
               var AF      :       TAutomaticFile;
               var BD      :       TBulkData );
var
  i,j : integer;
begin
        for i:=0 to High(AF.ArrAutomatic) do
          begin
                BD.AutomaticFileParameters.FileFullNameRefrence:=AF.ArrAutomatic[i].FileFullNameRefrence;
                BD.AutomaticFileParameters.FileFullNameHistory:=AF.ArrAutomatic[i].FileFullNameHistory;
                BD.AutomaticFileParameters.FileFullNamePredict:=AF.ArrAutomatic[i].FileFullNamePredict;

                MainForm.RichEditLOG.Lines.Add(' # Start Processing Refrence File: '+ BD.AutomaticFileParameters.FileFullNameRefrence);
                MainForm.RichEditLOG.Lines.Add(' # Strat Processing History File: '+ BD.AutomaticFileParameters.FileFullNameHistory);
                MainForm.RichEditLOG.Lines.Add(' # Dumping Predict File: '+ BD.AutomaticFileParameters.FileFullNamePredict);

                Read_Refrence_File(BD);
                Just_Copy_Refrence_To_Rearranged_Data(BD);
                Calculate_Statistical_Data_For_Rearranged_Datas(BD.RearrangedRefrenceYear);

                Read_One_Multi_History_Data_File(BD);
                Just_Copy_History_To_Rearranged_Data(BD);
                for j:=0 to High(BD.ArrRearrangedYears) do
                   begin
                        Calculate_Statistical_Data_For_Rearranged_Datas(BD.ArrRearrangedYears[j]);
                   end;
                Calculate_D_Old_Method(BD);

                Conclude_Final_OLD(BD);

                Dump_Result(BD);
          end; //for i
end;

procedure Integrate_NEW(
               var PP      :       TProgramParameters;
               var AF      :       TAutomaticFile;
               var BD      :       TBulkData );
var
  i,j : integer;
                       
begin
        for i:=0 to High(AF.ArrAutomatic) do
          begin
                BD.AutomaticFileParameters.FileFullNameRefrence:=AF.ArrAutomatic[i].FileFullNameRefrence;
                BD.AutomaticFileParameters.FileFullNameHistory:=AF.ArrAutomatic[i].FileFullNameHistory;
                BD.AutomaticFileParameters.FileFullNamePredict:=AF.ArrAutomatic[i].FileFullNamePredict;

                MainForm.RichEditLOG.Lines.Add(' # Start Processing Refrence File: '+ BD.AutomaticFileParameters.FileFullNameRefrence);
                MainForm.RichEditLOG.Lines.Add(' # Strat Processing History File: '+ BD.AutomaticFileParameters.FileFullNameHistory);
                MainForm.RichEditLOG.Lines.Add(' # Dumping Predict File: '+ BD.AutomaticFileParameters.FileFullNamePredict);

                Read_Refrence_File(BD);
                Make_Rearranged_Refrence(BD);
                Make_Groups_On_Rearranged_Refrence(BD,PP.GroupSize);
                Calculate_Statistical_Data_For_Rearranged_Datas(BD.RearrangedRefrenceYear);

                Read_One_Multi_History_Data_File(BD);
                Make_Rearranged_Data(BD);
                Make_Groups_On_Rearranged_Data(BD,PP.GroupSize);
                for j:=0 to High(BD.ArrRearrangedYears) do
                   begin
                        Calculate_Statistical_Data_For_Rearranged_Datas(BD.ArrRearrangedYears[j]);
                   end;
                Calculate_D_New_Method(BD);

                Conclude_Final_New(BD);

                Dump_Result(BD);
          end; //for i
end;

procedure TMainForm.mnuFileMulti1Click(Sender: TObject);
var
  frmMulti : TfrmMulti;
  f : TextFile;
begin
  frmMulti := TfrmMulti.Create(nil);
  try
    spDynamicSkinForm1.ClientInActiveEffect := True;
    frmMulti.Caption := 'New Project for MultiYears WTH file';
    frmMulti.spSkinFileEdit2.Text := HistoricWthFolder + '\';
    frmMulti.spSkinDirectoryEdit1.Text := PredictedWtgFolder + '\';
    frmMulti.ShowModal;
    spDynamicSkinForm1.ClientInActiveEffect := False;

    if frmMulti.ModalResult = mrOK then
       begin
         frmMulti.spSkinSaveDialog1.InitialDir := ProjectFolder;
         if frmMulti.spSkinSaveDialog1.Execute then
         begin
            if FileExists(frmMulti.spSkinSaveDialog1.FileName) then
            begin
              if spSkinMessage1.MessageDlg('The file '+frmMulti.spSkinSaveDialog1.FileName+' already exists.  Overwrite?',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 exit;
            end;
            AssignFile(f, frmMulti.spSkinSaveDialog1.FileName);
            try
              try
                Rewrite(f);
                write(f,'*WEATHER KNN: ');
                writeln(f,ExtractFileName(frmMulti.spSkinSaveDialog1.FileName));
                writeln(f,' ');
                writeln(f,'*FILES');
                writeln(f,' ');
                writeln(f,'@N  WEATHER     WTHFILE      WTHDIR');
                write(f,'1 WEATH ');
                write(f,ExtractFileName(frmMulti.spSkinFileEdit1.Text));
                write(f,' ');
                writeln(f,ExtractFilePath(frmMulti.spSkinFileEdit1.Text));
                write(f,'1 HISTO ');
                write(f,ExtractFileName(frmMulti.spSkinFileEdit2.Text));
                write(f,' ');
                writeln(f,ExtractFilePath(frmMulti.spSkinFileEdit2.Text));
                write(f,'1 PREDICT ');
                write(f,ExtractFileName(frmMulti.spSkinFileEdit1.Text));
                write(f,' ');
                writeln(f,frmMulti.spSkinDirectoryEdit1.Text);
              except
                on E : EInOutError do
                  spSkinMessage1.MessageDlg('File '+frmMulti.spSkinSaveDialog1.FileName+
                  ' reading error' + '('+E.Message+')!', mtError, [mbOk], 0);
              else
                raise;
              end;
            finally
              CloseFile(f);
            end;
         end;
       end;
       spSkinNoteBook1.PageIndex := 0;
  finally
    frmMulti.Free;
  end;
  UpdateProjectFolderListBox;
end;

procedure TMainForm.cboYearsTypeChange(Sender: TObject);
begin
  if cboYearsType.ItemIndex = 4 then
    spSkinGroupBox4.Visible := True
  else
    spSkinGroupBox4.Visible := False;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TAboutFrm, AboutFrm);
    spDynamicSkinForm1.ClientInActiveEffect := True;
    AboutFrm.Showmodal;
    spDynamicSkinForm1.ClientInActiveEffect := False;
  finally
    AboutFrm.Free;
  end;
end;

procedure TMainForm.btnGoClick(Sender: TObject);
var
  i : integer;
  s,t : string;
  fName,fExt : string;
  //Ini : TIniFile;
begin
  i := spSkinListBox1.ItemIndex;
  s := spSkinListBox1.Items.Strings[i];
  t := ExtractFileName (s);
  fExt := UpperCase(ExtractFileExt(s));
  fName := IncludeTrailingBackSlash (ProjectFolder)+ t;

  if fExt='.SWA' then
  begin
    sfeSep.Text := fName;
    sfeSep.Enabled := true;
    sfeMulti.Enabled := false;
    spSkinStdLabel1.Enabled := true;
    spSkinStdLabel2.Enabled := false;
    rgrChoice.ItemIndex := 0;
  end;

  if fExt='.MWA' then
  begin
    sfeMulti.Text := fName;
    sfeSep.Enabled := false;
    sfeMulti.Enabled := true;
    spSkinStdLabel1.Enabled := false;
    spSkinStdLabel2.Enabled := true;
    rgrChoice.ItemIndex := 1;
  end;

  spSkinNoteBook1.PageIndex := 1;

  spSkinSpeedButRun.Enabled := True;
  spSkinSpeedButRun.ImageIndex := 4;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  k, i : integer;
begin
  Application.OnHint := ShowHint;
  spSkinNoteBook1.PageIndex := 0;
  AppPath := IncludeTrailingBackSlash(ExtractFileDir (Application.Exename));
  GetSubDirs (AppPath);

  ReadProFile;
  Read_Registry;
  if HistoricWthFolder='' then
    HistoricWthFolder := DssatWeatherFolder;
  if PredictedWtgFolder ='' then
    PredictedWtgFolder := DssatGenFolder;

  Inc (ProgramStarts);
  if rgrChoice.ItemIndex = 0 then
  begin
    sfeSep.Enabled := true;
    sfeMulti.Enabled := false;
    spSkinStdLabel1.Enabled := true;
    spSkinStdLabel2.Enabled := false;
  end else
  begin
    sfeSep.Enabled   := false;
    sfeMulti.Enabled := true;
    spSkinStdLabel1.Enabled := false;
    spSkinStdLabel2.Enabled := true;
  end;
  MainForm.Caption := 'Weather Analogue Version '+ rzVersionInfo1.FileVersion;

  spSkinSpeedButClear.Enabled := False;
  spSkinSpeedButClear.ImageIndex := 3;
  spSkinSpeedButRun.Enabled := False;
  spSkinSpeedButRun.ImageIndex := 5;

  UpdateProjectFolderListBox;
   Application.HelpFile := ExtractFilePath(Application.ExeName) +
    'WeatherAnalogue.chm';
end;

procedure TMainForm.HelpContents(Sender: TObject);
begin
  HtmlHelp(0, Application.HelpFile, HH_DISPLAY_TOC, 0);
end;


procedure TMainForm.HelpHowToUseItem1Click(Sender: TObject);
var
  Query: THH_Fts_QueryW;
begin
  with Query do
  begin
    cbStruct:= SizeOf(THH_Fts_QueryW);
    fUniCodeStrings:= True;
    pszSearchQuery:= '';
    iProximity:= 0;
    fStemmedSearch:= True;
    fTitleOnly:= False;
    fExecute:= True;
    pszWindow:= nil;
  end;
  HtmlHelp(0, Application.HelpFile, HH_DISPLAY_SEARCH, DWORD(@Query));
end;

procedure TMainForm.HelpSearchItem1Click(Sender: TObject);
begin
  HtmlHelp(0, Application.HelpFile, HH_DISPLAY_INDEX, DWORD(PWideChar('')));
end;

procedure TMainForm.Write_Registry;
var
  Section : string;
begin
  FIniFile := TRegIniFile.Create ('\Software\DSSAT47');
  FiniFile.RootKey := HKey_Current_User;
  {
  Directories
  }
  Section := 'WeatherAnalogue';

  FiniFile.WriteInteger(Section,'ProgramStarts',ProgramStarts);
  FiniFile.WriteString (Section,'SkinName',     SkinFileName);
  FiniFile.WriteBool   (Section,'RandomSkin',   RandomSkin);

  FiniFile.WriteString   (Section,'ColdYearsFile', ColdYearsFile);
  FiniFile.WriteString   (Section,'NeutralYearsFile', NeutralYearsFile);
  FiniFile.WriteString   (Section,'WarmYearsFile', WarmYearsFile);
  FiniFile.WriteString   (Section,'ProjectFolder', ProjectFolder);
  FiniFile.WriteString   (Section,'HistoricWthFolder', HistoricWthFolder);
  FiniFile.WriteString   (Section,'PredictedWtgFolder', PredictedWtgFolder);

  FiniFile.Free;
end;

procedure TMainForm.rgrChoiceClick(Sender: TObject);
begin
  if rgrChoice.ItemIndex = 0 then
    begin
      sfeSep.Enabled:=true;
      sfeMulti.Enabled:=false;
      spSkinStdLabel1.Enabled := true;
      spSkinStdLabel2.Enabled := false;
      if sfeSep.Text = '' then
      begin
        btnRun.Enabled := false;
        spSkinSpeedButRun.Enabled := false;
      end
      else
      begin
        btnRun.Enabled := true;
        spSkinSpeedButRun.Enabled := true;
      end;
    end
  else // selected multi years
    begin
      sfeSep.Enabled:=false;
      sfeMulti.Enabled:=true;
      spSkinStdLabel1.Enabled := false;
      spSkinStdLabel2.Enabled := true;
      if sfeMulti.Text = '' then
      begin
        btnRun.Enabled := false;
        spSkinSpeedButRun.Enabled := false;
      end
      else
      begin
        btnRun.Enabled := true;
        spSkinSpeedButRun.Enabled := true;
      end;
    end;
end;

procedure TMainForm.RichEditLOGChange(Sender: TObject);
begin
  if RichEditLOG.Lines.Text = '' then
  begin
    btnSave.Enabled := false;
    btnClear.Enabled := false;
  end
  else
  begin
    btnSave.Enabled := true;
    btnClear.Enabled := true;
  end;
end;

procedure TMainForm.sfeMultiChange(Sender: TObject);
begin
  if UpperCase((ExtractFileExt(sfeMulti.Text))) <> '.MWA' then
  begin
    spSkinMessage1.MessageDlg('Project name should have *.mwa extension for this type of project!',
      mtError, [mbOk], 0);
    btnRun.Enabled := false;
    spSkinSpeedButRun.Enabled := false;
  end
  else
  begin
    btnRun.Enabled := true;
    spSkinSpeedButRun.Enabled := true;
  end;
end;

procedure TMainForm.sfeSepChange(Sender: TObject);
begin
  if UpperCase((ExtractFileExt(sfeSep.Text))) <> '.SWA' then
  begin
    spSkinMessage1.MessageDlg('Project name should have *.swa extension for this type of project!',
      mtError, [mbOk], 0);
    btnRun.Enabled := false;
    spSkinSpeedButRun.Enabled := false;
  end
  else
  begin
    btnRun.Enabled := true;
    spSkinSpeedButRun.Enabled := true;
  end;
end;

procedure TMainForm.Read_Registry;
var
  Section  : string;
  Temp     : string;
  Drive    : string;
begin
  FIniFile := TRegIniFile.Create ('\Software\DSSAT47');
  FiniFile.RootKey := HKey_Current_User;
  Temp     := ExtractFileDrive(Application.Exename);
  WorkDir  := ExtractFilePath (Application.Exename);
  Drive    := Trim (Temp);
  {
  Directories
  }
  Section       := 'WeatherAnalogue';
  ProgramStarts := FiniFile.ReadInteger(Section,'ProgramStarts',0);
  RandomSkin    := FiniFile.ReadBool   (Section,'RandomSkin',false);
  SkinFileName  := FiniFile.ReadString (Section,'SkinName',  '');

  ColdYearsFile := FiniFile.ReadString (Section,'ColdYearsFile', '');
  if ColdYearsFile='' then  ColdYearsFile := WorkDir + 'cold.lst';

  NeutralYearsFile := FiniFile.ReadString (Section,'NeutralYearsFile', '');
  if NeutralYearsFile='' then  NeutralYearsFile := WorkDir + 'neutral.lst';

  WarmYearsFile := FiniFile.ReadString (Section,'WarmYearsFile', '');
  if WarmYearsFile='' then  WarmYearsFile := WorkDir + 'warm.lst';

  ProjectFolder := FiniFile.ReadString (Section,'ProjectFolder', '');
  if ProjectFolder='' then  ProjectFolder := WorkDir + 'Projects';

  HistoricWthFolder := FiniFile.ReadString (Section,'HistoricWthFolder', '');
  PredictedWtgFolder := FiniFile.ReadString (Section,'PredictedWtgFolder', '');

  FiniFile.Free;

  FIniFile      := TRegIniFile.Create ('\Software\DSSAT47');
  FiniFile.RootKey := HKey_Current_User;
  {
  Directories
  }
  Section       := 'Profile';
  EMailContact  := FiniFile.ReadString (Section,'EMail',       'gerrit.hoogenboom@wsu.edu');
  RegNo         := FiniFile.ReadString (Section,'Registration','');
  Company       := FiniFile.ReadString (Section,'Company',     '');
  Reguser       := FiniFile.ReadString (Section,'Reguser',     '');

  Section       := 'Editors';
  Editor        := FiniFile.ReadString (Section,'Text','NotePad.exe');

  FIniFile.Free;

  if FileExists (SkinFileName) then
    Temp := IncludeTrailingBackSlash (ExtractFileDir (SkinFileName));

  Randomize;

  if RandomSkin then
  begin
    FileSearch (Temp, '*.skn', false, SkinFileName);
    If FileExists (SkinFileName) then
      LoadSkin (SkinFileName)
    else
      spSkinData1.CompressedStoredSkin := spCompressedStoredSkin1;
  end else
  begin
    if FileExists (SkinFileName) then
      LoadSkin (SkinFileName)
    else
      spSkinData1.CompressedStoredSkin := spCompressedStoredSkin1;
  end;
end;

procedure TMainForm.LoadSkin(AFileName: String);
var
  Ext : String;
begin
  SkinFileName := AFileName;
  Ext := ExtractFileExt(AFileName);
  Ext := LowerCase(Ext);
  if Ext = '.ini' then spSkinData1.LoadFromFile (AFileName);
  if Ext = '.skn' then spSkinData1.LoadFromCompressedFile (AFileName);
end;

procedure TMainForm.mnuFileSepClick(Sender: TObject);
var
  frmSeparate : TfrmSeparate;
  f : TextFile;
begin
  frmSeparate := TfrmSeparate.Create(self);
  try
    spDynamicSkinForm1.ClientInActiveEffect := True;
    frmSeparate.Caption := 'New Project for separate WTH files';
    frmSeparate.spSkinFileEdit2.Text := HistoricWthFolder + '\';
    frmSeparate.spSkinDirectoryEdit1.Text := PredictedWtgFolder + '\';
    frmSeparate.ShowModal;
    spDynamicSkinForm1.ClientInActiveEffect := False;

    if frmSeparate.ModalResult = mrOK then
       begin
         frmSeparate.spSkinSaveDialog1.InitialDir := ProjectFolder;
         if frmSeparate.spSkinSaveDialog1.Execute then
         begin
            if FileExists(frmSeparate.spSkinSaveDialog1.FileName) then
            begin
              if spSkinMessage1.MessageDlg('The file '+frmSeparate.spSkinSaveDialog1.FileName+' already exists.  Overwrite?',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 exit;
            end;
            AssignFile(f, frmSeparate.spSkinSaveDialog1.FileName);
            try
              try
                Rewrite(f);
                write(f,'*WEATHER KNN: ');
                writeln(f,ExtractFileName(frmSeparate.spSkinSaveDialog1.FileName));
                writeln(f,' ');
                writeln(f,'*FILES');
                writeln(f,' ');
                writeln(f,'@N  WEATHER     WTHFILE      WTHDIR');
                write(f,'1 WEATH ');
                write(f,ExtractFileName(frmSeparate.spSkinFileEdit1.Text));
                write(f,' ');
                writeln(f,ExtractFilePath(frmSeparate.spSkinFileEdit1.Text));
                write(f,'1 HISTO ');
                write(f,ExtractFileName(frmSeparate.spSkinFileEdit2.Text));
                write(f,' ');
                writeln(f,ExtractFilePath(frmSeparate.spSkinFileEdit2.Text));
                write(f,'1 PREDICT ');
                write(f,ExtractFileName(frmSeparate.spSkinFileEdit1.Text));
                write(f,' ');
                writeln(f,frmSeparate.spSkinDirectoryEdit1.Text);
              except
                on E : EInOutError do
                  spSkinMessage1.MessageDlg('File '+ frmSeparate.spSkinSaveDialog1.FileName +
                  ' reading error' + '('+E.Message+')!', mtError, [mbOk], 0);
                else
                  raise;
              end;
            finally
              CloseFile(f);
            end;
         end;
       end;
       spSkinNoteBook1.PageIndex := 0;
  finally
    frmSeparate.Free;
  end;
  UpdateProjectFolderListBox;
end;

procedure TMainForm.OpenProject1Click(Sender: TObject);
var
  fullFileName, fExt : string;
begin
  with spSkinOpenDialog1 do
  begin
    InitialDir  := ProjectFolder;
    Filter      :=
      'All Files (*.*)|*.*|Separate WTH files (*.swa)|*.swa|Multi Years WTH File (*.mwa)|*.mwa';
    FilterIndex := 1;
    Title       := 'Select a Project';
    FileName    := '';
    if Execute then
    begin
      fullFileName := FileName;
      fExt := UpperCase(ExtractFileExt(fullFileName));
      if fExt='.SWA' then
      begin
        sfeSep.Text := fullFileName;
        sfeSep.Enabled := true;
        sfeMulti.Enabled := false;
        spSkinStdLabel1.Enabled := true;
        spSkinStdLabel2.Enabled := false;
        rgrChoice.ItemIndex := 0;
      end;

      if fExt='.MWA' then
      begin
        sfeMulti.Text := fullFileName;
        sfeSep.Enabled := false;
        sfeMulti.Enabled := true;
        spSkinStdLabel1.Enabled := false;
        spSkinStdLabel2.Enabled := true;
        rgrChoice.ItemIndex := 1;
      end;

      spSkinNoteBook1.PageIndex := 1;

      spSkinSpeedButRun.Enabled := True;
      spSkinSpeedButRun.ImageIndex := 4;
    end; // Execute
  end;
end;

procedure TMainForm.FileSearch(const PathName, FileName : string;
                               const InDir : boolean; var RFile : string);
var
  Rec      : TSearchRec;
  Path,s   : string;
  TempList : TStrings;
  i        : integer;
begin
  TempList := TStringList.Create;
  Path := IncludeTrailingBackslash(PathName);
  if FindFirst(Path + FileName, faAnyFile - faDirectory, Rec) = 0 then
  try
    repeat
      TempList.Add (Path + Rec.Name);
    until FindNext(Rec) <> 0;
  finally
    FindClose(Rec);
  end;
  if TempList.Count > 0 then
  begin
    i := random (TempList.Count - 1);
    s := ExpandFileName (TempList.Strings[i]);
    RFile := s;
  end;
  TempList.free;
end;    

procedure TMainForm.GetSubDirs(const sRootDir: string);
var
  srSearch : TSearchRec;
  sSearchPath : string;  
begin
  try
    sSearchPath := sRootDir;
    if FindFirst(sSearchPath + '*', faDirectory, srSearch) = 0 then
      repeat
        if ((srSearch.Attr and faDirectory) = faDirectory) and
          (srSearch.Name <> '.') and
          (srSearch.Name <> '..') then
        begin
          spSkinListBox1.Items.Add (sSearchPath + srSearch.Name);
        end;
      until (FindNext(srSearch) <> 0);

    FindClose(srSearch);
  finally
  end;
end;

procedure TMainForm.btnRunClick(Sender: TObject);
begin
  spSkinSpeedButRunClick(Sender);
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
var
  f : TextFile;
begin
  spSkinSaveDialog1.InitialDir := WorkDir;
  if spSkinSaveDialog1.Execute then
  begin
    AssignFile(f, spSkinSaveDialog1.FileName);
    try
      RichEditLOG.Lines.SaveToFile(spSkinSaveDialog1.FileName);
    except
      on E : EInOutError do
        spSkinMessage1.MessageDlg('File '+ spSkinSaveDialog1.FileName +
          ' reading error' + '('+E.Message+')!', mtError, [mbOk], 0);
      else
        raise;
    end;
  end;
end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
var
  i,k : integer;
  s,t : string;
  fname : string;
begin
  if FilesInProjectFolder>0 then
  begin
    i := spskinlistbox1.ItemIndex;
    s := spSkinListBox1.Items.Strings[i];
    t := extractfilename (s);
    fName := IncludeTrailingBackSlash (ProjectFolder)+t;
    DeleteFile(fName);
    UpdateProjectFolderListBox;
  end;
end;

procedure TMainForm.btnEditProjClick(Sender: TObject);
var
  frmSeparate : TfrmSeparate;
  frmMulti : TfrmMulti;
  f : TextFile;
  i : integer;
  s,t,fExt,fName : string;
  BD    : TBulkData;
  PP    : TProgramParameters;
  AF    : TAutomaticFile;
begin
  i := spSkinListBox1.ItemIndex;
  s := spSkinListBox1.Items.Strings[i];
  t := ExtractFileName (s);
  fExt := UpperCase(ExtractFileExt(s));
  fName := IncludeTrailingBackSlash (ProjectFolder)+ t;

  PP.ColdFileFullName := ColdYearsFile;
  PP.NeutralFileFullName := NeutralYearsFile;
  PP.WarmFileFullName := WarmYearsFile;

  PP.AutoIntegrateFileFullName := fName;
  PP.AutoSeperateFileFullName  := fName;
  PP.GroupSize                 := 1;

  if fExt = '.SWA' then
     AF.AutomaticFileType := FILE_SEPERATE
  else
     AF.AutomaticFileType := FILE_INTEGRATE;

  PP.AutoFileType := AF.AutomaticFileType;

  PP.AlgorithmType := ALG_NORMAL;

  BD.AlgorithmType := PP.AlgorithmType;

  Extract_AutomaticFile_Data(PP,AF,BD);

  if fExt = '.SWA'  then
  begin
    frmSeparate := TfrmSeparate.Create(nil);
    try
      frmSeparate.spSkinFileEdit1.Text := AF.ArrAutomatic[0].FileFullNameRefrence;
      frmSeparate.spSkinFileEdit2.Text := AF.ArrAutomatic[0].FileFullNameHistory;
      frmSeparate.spSkinDirectoryEdit1.Text := AF.ArrAutomatic[0].FilePathPredict;

      spDynamicSkinForm1.ClientInActiveEffect := True;
      frmSeparate.Caption := 'Edit Project for separate WTH files';
      frmSeparate.ShowModal;
      spDynamicSkinForm1.ClientInActiveEffect := False;

      if frmSeparate.ModalResult = mrOK then
         begin
           if frmSeparate.spSkinSaveDialog1.Execute then
           begin
              if FileExists(frmSeparate.spSkinSaveDialog1.FileName) then
              begin
                if spSkinMessage1.MessageDlg('The file '+frmSeparate.spSkinSaveDialog1.FileName+' already exists.  Overwrite?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                   exit;
              end;
              AssignFile(f, frmSeparate.spSkinSaveDialog1.FileName);
              try
                try
                  Rewrite(f);
                  write(f,'*WEATHER KNN: ');
                  writeln(f,ExtractFileName(frmSeparate.spSkinSaveDialog1.FileName));
                  writeln(f,' ');
                  writeln(f,'*FILES');
                  writeln(f,' ');
                  writeln(f,'@N  WEATHER     WTHFILE      WTHDIR');
                  write(f,'1 WEATH ');
                  write(f,ExtractFileName(frmSeparate.spSkinFileEdit1.Text));
                  write(f,' ');
                  writeln(f,ExtractFilePath(frmSeparate.spSkinFileEdit1.Text));
                  write(f,'1 HISTO ');
                  write(f,ExtractFileName(frmSeparate.spSkinFileEdit2.Text));
                  write(f,' ');
                  writeln(f,ExtractFilePath(frmSeparate.spSkinFileEdit2.Text));
                  write(f,'1 PREDICT ');
                  write(f,ExtractFileName(frmSeparate.spSkinFileEdit1.Text));
                  write(f,' ');
                  writeln(f,frmSeparate.spSkinDirectoryEdit1.Text);
                except
                  on E : EInOutError do
                end;
              finally
                CloseFile(f);
              end;
           end;
         end;
    finally
      frmSeparate.Free;
    end;
  end; // sep

  if fExt = '.MWA'  then
  begin
    frmMulti := TfrmMulti.Create(nil);
    try
      frmMulti.spSkinFileEdit1.Text := AF.ArrAutomatic[0].FileFullNameRefrence;
      frmMulti.spSkinFileEdit2.Text := AF.ArrAutomatic[0].FileFullNameHistory;
      frmMulti.spSkinDirectoryEdit1.Text := AF.ArrAutomatic[0].FilePathPredict;

      spDynamicSkinForm1.ClientInActiveEffect := True;
      frmMulti.Caption := 'Edit Project for MultiYears WTH file';
      frmMulti.ShowModal;
      spDynamicSkinForm1.ClientInActiveEffect := False;

      if frmMulti.ModalResult = mrOK then
         begin
           if frmMulti.spSkinSaveDialog1.Execute then
           begin
              if FileExists(frmMulti.spSkinSaveDialog1.FileName) then
              begin
                if spSkinMessage1.MessageDlg('The file '+frmMulti.spSkinSaveDialog1.FileName+' already exists.  Overwrite?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                   exit;
              end;
              AssignFile(f, frmMulti.spSkinSaveDialog1.FileName);
              try
                try
                  Rewrite(f);
                  write(f,'*WEATHER KNN: ');
                  writeln(f,ExtractFileName(frmMulti.spSkinSaveDialog1.FileName));
                  writeln(f,' ');
                  writeln(f,'*FILES');
                  writeln(f,' ');
                  writeln(f,'@N  WEATHER     WTHFILE      WTHDIR');
                  write(f,'1 WEATH ');
                  write(f,ExtractFileName(frmMulti.spSkinFileEdit1.Text));
                  write(f,' ');
                  writeln(f,ExtractFilePath(frmMulti.spSkinFileEdit1.Text));
                  write(f,'1 HISTO ');
                  write(f,ExtractFileName(frmMulti.spSkinFileEdit2.Text));
                  write(f,' ');
                  writeln(f,ExtractFilePath(frmMulti.spSkinFileEdit2.Text));
                  write(f,'1 PREDICT ');
                  write(f,ExtractFileName(frmMulti.spSkinFileEdit1.Text));
                  write(f,' ');
                  writeln(f,frmMulti.spSkinDirectoryEdit1.Text);
                except
                  on E : EInOutError do
                end;
              finally
                CloseFile(f);
              end;
           end;
         end;
    finally
      frmMulti.Free;
    end;
  end; // multi
end;

procedure TMainForm.spSkinListBox1Click(Sender: TObject);
begin
  if spSkinListBox1.ItemIndex >= 0 then
  begin
    btnGo.Enabled   := true;
    btnEditProj.Enabled := true;
    btnViewProj.Enabled := true;
    btnDelete.Enabled := true;
  end
  else
  begin
    btnGo.Enabled   := false;
    btnEditProj.Enabled := false;
    btnViewProj.Enabled := false;
    btnDelete.Enabled := false;
  end;
end;

procedure TMainForm.spSkinSpeedButClearClick(Sender: TObject);
begin
  RichEditLOG.Lines.Clear;
  spSkinSpeedButClear.Enabled := False;
  spSkinSpeedButClear.ImageIndex := 3;
  btnSave.Enabled := false;
  btnClear.Enabled := false;
end;

procedure TMainForm.spSkinSpeedButExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.spSkinSpeedButRunClick(Sender: TObject);
var
  s     : string;
  group : integer;
  BD    : TBulkData;
  PP    : TProgramParameters;
  AF    : TAutomaticFile;
  s1,s2 : string;
begin
  group := trunc (sseGroupSize.value);
  // copy the program datas

  PP.ColdFileFullName := ColdYearsFile;
  PP.NeutralFileFullName := NeutralYearsFile;
  PP.WarmFileFullName := WarmYearsFile;

  PP.AutoIntegrateFileFullName := sfeMulti.Text;
  PP.AutoSeperateFileFullName  := sfeSep.Text;
  PP.GroupSize                 := group;{StrToInt(edtGroupSize.Text);}

  if rgrChoice.ItemIndex = 0 then
     AF.AutomaticFileType := FILE_SEPERATE
  else
     AF.AutomaticFileType := FILE_INTEGRATE;

  PP.AutoFileType := AF.AutomaticFileType;

  case cboYearsType.ItemIndex of
    0 : PP.AlgorithmType := ALG_NORMAL;
    1 : PP.AlgorithmType := ALG_COLD;
    2 : PP.AlgorithmType := ALG_NEUTRAL;
    3 : PP.AlgorithmType := ALG_WARM;
    4 : PP.AlgorithmType := ALG_GROUP;
  end; //case

  BD.AlgorithmType := PP.AlgorithmType;

  MainForm.RichEditLOG.Lines.Add('@ Processing the Form data done.');

  // read the general datas appropriate for all cases

  Extract_AutomaticFile_Data(PP,AF,BD);
  MainForm.RichEditLOG.Lines.Add('@ Extracting data from the Project File done.');

  Read_Cold_Warm_Neutral_Years(PP,BD);
  MainForm.RichEditLOG.Lines.Add('@ Extracting data from Neutral, Cold and Warm files done.');

  //print the decision that is made

  case BD.AlgorithmType of
    ALG_NORMAL  : s2 := 'Algorithm Normal';
    ALG_COLD    : s2 := 'Algorithm Cold';
    ALG_NEUTRAL : s2 := 'Algorithm Neutral';
    ALG_WARM    : s2 := 'Algorithm Warm';
    ALG_GROUP   : s2 := 'Algorithm Group';
  end;

  case AF.AutomaticFileType of
    FILE_SEPERATE  : s1 := 'Files are Seperate';
    FILE_INTEGRATE : s1 := 'File is MultiYears';
  end;

  s:='@ '+s1+', using '+s2+' !';
  MainForm.RichEditLOG.Lines.Add(#10+s);

  // make proper decision upon the given parameters to choose the right algorithm

  case AF.AutomaticFileType of
    FILE_SEPERATE : begin
                      if PP.AlgorithmType = ALG_GROUP then
                        Seperate_NEW (PP,AF,BD)
                      else
                        Seperate_OLD (PP,AF,BD);
                    end;
    FILE_INTEGRATE: begin
                      if PP.AlgorithmType = ALG_GROUP then
                        Integrate_NEW (PP,AF,BD)
                      else
                        Integrate_OLD (PP,AF,BD);
                    end;

  end;

  spSkinSpeedButClear.Enabled := True;
  spSkinSpeedButClear.ImageIndex := 2;
end;

procedure TMainForm.spSkinSpeedButtonHomeClick(Sender: TObject);
begin
  spSkinNotebook1.PageIndex := 0;
  spSkinSpeedButRun.Enabled := false;
end;

procedure TMainForm.spSkinToolBarEx1Items2Click(Sender: TObject);
begin
  spSkinMessage1.MessageDlg ('Setup Weather Analogue.', mtInformation,[mbOk], 0);
end;

procedure TMainForm.Reportaproblem1Click(Sender: TObject);
var
  ErrCode    : integer;
  Param      : string;
  StrEmail,
  StrSubject,
  StrBody    : string;
begin
  StrEmail   := EMailContact;
  StrSubject := 'Error in Weather Analogue - {'+RegNo+'}';
  StrBody    := 'Gerrit,'+chr(11)+chr(11)+'Although Weather Analogue usually works flawlessly, I had a tiny problem:';
  Param      := 'mailto:'+StrEmail+'?subject='+StrSubject+'&Body='+StrBody;
  ErrCode    := ShellExecute (Application.Handle, PChar('open'),
                PChar (Param),PCHar (''),nil,SW_NORMAL);
  HandleError (ErrCode, Param);

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Write_Registry;
  Action := caFree;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if spSkinMessage1.MessageDlg ('Would you like to quit Weather Analogue?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       CanClose := true
    else
       CanClose := false;
end;

procedure TMainForm.CheckforUpdates1Click(Sender: TObject);
begin
  CheckforUpdates;
end;

procedure TMainForm.Configure1Click(Sender: TObject);
var
  frmConfigure : TfrmConfigure;
begin
  frmConfigure := TfrmConfigure.Create(nil);
  try
    spDynamicSkinForm1.ClientInActiveEffect := True;
    frmConfigure.Showmodal;
    spDynamicSkinForm1.ClientInActiveEffect := False;
  finally
    frmConfigure.Free;
  end;
end;

procedure TMainForm.Delete1Click(Sender: TObject);
var
  frmDeleteProj : TfrmDeleteProj;
begin
  frmDeleteProj := TfrmDeleteProj.Create(nil);
  try
    frmDeleteProj.ShowModal;
  finally
    frmDeleteProj.Free;
  end;
  UpdateProjectFolderListBox;
end;

procedure TMainForm.btnViewProjClick(Sender: TObject);
var
  i : integer;
  s,t : string;
  ininame : string;
begin
  i := spskinlistbox1.ItemIndex;
  s := spSkinListBox1.Items.Strings[i];
  t := extractfilename (s);
  IniName := IncludeTrailingBackSlash (ProjectFolder)+t;

  if FileExists (IniName) then
    Executefile (Editor,IniName,AppPath,sw_shownormal);
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  spSkinStatusPanel1.Caption := Application.Hint;
end;

procedure TMainForm.Edit2Click(Sender: TObject);
var
  frmSeparate : TfrmSeparate;
  frmMulti : TfrmMulti;
  f : TextFile;
  BD    : TBulkData;
  PP    : TProgramParameters;
  AF    : TAutomaticFile;
  fullFileName, fExt : string;
begin
    spSkinOpenDialog1.InitialDir  := ProjectFolder;
    spSkinOpenDialog1.Filter      :=
      'All Files (*.*)|*.*|Separate WTH files (*.swa)|*.swa|Multi Years WTH File (*.mwa)|*.mwa';
    spSkinOpenDialog1.FilterIndex := 1;
    spSkinOpenDialog1.Title       := 'Select a Project';
    spSkinOpenDialog1.FileName    := '';
    if spSkinOpenDialog1.Execute then
    begin
      fullFileName := spSkinOpenDialog1.FileName;
      fExt := UpperCase(ExtractFileExt(fullFileName));

      PP.ColdFileFullName := ColdYearsFile;
      PP.NeutralFileFullName := NeutralYearsFile;
      PP.WarmFileFullName := WarmYearsFile;

      PP.AutoIntegrateFileFullName := fullFileName;
      PP.AutoSeperateFileFullName  := fullFileName;
      PP.GroupSize                 := 1;

      if fExt = '.SWA' then
         AF.AutomaticFileType := FILE_SEPERATE
      else
         AF.AutomaticFileType := FILE_INTEGRATE;

      PP.AutoFileType := AF.AutomaticFileType;
      PP.AlgorithmType := ALG_NORMAL;
      BD.AlgorithmType := PP.AlgorithmType;
      Extract_AutomaticFile_Data(PP,AF,BD);

      if fExt = '.SWA'  then
      begin
      frmSeparate := TfrmSeparate.Create(nil);
      try
        frmSeparate.spSkinFileEdit1.Text := AF.ArrAutomatic[0].FileFullNameRefrence;
        frmSeparate.spSkinFileEdit2.Text := AF.ArrAutomatic[0].FileFullNameHistory;
        frmSeparate.spSkinDirectoryEdit1.Text := AF.ArrAutomatic[0].FilePathPredict;

        spDynamicSkinForm1.ClientInActiveEffect := True;
        frmSeparate.Caption := 'Edit Project for separate WTH files';
        frmSeparate.ShowModal;
        spDynamicSkinForm1.ClientInActiveEffect := False;

          if frmSeparate.ModalResult = mrOK then
             begin
               if frmSeparate.spSkinSaveDialog1.Execute then
               begin
                  if FileExists(frmSeparate.spSkinSaveDialog1.FileName) then
                  begin
                    if spSkinMessage1.MessageDlg('The file '+frmSeparate.spSkinSaveDialog1.FileName+
                    ' already exists.  Overwrite?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                       exit;
                  end;
                  AssignFile(f, frmSeparate.spSkinSaveDialog1.FileName);
                  try
                    try
                      Rewrite(f);
                      write(f,'*WEATHER KNN: ');
                      writeln(f,ExtractFileName(frmSeparate.spSkinSaveDialog1.FileName));
                      writeln(f,' ');
                      writeln(f,'*FILES');
                      writeln(f,' ');
                      writeln(f,'@N  WEATHER     WTHFILE      WTHDIR');
                      write(f,'1 WEATH ');
                      write(f,ExtractFileName(frmSeparate.spSkinFileEdit1.Text));
                      write(f,' ');
                      writeln(f,ExtractFilePath(frmSeparate.spSkinFileEdit1.Text));
                      write(f,'1 HISTO ');
                      write(f,ExtractFileName(frmSeparate.spSkinFileEdit2.Text));
                      write(f,' ');
                      writeln(f,ExtractFilePath(frmSeparate.spSkinFileEdit2.Text));
                      write(f,'1 PREDICT ');
                      write(f,ExtractFileName(frmSeparate.spSkinFileEdit1.Text));
                      write(f,' ');
                      writeln(f,frmSeparate.spSkinDirectoryEdit1.Text);
                    except
                      on E : EInOutError do
                    end;
                  finally
                    CloseFile(f);
                  end;
               end;
             end;
        finally
          frmSeparate.Free;
        end;
      end; // sep

      if fExt = '.MWA'  then
      begin
        frmMulti := TfrmMulti.Create(nil);
        try
          frmMulti.spSkinFileEdit1.Text := AF.ArrAutomatic[0].FileFullNameRefrence;
          frmMulti.spSkinFileEdit2.Text := AF.ArrAutomatic[0].FileFullNameHistory;
          frmMulti.spSkinDirectoryEdit1.Text := AF.ArrAutomatic[0].FilePathPredict;

          spDynamicSkinForm1.ClientInActiveEffect := True;
          frmMulti.Caption := 'Edit Project for MultiYears WTH file';
          frmMulti.ShowModal;
          spDynamicSkinForm1.ClientInActiveEffect := False;

          if frmMulti.ModalResult = mrOK then
             begin
               if frmMulti.spSkinSaveDialog1.Execute then
               begin
                  if FileExists(frmMulti.spSkinSaveDialog1.FileName) then
                  begin
                    if spSkinMessage1.MessageDlg('The file '+frmMulti.spSkinSaveDialog1.FileName+
                    ' already exists.  Overwrite?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                       exit;
                  end;
                  AssignFile(f, frmMulti.spSkinSaveDialog1.FileName);
                  try
                    try
                      Rewrite(f);
                      write(f,'*WEATHER KNN: ');
                      writeln(f,ExtractFileName(frmMulti.spSkinSaveDialog1.FileName));
                      writeln(f,' ');
                      writeln(f,'*FILES');
                      writeln(f,' ');
                      writeln(f,'@N  WEATHER     WTHFILE      WTHDIR');
                      write(f,'1 WEATH ');
                      write(f,ExtractFileName(frmMulti.spSkinFileEdit1.Text));
                      write(f,' ');
                      writeln(f,ExtractFilePath(frmMulti.spSkinFileEdit1.Text));
                      write(f,'1 HISTO ');
                      write(f,ExtractFileName(frmMulti.spSkinFileEdit2.Text));
                      write(f,' ');
                      writeln(f,ExtractFilePath(frmMulti.spSkinFileEdit2.Text));
                      write(f,'1 PREDICT ');
                      write(f,ExtractFileName(frmMulti.spSkinFileEdit1.Text));
                      write(f,' ');
                      writeln(f,frmMulti.spSkinDirectoryEdit1.Text);
                    except
                      on E : EInOutError do
                    end;
                  finally
                    CloseFile(f);
                  end;
               end;
             end;
        finally
          frmMulti.Free;
        end;
      end; // multi
    end; // Execute
end;

procedure TMainForm.ExecuteChm(const RelPath : string);
var
  Target,
  DssPath  : string;
  ErrCode : integer;
begin
  DssPath := ExtractFilePath(Application.ExeName);
  Target := DssPath+RelPath;
  if FileExists (Target) then
  begin
    ErrCode := ShellExecute (Application.Handle, PChar('open'),PChar (Target),
       PCHar(''),nil,SW_NORMAL);
    HandleError (ErrCode,Target);
  end else
    spSkinMessage1.MessageDlg('The file '+Target+' could not be found.',
    mtInformation, [mbOk], 0);
end;


procedure TMainForm.Exit1Click(Sender: TObject);
begin
//
  Write_Registry;
  Close;
end;

function TMainForm.FilesInProjectFolder : integer;
begin
  flbProjects.Directory := ProjectFolder;
  flbProjects.Clear;
  flbProjects.Mask := '*.swa;*.mwa';
  flbProjects.Update;
  flbProjects.Refresh;
  Result := flbProjects.Items.Count;
end;

procedure TMainForm.UpdateProjectFolderListBox;
var
  i : integer;
begin
  spSkinListBox1.Clear;
  //if k>0 then
  if (FilesInProjectFolder>0) then
  begin
    for i := 0 to FilesInProjectFolder-1 do
      spSkinListBox1.Items.Add(flbProjects.Items.Strings[i]);
  end;

  if isSelectedFromListBox then
  begin
    btnGo.Enabled   := true;
    btnEditProj.Enabled := true;
    btnViewProj.Enabled := true;
    btnDelete.Enabled := true;
  end
  else
  begin
    btnGo.Enabled   := false;
    btnEditProj.Enabled := false;
    btnViewProj.Enabled := false;
    btnDelete.Enabled := false;
  end;
end;

// checks if file is selected in skinListBox on start page
function TMainForm.isSelectedFromListBox : boolean;
var
  i,k : integer;
  s,t : string;
  fname : string;
begin
  if FilesInProjectFolder>0 then
  begin
    Result := false;
    for i := 0 to FilesInProjectFolder-1 do
      if spskinlistbox1.Selected[i] then
        Result := true;
  end;
end;

procedure TMainForm.ReadProFile;
var
  s : string;
  f : textfile;
begin
  if FileExists(DSSATPROFILEPATH) then
  begin
    Assignfile (f,DSSATPROFILEPATH)
  end
  else
  begin
    spSkinMessage1.MessageDlg('File '+DSSATPROFILEPATH+' does not exists!', mtError, [mbOk], 0);
    exit;
  end;

  try
    try
      reset(f);
      while not EOF(f) do
      begin
        Readln(f,s);
        if UpperCase(copy(s,1,3))='WED' then
        begin
          Delete(s,1,4);
          Delete(s,3,1);
          DssatWeatherFolder := Trim(s);
        end;
        if UpperCase(copy(s,1,3))='WGD' then
        begin
          Delete(s,1,4);
          Delete(s,3,1);
          DssatGenFolder := Trim(s);
        end;
      end;
    except
      on E : EInOutError do
        spSkinMessage1.MessageDlg('File '+DSSATPROFILEPATH+' reading error' +
        '('+E.Message+')!', mtError, [mbOk], 0);
      else
        raise;
    end;
  finally
    CloseFile(f);
  end;
end;

end.
