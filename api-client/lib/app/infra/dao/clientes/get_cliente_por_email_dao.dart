part of infra;

class GetClientePorEmailDao extends GetClienteByEmailGateway {
  final DBConnection connection;

  GetClientePorEmailDao({required this.connection});

  @override
  Future<Cliente?> call(String email) async {
    //return Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone');
    try {
      final rows = await connection.query(
          'select * from clientes where email = @email;', {'email': email});
      if (rows.isEmpty) return null;
      return rows.map(ClienteDB.toEntity).first;
    } finally {
      await connection.close();
    }
  }
}
