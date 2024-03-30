part of config;

final connection = PostgreSQL();

final controllers = <Controller>[
  ClientesController(
    getClientesUseCase: GetClientesServices(
      getClientesGateway: GetClientesDao(
        connection: connection,
      ),
    ),
    addClienteUserCase: AddClienteService(
        addClienteGateway: AddClienteDao(connection: connection),
        getClienteByEmailGateway:
            GetClientePorEmailDao(connection: connection)),
  ),
];
