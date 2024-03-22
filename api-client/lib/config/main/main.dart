part of config;

final controllers = <Controller>[
  ClientesController(
    getClientesUseCase: GetClientesServices(
      getClientesGateway: GetClientesDao(
        connection: FakeDB(),
      ),
    ),
  ),
];
