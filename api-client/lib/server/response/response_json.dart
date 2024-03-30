part of '../server.dart';

class ResponseJSON extends Response {
  ResponseJSON.ok(dynamic body)
      : super.ok(body is List
            ? jsonEncode(body.map((item) => item.toMap()).toList())
            : jsonEncode(body));

  ResponseJSON.created(dynamic body)
      : super(201, body: jsonEncode(body.toMap()));

  ResponseJSON.badRequest(dynamic body)
      : super(400, body: jsonEncode(body.toMap()));
}
