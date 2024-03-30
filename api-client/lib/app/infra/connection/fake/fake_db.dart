part of infra;

class FakeDB implements DBConnection {
  @override
  Future<void> close() async {
    print("Close Connection");
  }

  @override
  Future<List<Map<String, dynamic>>> query(String sql,
      [Map<String, dynamic> params = const {}]) async {
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
