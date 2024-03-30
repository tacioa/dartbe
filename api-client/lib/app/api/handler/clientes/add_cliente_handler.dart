part of api;

class AddClienteHandler extends Handler {
  final log = Logger("AddClienteHandler");

  final AddClienteUseCase addClienteUseCase;

  AddClienteHandler({required this.addClienteUseCase});

  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final cliente = ClienteInputDTO.toEntity(requestParams.body!);
      final clienteCriado = await addClienteUseCase(cliente);

      return ResponseHandler(
        status: StatusHandler.created,
        body: ClienteOutputDTO.toDTO(clienteCriado),
      );
    } on JaExisteUmClienteComEsseEmailException {
      return ResponseHandler(
          status: StatusHandler.badRequest,
          body: MessageError('Já Existe um cliente com esse email'));
    } catch (e) {
      log.severe('Ocorre um erro: $e');
      print(e.toString());
      return ResponseHandler(
          status: StatusHandler.internalServerError, body: e.toString());
    }
  }
}
