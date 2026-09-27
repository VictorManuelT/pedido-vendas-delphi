unit UCustomer;

interface

type
  TCustomer = class
  private
    FId: Integer;
    FNome: string;
    FCpfCnpj: string;
    FCidade: string;

    procedure Validar;
  public
    constructor Create(const PNome: string;const PCpfCnpj: string; const PCidade: string);

    property Id: Integer read FId write FId;
    property Nome: string read FNome;
    property CpfCnpj: string read FCpfCnpj;
    property Cidade: string read FCidade;
  end;

implementation

uses
  System.SysUtils,
  UDomainException;

{ TCustomer }

constructor TCustomer.Create( const PNome: string; const PCpfCnpj: string; const PCidade: string);
begin
  FNome := Trim(PNome);
  FCpfCnpj := Trim(PCpfCnpj);
  FCidade := Trim(PCidade);

  Validar;
end;

procedure TCustomer.Validar;
begin
  if FNome.IsEmpty then
    raise EDomainException.Create('O nome do cliente não foi preenchido.');

  if FCpfCnpj.IsEmpty then
    raise EDomainException.Create('O CPF/CNPJ do cliente não foi preenchido.');

  if FCidade.IsEmpty then
    raise EDomainException.Create('A cidade do cliente não foi preenchido.');
end;

end.
