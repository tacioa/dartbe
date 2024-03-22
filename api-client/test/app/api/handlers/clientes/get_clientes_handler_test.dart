import 'package:api_client/app/api/api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late GetClientesHandler handler;
  late MockGetClientesUseCase mockGetClientesUseCase;

  setUpAll(() {
    mockGetClientesUseCase = MockGetClientesUseCase();
    handler = GetClientesHandler(getClientesUseCase: mockGetClientesUseCase);
  });

  group("GetClienteHandler", () {
    test('Deve retornar uma instancia de  ResponseHandler', () async {
      when(() => mockGetClientesUseCase.call()).thenAnswer((_) async => []);
      final result = await handler.call();

      expect(result, isA<ResponseHandler>());
    });

    test('Deve retornar um Status OK', () async {
      when(() => mockGetClientesUseCase.call()).thenAnswer((_) async => []);
      final result = await handler.call();

      expect(result.status, StatusHandler.ok);
    });

    test('Deve retornar uma lista de ClienteOutputDTO', () async {
      when(() => mockGetClientesUseCase.call()).thenAnswer((_) async => [
            clienteMock,
          ]);
      final result = await handler.call();

      expect(result.body, isA<List<ClienteOutputDTO>>());
    });

    test(
        'Deve retornar um status internalServerError quando um erro desconhecido acontecer',
        () async {
      when(() => mockGetClientesUseCase.call()).thenThrow(Exception());
      final result = await handler.call();

      expect(result.status, StatusHandler.internalServerError);
    });

    test(
        'Deve retornar um status internalServerError quando um erro desconhecido acontecer',
        () async {
      final result = ClienteOutputDTO.toCollectionDTO(
          [clienteMock]);
      expect(result, isA<List<ClienteOutputDTO>>());
    });
  });
}
