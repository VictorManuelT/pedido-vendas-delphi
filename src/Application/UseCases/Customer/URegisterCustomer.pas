unit URegisterCustomer;

interface

uses
  UCustomerDTO,
  UCustomerRepository;

type
  TCadastrarCliente = class
  private
    FRepository: TCustomerRepository;
  public
    constructor Create(PRepository: TCustomerRepository);

    procedure Execute(const PDTO: TCustomerDTO);
  end;

implementation

uses
  UCustomer;

constructor TCadastrarCliente.Create(PRepository: TCustomerRepository);
begin
  FRepository := PRepository;
end;

procedure TCadastrarCliente.Execute(const PDTO: TCustomerDTO);
var
  Cliente: TCustomer;
begin
  Cliente := TCustomer.Create(PDTO.Nome, PDTO.CpfCnpj,PDTO.Cidade);

  FRepository.Salvar(Cliente);
end;

end.
