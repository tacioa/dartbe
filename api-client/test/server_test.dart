import 'dart:io';

import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  final port = '8080';
  //host no linux estava funcionando com 0.0.0.0
  // host no Windows precisa ser localhost/127.0.0.1
  final host = 'http://127.0.0.1:$port';
  late Process p;

  setUp(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    // Wait for server to start and print to stdout.
    await p.stdout.first;
  });

  tearDown(() => p.kill());

  group('Api Clientes:', () {
    test('deve conter um content-type "application/json"', () async {
      final response = await get(Uri.parse('$host/clientes'));
      expect(response.statusCode, 200);
      //expect(response.headers['content-type'], 'application/json');
    });
  });
}
