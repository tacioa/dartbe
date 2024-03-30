part of infra;

class AddClienteDao implements AddClienteGateway {
  final DBConnection connection;

  AddClienteDao({required this.connection});

  @override
  Future<Cliente> call(Cliente cliente) async {
    try {
      var rows = await connection.query(
          'INSERT INTO clientes (nome,email,telefone) VALUES (@nome, @email,@telefone) returning *',
          {
            'nome': cliente.nome,
            'email': cliente.email,
            'telefone': cliente.telefone,
          });
      return rows.map(ClienteDB.toEntity).first;
    } finally {
      connection.close();
    }
  }
}
