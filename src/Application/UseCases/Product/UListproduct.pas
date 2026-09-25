unit UListproduct;

interface

uses
  System.Generics.Collections,
  UProduct,
  UProductRepository;

type
  TListarProdutos = class
  private
    FRepository: TProductRepository;
  public
    constructor Create(PRepository: TProductRepository);

    function Execute: TObjectList<TProduct>;
  end;

implementation

constructor TListarProdutos.Create(PRepository: TProductRepository);
begin
  FRepository := PRepository;
end;

function TListarProdutos.Execute: TObjectList<TProduct>;
begin
  Result := FRepository.Listar;
end;

end.
