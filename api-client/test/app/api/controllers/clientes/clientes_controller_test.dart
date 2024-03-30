import 'package:api_client/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

/// Controllers
///
/// route: /clientes => clientesController
/// metodos: GET, POST ..
/// Handlers: ações
///
/// key: valor
/// GET:  Lista de clientes
/// GET /{clienteId}: pesquisa pelo id do cliente
/// PUT /{clienteId}: Atualizando o cliente

void main() {
  late ClientesController controller;
  late MockGetClientesUseCase mockGetClientesUseCase;
  late MockAddClienteUseCase mockAddClienteUseCase;

  setUpAll(() {
    mockGetClientesUseCase = MockGetClientesUseCase();
    mockAddClienteUseCase = MockAddClienteUseCase();
    controller = ClientesController(
      getClientesUseCase: mockGetClientesUseCase,
      addClienteUserCase: mockAddClienteUseCase,
    );
  });

  group('ClientesControllers', () {
    test('deve conter um route "/clientes"', () async {
      expect(controller.route, '/clientes');
    });

    test('deve conter uma key "GET" para o handler getClientesHandler',
        () async {
      expect(controller.handlers['GET'], isA<GetClientesHandler>());
    });

    test('deve conter uma key "POST" para o handler AddClienteHandler',
        () async {
      expect(controller.handlers['POST'], isA<AddClienteHandler>());
    });
  });
}
