import 'package:api_client/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late AddClienteHandler handler;
  late MockAddClienteUseCase mockAddClienteUseCase;

  setUpAll(() {
    mockAddClienteUseCase = MockAddClienteUseCase();
    handler = AddClienteHandler(addClienteUseCase: mockAddClienteUseCase);
  });

  group('AddClienteHandler', () {
    test('Deve retornar um status created', () async {
      final result = await handler.call(RequestParams(body: {
        'nome': 'Nome Teste',
        'email': 'email@email.com',
        'telefone': '1234-1234',
      }));

      expect(result.status, StatusHandler.created);
    });

    test('Deve retornar um ClienteOutputDTO', () async {
      final result = await handler.call(RequestParams(body: {
        'nome': 'Nome Teste',
        'email': 'email@email.com',
        'telefone': '1234-1234',
      }));

      expect(result.body, isA<ClienteOutputDTO>());
    });
  });
}
