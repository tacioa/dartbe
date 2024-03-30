part of api;

class ClientesController implements Controller {
  final GetClientesUseCase getClientesUseCase;
  final AddClienteUseCase addClienteUserCase;

  ClientesController({
    required this.getClientesUseCase,
    required this.addClienteUserCase,
  });

  @override
  String get route => '/clientes';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientesHandler(getClientesUseCase: getClientesUseCase),
        'POST': AddClienteHandler(addClienteUseCase: addClienteUserCase),
      };
}
