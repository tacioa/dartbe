part of infra;

class FakeDB implements Connection {
  @override
  Future<void> close() async {
    print("Close Connection");
  }

  @override
  Future<List<Map<String, dynamic>>> query(String sql) async {
    return [
      {
        'id': 1,
        'nome': 'nome',
        'email': 'email@email.com',
        'telefone': '1111-1111',
      },
    ];
  }
}
