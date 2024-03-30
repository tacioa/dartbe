part of infra;

abstract class DBConnection {
  Future<List<Map<String, dynamic>>> query(String sql,
      [Map<String, dynamic> params]);

  Future<void> close();
}
