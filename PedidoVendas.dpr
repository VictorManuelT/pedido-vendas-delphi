program PedidoVendas;

uses
  Vcl.Forms,
  UPrincipal in 'src\Apresentacao\Forms\UPrincipal.pas' {FrmPrincipal},
  UProduct in 'src\Domain\Entities\UProduct.pas',
  UDomainException in 'src\Domain\Exceptions\UDomainException.pas',
  UCustomer in 'src\Domain\Entities\UCustomer.pas',
  UOrderItem in 'src\Domain\Entities\UOrderItem.pas',
  UOrder in 'src\Domain\Entities\UOrder.pas',
  UCustomerRepository in 'src\Domain\Repositories\UCustomerRepository.pas',
  UProductRepository in 'src\Domain\Repositories\UProductRepository.pas',
  UOrderRepository in 'src\Domain\Repositories\UOrderRepository.pas',
  UCustomerDTO in 'src\Application\DTOs\UCustomerDTO.pas',
  UProductDTO in 'src\Application\DTOs\UProductDTO.pas',
  UOrderItemDTO in 'src\Application\DTOs\UOrderItemDTO.pas',
  UOrderDTO in 'src\Application\DTOs\UOrderDTO.pas',
  URegisterCustomer in 'src\Application\UseCases\Customer\URegisterCustomer.pas',
  UListCustomer in 'src\Application\UseCases\Customer\UListCustomer.pas',
  URegisterProduct in 'src\Application\UseCases\Product\URegisterProduct.pas',
  UListproduct in 'src\Application\UseCases\Product\UListproduct.pas',
  UCreateOrder in 'src\Application\UseCases\Order\UCreateOrder.pas',
  UListOrder in 'src\Application\UseCases\Order\UListOrder.pas',
  UJsonDatabase in 'src\Infrastructure\Persistence\Json\UJsonDatabase.pas',
  UJsonCustomerRepository in 'src\Infrastructure\Persistence\Json\UJsonCustomerRepository.pas',
  UJsonProductRepository in 'src\Infrastructure\Persistence\Json\UJsonProductRepository.pas',
  UJsonOrderRepository in 'src\Infrastructure\Persistence\Json\UJsonOrderRepository.pas',
  UFrmCustomers in 'src\Apresentacao\Forms\UFrmCustomers.pas' {FrmCustomers},
  UFrmProducts in 'src\Apresentacao\Forms\UFrmProducts.pas' {FrmProducts},
  UFrmOrders in 'src\Apresentacao\Forms\UFrmOrders.pas' {FrmOrders},
  UFrmListOrders in 'src\Apresentacao\Forms\UFrmListOrders.pas' {FrmListOrders};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmListOrders, FrmListOrders);
  Application.Run;
end.
