unit UProduct;

interface

type
  TProduct = class
  private
    FId: Integer;
    FDescricao: string;
    FPrecoVenda: Currency;
    FUnidadeMedida: string;

    procedure Validar;
  public
    constructor Create(const PDescricao: string; PPrecoVenda: Currency; const PUnidadeMedida: string);

    property Id: Integer read FId write FId;
    property Descricao: string read FDescricao;
    property PrecoVenda: Currency read FPrecoVenda;
    property UnidadeMedida: string read FUnidadeMedida;
  end;

implementation

uses
  System.SysUtils,
  UDomainException;

{ TProduct }

constructor TProduct.Create(const PDescricao: string; PPrecoVenda: Currency; const PUnidadeMedida: string);
begin
  FDescricao := Trim(PDescricao);
  FPrecoVenda := PPrecoVenda;
  FUnidadeMedida := Trim(PUnidadeMedida);

  Validar;
end;

procedure TProduct.Validar;
begin
  if FDescricao.IsEmpty then
    raise EDomainException.Create('A descrição do produto não foi preenchido.');

  if FPrecoVenda < 0 then
    raise EDomainException.Create('O preço de venda não pode ser negativo.');

  if FUnidadeMedida.IsEmpty then
    raise EDomainException.Create('A unidade de medida não foi preenchido.');
end;

end.
