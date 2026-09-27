unit UOrderDTO;

interface

uses
  UOrderItemDTO;

type
  TPedidoDTO = record
    Id: Integer;
    ClienteId: Integer;
    Itens: TArray<TOrderItemDTO>;
  end;

implementation

end.
