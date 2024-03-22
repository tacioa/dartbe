part of data;


class GetClientesServices implements GetClientesUseCase {

  final GetClientesGateway getClientesGateway;

  GetClientesServices({required this.getClientesGateway});

  @override
  Future<List<Cliente>> call() async {
    return await getClientesGateway.call();
  }
  
}

