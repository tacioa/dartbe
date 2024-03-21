import 'package:api_client/app/api/api.dart';
import 'package:test/test.dart';

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

  setUpAll(() {
    controller = ClientesController();
  });

  group('ClientesControllers', () {
    test('deve conter um route "/clientes"', () async {
      expect(controller.route, '/clientes');
    });

    test('deve conter uma key "GET" para o handler getClientesHandler',
        () async {
      expect(controller.handlers['GET'], isA<GetClientesHandler>());
    });

    test('deve conter uma key "GET" para o handler getClientesByIdHandler',
        () async {
      expect(controller.handlers['GET /{clienteId}'],
          isA<GetClientesByIdHandler>());
    });
  });
}
