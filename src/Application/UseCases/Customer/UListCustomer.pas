unit UListCustomer;

interface

uses
  System.Generics.Collections,
  UCustomer,
  UCustomerRepository;

type
  TListarClientes = class
  private
    FRepository: TCustomerRepository;
  public
    constructor Create(PRepository: TCustomerRepository);

    function Execute: TObjectList<TCustomer>;
  end;

implementation

constructor TListarClientes.Create(PRepository: TCustomerRepository);
begin
  FRepository := PRepository;
end;

function TListarClientes.Execute: TObjectList<TCustomer>;
begin
  Result := FRepository.Listar;
end;

end.
