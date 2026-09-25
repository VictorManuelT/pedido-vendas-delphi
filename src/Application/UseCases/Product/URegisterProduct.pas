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
  UProduct: TProduct;
begin
  UProduct := TProduct.Create(PDTO.Descricao, PDTO.PrecoVenda, PDTO.UnidadeMedida);
  FRepository.Salvar(UProduct);
end;

end.
