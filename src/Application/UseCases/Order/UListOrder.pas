unit UListOrder;

interface

uses
  System.Generics.Collections,
  UOrder,
  UOrderRepository;

type
  TListarPedidos = class
  private
    FRepository: IPedidoRepository;
  public
    constructor Create(PRepository: IPedidoRepository);

    function Execute: TObjectList<TOrder>;
  end;

implementation

constructor TListarPedidos.Create(PRepository: IPedidoRepository);
begin
  FRepository := PRepository;
end;

function TListarPedidos.Execute: TObjectList<TOrder>;
begin
  Result := FRepository.Listar;
end;

end.
