part of infra;

class GetClientesDao implements GetClientesGateway {
  final Connection connection;

  GetClientesDao({required this.connection});

  @override
  Future<List<Cliente>> call() async {
    try {
      final rows = await connection.query('SELECT * FROM clientes;');
      return rows
          .map(ClienteDB.toEntity)
          .toList();
    } finally {
      await connection.close();
    }
  }
}
