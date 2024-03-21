import 'package:api_client/app/api/api.dart';
import 'package:api_client/app/domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test('Deve retornar uma lista de ClienteOutputDTO', () async {
    final result = ClienteOutputDTO.toCollectionDTO(
        [Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone')]);
    expect(result, isA<List<ClienteOutputDTO>>());
  });
}
