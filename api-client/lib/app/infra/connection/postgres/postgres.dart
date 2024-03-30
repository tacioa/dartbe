part of infra;

class PostgreSQL implements DBConnection {
  late PostgreSQLConnection? _connection;

  @override
  Future<void> close() async {
    await _connection?.close();
  }

  @override
  Future<List<Map<String, dynamic>>> query(String sql,
      [Map<String, dynamic> params = const {}]) async {
    _connection = PostgreSQLConnection(
      'localhost',
      5432,
      'postgres',
      queryTimeoutInSeconds: 3600,
      timeoutInSeconds: 3600,
      username: 'postgres',
      password: 'docker',
    );

    await _connection!.open();

    List<Map<String, dynamic>> map = [];

    final rows = await _connection!.query(sql, substitutionValues: params);
    for (var row in rows) {
      map.add(row.toColumnMap());
    }
    return map;
  }
}
