import 'package:api_client/app/data/data.dart';
import 'package:api_client/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

class FakeCliente extends Fake implements Cliente {}

void main() {
  late AddClienteService service;
  late MockAddClienteGateway mockAddClienteGateway;
  late MockGetClientePorEmail mockGetClientePorEmail;

  setUpAll(() {
    mockAddClienteGateway = MockAddClienteGateway();
    mockGetClientePorEmail = MockGetClientePorEmail();
    service = AddClienteService(
        addClienteGateway: mockAddClienteGateway,
        getClienteByEmailGateway: mockGetClientePorEmail);

    registerFallbackValue(FakeCliente());
  });

  group("AddClienteService", () {
    test('Deve adiciona um cliente', () async {
      when(() => mockGetClientePorEmail.call(any()))
          .thenAnswer((_) async => null);
      when(() => mockAddClienteGateway.call(any()))
          .thenAnswer((invocation) async => clienteMock);
      final result = await service.call(Cliente(
        id: 0,
        nome: 'nome',
        email: 'email',
        telefone: 'telefone',
      ));

      expect(result, isA<Cliente>());
    });

    test(
        'Deve lanca um JaExisteUmClienteComEsseEmailException quando tentar cadastrar um cliente com o mesmo email',
        () async {
      when(() => mockGetClientePorEmail.call(any()))
          .thenAnswer((_) async => clienteMock);

      expect(
          () => service.call(Cliente(
              id: 0, nome: 'nome', email: 'email', telefone: 'telefone')),
          throwsA(isA<JaExisteUmClienteComEsseEmailException>()));
    });
  });
}
