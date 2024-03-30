part of infra;

class GetClientesDao implements GetClientesGateway {
  final DBConnection connection;

  GetClientesDao({required this.connection});

  @override
  Future<List<Cliente>> call() async {
    try {
      final rows = await connection.query('select * from clientes;');
      return rows.map(ClienteDB.toEntity).toList();
    } finally {
      await connection.close();
    }
  }
}
