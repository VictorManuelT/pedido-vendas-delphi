unit UProductRepository;

interface

uses
  System.Generics.Collections,
  UProduct;

type
  TProductRepository = interface ['{D7B7D0B1-7F3B-4C4E-8B26-5E1D5B7D1002}']

    procedure Salvar(PProduto: TProduct);
    procedure Excluir(PId: Integer);
    function ObterPorId(PId: Integer): TProduct;
    function Listar: TObjectList<TProduct>;
  end;

implementation

end.
