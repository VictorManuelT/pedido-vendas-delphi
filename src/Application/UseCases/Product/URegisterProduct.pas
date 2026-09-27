unit URegisterProduct;

interface

uses
  UProductDTO,
  UProductRepository;

type
  TCadastrarProduto = class
  private
    FRepository: TProductRepository;
  public
    constructor Create(PRepository: TProductRepository);

    procedure Execute(const PDTO: TProductDTO);
  end;

implementation

uses
  UProduct;

constructor TCadastrarProduto.Create(PRepository: TProductRepository);
begin
  FRepository := PRepository;
end;

procedure TCadastrarProduto.Execute(const PDTO: TProductDTO);
var
  Produto: TProduct;
begin
  Produto := TProduct.Create(PDTO.Descricao, PDTO.PrecoVenda, PDTO.UnidadeMedida);
  try
    Produto.Id := PDTO.Id;

    FRepository.Salvar(Produto);
  finally
    Produto.Free;
  end;
end;

end.
