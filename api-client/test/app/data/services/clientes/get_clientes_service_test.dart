import 'package:api_client/app/data/data.dart';
import 'package:api_client/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late MockGetClientesGateway mockGetClientesGateway;
  late GetClientesServices service;

  setUpAll(() {
    mockGetClientesGateway = MockGetClientesGateway();
    service = GetClientesServices(getClientesGateway: mockGetClientesGateway);
  });
  group("getClienteService", () {
    test('deve retornar uma lista de clientes', () async {
      when(() => mockGetClientesGateway.call())
          .thenAnswer((_) async => [clienteMock]);
      final result = await service.call();

      expect(result, isA<List<Cliente>>());
    });
  });
}
