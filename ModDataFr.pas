unit ModDataFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

  type
    TWeatherData = record
      Rad  : double;
      Tmax : double;
      Tmin : double;
      Rain : double;
    end;

    TYearData = record
      YearNO                  : integer;
      FileName                : string;
      FilePath                : string;
      FileFullName            : string;
      AreDaysContinuous       : boolean;
      ErrorCode               : integer;
      ArrWeather              : array of TWeatherData;
      ArrSize                 : integer;
      ArrStartIndex           : integer;
      ArrEndIndex             : integer;
      SD_Rad                  : double;
      SD_Tmax                 : double;
      SD_Tmin                 : double;
      SD_Rain                 : double;
      Mean_Rad                : double;
      Mean_Tmax               : double;
      Mean_Tmin               : double;
      Mean_Rain               : double;
    end;

    TYearsArray = array of TYearData;
    TRearrangedYearData = record
      YearNO1,
      YearNO2                 : integer;
      Day11,Day12,
      Day21,Day22             : integer;
      Len1,Len2               : integer;
      ErrorCode               : integer;
      ArrWeather              : array of TWeatherData;
      ArrNormalizedWeather    : array of TWeatherData;
      ArrSize                 : integer;
      ArrStartIndex           : integer;
      ArrEndIndex             : integer;
      SD_Rad                  : double;
      SD_Tmax                 : double;
      SD_Tmin                 : double;
      SD_Rain                 : double;
      Mean_Rad                : double;
      Mean_Tmax               : double;
      Mean_Tmin               : double;
      Mean_Rain               : double;
    end;

    TRearrangedYearDataArray = array of TRearrangedYearData;
    TReferenceYearData = TRearrangedYearData;

    TYearsForAlgorithms = record // for Neutral,Cold,Warm
      ArrYears                : array of integer;
      ArrSize,
      ArrStartIndex,
      ArrEndIndex             : integer;
    end;

    TAutomaticData  = record
      FileNameHistory         : string;
      FilePathHistory         : string;
      FileFullNameHistory     : string;
      FileNameRefrence        : string;
      FilePathRefrence        : string;
      FileFullNameRefrence    : string;
      FileNamePredict         : string;
      FilePathPredict         : string;
      FileFullNamePredict     : string;
    end;

    TAutomaticFile = record
      AutomaticFileType       : integer;
      ErrCode                 : integer;
      ArrAutomatic            : array of TAutomaticData;
      ArrSize,
      ArrStartIndex,
      ArrEndIndex             : integer;
     end;

    TD_Data = record
      Value      : double;
      Year       : integer;
    end;

    TData_type = record
      Value   :       double;
      Rad     :       double;
      Tmax    :       double;
      Tmin    :       double;
      Rain    :       double;
    end;

    TBulkData = record
      AutomaticFileType       : integer;
      AutomaticFileParameters : TAutomaticData;
      ArrYears                : TYearsArray;
      RefrenceYear            : TReferenceYearData;
      RearrangedRefrenceYear  : TRearrangedYearData;
      DataStartYear           : integer;
      DataEndYear             : integer;
      AreYearsContinuous      : boolean;
      ErrorCode               : integer;
      ArrRearrangedYears      : TRearrangedYearDataArray;
   // for calcultion of algorithm
      StartDay                : integer;
      EndDay                  : integer;
      D                       : array of TD_Data;
      arrData                 : array of array of TData_Type;
   // for storing final result
      ArrFinalResult          : array of TWeatherData;
      AlgorithmType           : integer;
      NeutralYears,
      ColdYears,
      WarmYears               : TYearsForAlgorithms;
      extension               : string;
    end;

    TProgramParameters = record
      AutoFileType            : integer;
      AutoIntegrateFileFullName,
      AutoSeperateFileFullName,
      NeutralFileFullName,
      ColdFileFullName,
      WarmFileFullName        : string;
      AlgorithmType           : integer;
      ErrorCode               : integer;
      GroupSize               : integer;
    end;

type
  TModData = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModData: TModData;

  RandomSkin    : boolean;
  SkinFileName  : string;
  WorkDir       : string;
  Editor        : string;
  Profile       : string;
  ProgramStarts : integer;
  EMailContact  : string;
  AppPath       : string;
  Company       : string;
  RegUser       : string;
  RegNo         : string;

  ColdYearsFile : string;
  NeutralYearsFile : string;
  WarmYearsFile : string;
  ProjectFolder : string;

  DssatWeatherFolder : string;
  DssatGenFolder : string;
  HistoricWthFolder : string;
  PredictedWtgFolder : string;

  ERR_DaysAreNotContinuous  : integer = -1;
  ERR_YearsAreNotContinuous : integer = -2;
  ERR_ReadFromFile          : integer = -3;
  ERR_WriteToFile           : integer = -4;
  ERR_CloseFile             : integer = -5;
  ERR_StringToIntConvert    : integer = -10;
  ERR_StringToDoubleConvert : integer = -11;
  ERR_Parameters            : integer = -50; // very general and should be revised

const
   DSSATPROFILEPATH                = 'c:\dssat47\dssatpro.v47';
   FILE_INTEGRATE                  = 1;
   FILE_SEPERATE                   = 2;

   ALG_NORMAL                      = 0;
   ALG_COLD                        = 1;
   ALG_NEUTRAL                     = 2;
   ALG_WARM                        = 3;
   ALG_GROUP                       = 4;

   WHITE_CHAR_SET                  = [#8,#9,#10,#11,#13,' '];
   NUMBER_CHAR_SET                 = ['0'..'9'];
   NUMERIC_SET                     = ['.','-','+','0'..'9'];

   CURRENT_YEAR                    = 2020;
   EPSILON                         = 10E-5;
   STR_HEADER                      = '@DATE  SRAD  TMAX  TMIN  RAIN';

implementation

{$R *.DFM}

end.
