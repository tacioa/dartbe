part of api;

class GetClientesHandler implements Handler {
  final GetClientesUseCase getClientesUseCase;

  final _logger = Logger('GetClientesHandler');

  GetClientesHandler({required this.getClientesUseCase});

  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final clientes = await getClientesUseCase();
      return ResponseHandler<List<ClienteOutputDTO>>(
        status: StatusHandler.ok,
        body: ClienteOutputDTO.toCollectionDTO(clientes),
      );
    } catch (e) {
      _logger.severe('Houve uma falha', e);
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
