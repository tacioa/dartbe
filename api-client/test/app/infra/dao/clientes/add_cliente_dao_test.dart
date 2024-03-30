import 'dart:async';

import 'package:api_client/app/domain/domain.dart';
import 'package:api_client/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late AddClienteDao dao;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    dao = AddClienteDao(connection: mockConnection);
  });

  group('AddClienteDao', () {
    test('Deve adicionar um cliente', () async {
      when(() => mockConnection.close())
          .thenAnswer((_) async => Completer().complete());
      when(() => mockConnection.query(any(), any())).thenAnswer((_) async => [
            {
              'id': 0,
              'nome': 'Nome teste ',
              'email': 'email@email.com',
              'telefone': '1234-5678'
            }
          ]);
      var result = await dao.call(Cliente(
          id: 0,
          nome: 'Nome teste ',
          email: 'email@email.com',
          telefone: '1234-5678'));

      expect(result, isA<Cliente>());
    });
  });
}
