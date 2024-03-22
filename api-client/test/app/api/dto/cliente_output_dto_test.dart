import 'package:api_client/app/api/api.dart';
import 'package:test/test.dart';

import '../../../mock.dart';

void main() {
  test('Deve retornar uma lista de ClienteOutputDTO', () async {
    final result = ClienteOutputDTO.toCollectionDTO(
        [clienteMock]);
    expect(result, isA<List<ClienteOutputDTO>>());
  });
}
