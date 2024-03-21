import 'package:api_client/server/server.dart';

void main(){
  Server.bootstrap()
  .then((server) => print('Server listenig on port${server.port}'))
  .catchError(print);
}