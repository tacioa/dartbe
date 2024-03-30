import 'package:api_client/config/config.dart';
import 'package:api_client/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then((server) => print('Server listenig on port${server.port}'))
      .catchError(print);
}
