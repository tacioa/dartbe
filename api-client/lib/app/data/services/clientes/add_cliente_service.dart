part of data;

class AddClienteService implements AddClienteUseCase {
  final AddClienteGateway addClienteGateway;
  final GetClienteByEmailGateway getClienteByEmailGateway;

  AddClienteService({
    required this.addClienteGateway,
    required this.getClienteByEmailGateway,
  });

  @override
  Future<Cliente> call(Cliente cliente) async {
    final clienteEncontrado =
        await getClienteByEmailGateway.call(cliente.email);
    if (clienteEncontrado != null) {
      throw JaExisteUmClienteComEsseEmailException();
    }
    return addClienteGateway(cliente);
    /*return Cliente(
      id: 1,
      nome: cliente.nome,
      email: cliente.email,
      telefone: cliente.telefone,
    );*/

    /*try {
      final clientes = await getClientesUseCase();
      return ResponseHandler<List<ClienteOutputDTO>>(
        status: StatusHandler.ok,
        body: ClienteOutputDTO.toCollectionDTO(clientes),
      );
    } catch (e) {
      _logger.severe('Houve uma falha', e);
      return ResponseHandler(status: StatusHandler.internalServerError);
    }*/
  }
}
