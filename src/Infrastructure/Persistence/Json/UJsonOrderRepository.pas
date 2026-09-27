unit UJsonOrderRepository;

interface

uses
  System.Generics.Collections,
  UOrder,
  UCustomer,
  UProduct,
  UOrderRepository,
  UJsonDatabase,
  UCustomerRepository,
  UProductRepository;

type
  TJsonOrderRepository = class(TInterfacedObject, IPedidoRepository)
  private
    FDatabase: TJsonDatabase;
    FClienteRepository: TCustomerRepository;
    FProdutoRepository: TProductRepository;

    function ProximoId: Integer;
  public
    constructor Create(PDatabase: TJsonDatabase; PClienteRepository: TCustomerRepository; PProdutoRepository: TProductRepository);

    procedure Salvar(PPedido: TOrder);
    procedure Excluir(PId: Integer);
    function ObterPorId(PId: Integer): TOrder;
    function Listar: TObjectList<TOrder>;
  end;

implementation

uses
  System.JSON,
  UOrderItem;

constructor TJsonOrderRepository.Create(PDatabase: TJsonDatabase; PClienteRepository: TCustomerRepository; PProdutoRepository: TProductRepository);
begin
  FDatabase := PDatabase;
  FClienteRepository := PClienteRepository;
  FProdutoRepository := PProdutoRepository;
end;

function TJsonOrderRepository.ProximoId: Integer;
var
  Lista: TObjectList<TOrder>;
  UOrder: TOrder;
  MaiorId: Integer;
begin
  MaiorId := 0;
  Lista := Listar;

  try
    for UOrder in Lista do
      if UOrder.Id > MaiorId then
        MaiorId := UOrder.Id;

    Result := MaiorId + 1;
  finally
    Lista.Free;
  end;
end;

procedure TJsonOrderRepository.Salvar(PPedido: TOrder);
var
  JsonArray: TJSONArray;
  JsonPedido: TJSONObject;
  JsonItens: TJSONArray;
  JsonItem: TJSONObject;
  Item: TOrderItem;
  I: Integer;
  PedidoExistente: Boolean;
begin
  JsonArray := FDatabase.CarregarArray('pedidos.json');

  try
    PedidoExistente := False;
    if PPedido.Id = 0 then
      PPedido.Id := ProximoId;

    for I := 0 to JsonArray.Count - 1 do
    begin
      JsonPedido := JsonArray.Items[I] as TJSONObject;

      if JsonPedido.GetValue<Integer>('id') = PPedido.Id then
      begin
        PedidoExistente := True;
        Break;
      end;
    end;

    if not PedidoExistente then
    begin
      JsonPedido := TJSONObject.Create;
      JsonArray.AddElement(JsonPedido);
    end;

    JsonPedido.RemovePair('id');
    JsonPedido.AddPair('id', TJSONNumber.Create(PPedido.Id));

    JsonPedido.RemovePair('clienteId');
    JsonPedido.AddPair('clienteId',TJSONNumber.Create(PPedido.Cliente.Id));
    JsonPedido.RemovePair('itens');
    JsonItens := TJSONArray.Create;

    for Item in PPedido.Itens do
    begin
      JsonItem := TJSONObject.Create;
      JsonItem.AddPair('produtoId',TJSONNumber.Create(Item.Produto.Id));
      JsonItem.AddPair('quantidade',TJSONNumber.Create(Item.Quantidade));
      JsonItem.AddPair('valorUnitario',TJSONNumber.Create(Item.ValorUnitario));
      JsonItens.AddElement(JsonItem);
    end;

    JsonPedido.AddPair('itens', JsonItens);

    FDatabase.SalvarArray('pedidos.json', JsonArray);

  finally
    JsonArray.Free;
  end;
end;

procedure TJsonOrderRepository.Excluir(PId: Integer);
var
  JsonArray: TJSONArray;
  JsonPedido: TJSONObject;
  I: Integer;
begin
  JsonArray := FDatabase.CarregarArray('pedidos.json');
  try
    for I := JsonArray.Count - 1 downto 0 do
    begin
      JsonPedido := JsonArray.Items[I] as TJSONObject;

      if JsonPedido.GetValue<Integer>('id') = PId then
      begin
        JsonArray.Remove(I);
        FDatabase.SalvarArray('pedidos.json', JsonArray);
        Exit;
      end;
    end;
  finally
    JsonArray.Free;
  end;
end;

function TJsonOrderRepository.ObterPorId(PId: Integer): TOrder;
var
  Lista: TObjectList<TOrder>;
  UOrder: TOrder;
begin
  Result := nil;

  Lista := Listar;

  try
    for UOrder in Lista do
    begin
      if UOrder.Id = PId then
      begin
        Result := UOrder;
        Lista.Extract(UOrder);
        Break;
      end;
    end;
  finally
    Lista.Free;
  end;
end;

function TJsonOrderRepository.Listar: TObjectList<TOrder>;
var
  JsonArray: TJSONArray;
  JsonPedido: TJSONObject;
  JsonItens: TJSONArray;
  JsonItem: TJSONObject;
  UOrder: TOrder;
  UCustomer: TCustomer;
  UProduct: TProduct;
  Item: TOrderItem;
  I: Integer;
  J: Integer;
begin
  Result := TObjectList<TOrder>.Create(True);

  JsonArray := FDatabase.CarregarArray('pedidos.json');

  try
  for I := 0 to JsonArray.Count - 1 do
    begin
      JsonPedido := JsonArray.Items[I] as TJSONObject;

      UCustomer := FClienteRepository.ObterPorId(JsonPedido.GetValue<Integer>('clienteId'));

      if not Assigned(UCustomer) then
        Continue;

      UOrder := TOrder.Create(UCustomer);

      UOrder.Id := JsonPedido.GetValue<Integer>('id');

      JsonItens :=
        JsonPedido.GetValue<TJSONArray>('itens');

      for J := 0 to JsonItens.Count - 1 do
      begin
        JsonItem := JsonItens.Items[J] as TJSONObject;

        UProduct := FProdutoRepository.ObterPorId(JsonItem.GetValue<Integer>('produtoId'));

        if not Assigned(UProduct) then
          Continue;

        UOrder.AdicionarItem(UProduct, JsonItem.GetValue<Currency>('quantidade'), JsonItem.GetValue<Currency>('valorUnitario'));
      end;

      Result.Add(UOrder);
    end;
  finally
    JsonArray.Free;
  end;
end;

end.
