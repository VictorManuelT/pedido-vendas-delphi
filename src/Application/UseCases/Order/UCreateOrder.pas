unit UCreateOrder;

interface

uses
  UOrderDTO,
  UCustomerRepository,
  UProductRepository,
  UOrderRepository;

type
  TCreateOrder = class
  private
    FClienteRepository: TCustomerRepository;
    FProdutoRepository: TProductRepository;
    FPedidoRepository: IPedidoRepository;
  public
    constructor Create(PClienteRepository: TCustomerRepository; PProdutoRepository: TProductRepository; PPedidoRepository: IPedidoRepository);

    procedure Execute(const PDTO: TPedidoDTO);
  end;

implementation

uses
  System.SysUtils,
  UCustomer,
  UProduct,
  UOrder,
  UDomainException,
  UOrderItemDTO;

constructor TCreateOrder.Create(PClienteRepository: TCustomerRepository;PProdutoRepository: TProductRepository; PPedidoRepository: IPedidoRepository);
begin
  FClienteRepository := PClienteRepository;
  FProdutoRepository := PProdutoRepository;
  FPedidoRepository := PPedidoRepository;
end;

procedure TCreateOrder.Execute(const PDTO: TPedidoDTO);
var
  Cliente: TCustomer;
  Produto: TProduct;
  Pedido: TOrder;
  ItemDTO: TOrderItemDTO;
begin
  Cliente := FClienteRepository.ObterPorId(PDTO.ClienteId);

  if not Assigned(Cliente) then
    raise EDomainException.Create( 'Cliente não encontrado.');

  if Length(PDTO.Itens) = 0 then
    raise EDomainException.Create( 'O pedido deve possuir pelo menos um item.');

  Pedido := TOrder.Create(Cliente);

  for ItemDTO in PDTO.Itens do
  begin
    Produto := FProdutoRepository.ObterPorId(ItemDTO.ProdutoId);

    if not Assigned(Produto) then
      raise EDomainException.CreateFmt('Produto %d não encontrado.', [ItemDTO.ProdutoId]);

    Pedido.AdicionarItem(Produto,ItemDTO.Quantidade, Produto.PrecoVenda);
  end;

  FPedidoRepository.Salvar(Pedido);
end;

end.
