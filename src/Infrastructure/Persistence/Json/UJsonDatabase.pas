unit UJsonDatabase;

interface

uses
  System.JSON;

type
  TJsonDatabase = class
  private
    FBasePath: string;

    function GetFilePath(const PFileName: string): string;
  public
    constructor Create(const PBasePath: string);

    function CarregarArray(const PFileName: string): TJSONArray;

    procedure SalvarArray(const PFileName: string;AJsonArray: TJSONArray);
  end;

implementation

uses
  System.SysUtils,
  System.IOUtils,
  System.Classes;

constructor TJsonDatabase.Create(const PBasePath: string);
begin
  FBasePath := PBasePath;

  if not TDirectory.Exists(FBasePath) then
    TDirectory.CreateDirectory(FBasePath);
end;

function TJsonDatabase.GetFilePath(const PFileName: string): string;
begin
  Result := TPath.Combine(FBasePath, PFileName);
end;

function TJsonDatabase.CarregarArray(const PFileName: string): TJSONArray;
var
  FilePath: string;
  Content: string;
  JsonValue: TJSONValue;
begin
  FilePath := GetFilePath(PFileName);

  if not TFile.Exists(FilePath) then
    Exit(TJSONArray.Create);

  Content := TFile.ReadAllText(FilePath, TEncoding.UTF8);

  if Content.Trim.IsEmpty then
    Exit(TJSONArray.Create);

  JsonValue := TJSONObject.ParseJSONValue(Content);

  if not Assigned(JsonValue) then
    Exit(TJSONArray.Create);

  if not (JsonValue is TJSONArray) then
  begin
    JsonValue.Free;
    raise Exception.Create('O arquivo JSON deve conter um array.');
  end;

  Result := TJSONArray(JsonValue);
end;

procedure TJsonDatabase.SalvarArray( const PFileName: string; AJsonArray: TJSONArray);
var
  FilePath: string;
begin
  FilePath := GetFilePath(PFileName);

  TFile.WriteAllText(FilePath, AJsonArray.Format(2), TEncoding.UTF8);
end;

end.
