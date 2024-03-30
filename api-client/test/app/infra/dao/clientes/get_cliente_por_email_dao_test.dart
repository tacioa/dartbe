import 'dart:async';

import 'package:api_client/app/domain/domain.dart';
import 'package:api_client/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late GetClientePorEmailDao dao;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    dao = GetClientePorEmailDao(connection: mockConnection);
  });

  setUp(() {
    when(
      () => mockConnection.close(),
    ).thenAnswer((_) async => Completer<void>().complete());
  });

  group('GetClientePorEmailDao', () {
    test('Deve retornar um cliente', () async {
      when(() => mockConnection.query(any(), any())).thenAnswer((_) async => [
            {
              'id': 1,
              'nome': 'nome',
              'email': 'email@email.com',
              'telefone': '9999-9999'
            }
          ]);
      final result = await dao.call("email@email.com");
      expect(result, isA<Cliente>());
    });
    test('Deve retornar null quando não encontrar um cliente', () async {
      when(() => mockConnection.query(any(), any()))
          .thenAnswer((_) async => []);
      final result = await dao.call("email@email.com");
      expect(result, null);
    });
  });
}
