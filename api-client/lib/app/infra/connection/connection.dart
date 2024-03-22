part of infra;

abstract class Connection {
  Future<List<Map<String, dynamic>>> query(String sql) ;

  Future<void> close();

}