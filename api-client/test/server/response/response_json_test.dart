import 'dart:convert';

import 'package:api_client/app/api/api.dart';
import 'package:api_client/app/domain/domain.dart';
import 'package:api_client/app/infra/infra.dart';
import 'package:api_client/server/server.dart';
import 'package:test/test.dart';

void main() {
  group("ResponseJson", () {
    test('ok:: Deve retorna uma status 200 com a mensagem', () async {
      String msg = "Mensagem de Teste";
      var responseJSON = ResponseJSON.ok(msg);
      expect(responseJSON.statusCode, equals(200));
      String objValue = await responseJSON.readAsString();
      expect(objValue, contains(msg));
    });

    test('ok:: Deve retorna uma status 200 com um cliente', () async {
      var responseJSON = ResponseJSON.ok({
        'id': 1,
        'nome': 'nome',
        'telefone': 'telefone',
        'email': 'email@email.com',
      });
      expect(responseJSON.statusCode, equals(200));
      var objValue = jsonDecode(await responseJSON.readAsString());
      expect(objValue, isA<Map<String, dynamic>>());
      expect(objValue['id'], equals(1));
      expect(objValue['nome'], equals('nome'));
      expect(objValue['telefone'], equals('telefone'));
      expect(objValue['email'], equals('email@email.com'));
      Cliente cliente = ClienteDB.toEntity(objValue);
      expect(cliente, isA<Cliente>());
    });

    test('ok:: Deve retorna uma status 200 com uma lista de clientes',
        () async {
      var responseJSON = ResponseJSON.ok([
        ClienteOutputDTO(
            id: 1, nome: 'nome', email: 'email', telefone: 'telefone'),
        ClienteOutputDTO(
            id: 2, nome: 'nome 2', email: 'email', telefone: 'telefone')
      ]);
      expect(responseJSON.statusCode, equals(200));
      var objValue = jsonDecode(await responseJSON.readAsString());

      expect(objValue, isA<List<dynamic>>());
      var val1 = objValue[0];
      expect(val1, isA<Map<String, dynamic>>());
    });

    test('created:: Deve retorna uma status 201 com um cliente', () async {
      var responseJSON = ResponseJSON.ok({
        'id': 1,
        'nome': 'nome',
        'telefone': 'telefone',
        'email': 'email@email.com',
      });
      expect(responseJSON.statusCode, equals(200));
      var objValue = jsonDecode(await responseJSON.readAsString());
      expect(objValue, isA<Map<String, dynamic>>());
      expect(objValue['id'], equals(1));
      expect(objValue['nome'], equals('nome'));
      expect(objValue['telefone'], equals('telefone'));
      expect(objValue['email'], equals('email@email.com'));
      Cliente cliente = ClienteDB.toEntity(objValue);
      expect(cliente, isA<Cliente>());
    });
  });
}
