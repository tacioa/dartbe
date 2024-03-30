import 'dart:convert';
import 'dart:io';

import 'package:api_client/app/api/api.dart';
import 'package:api_client/server/server.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/src/router.dart';

class ShelfAdapter {
  final List<Controller> controllers;

  ShelfAdapter({required this.controllers});

  void handler(Router router) {
    for (final controller in controllers) {
      _handler(controller, router);
    }
  }

  void _handler(Controller controller, Router router) {
    final route = controller.route;
    final handlers = controller.handlers;

    for (final myHandler in handlers.entries) {
      final verb = myHandler.key;
      router.add(verb, route, (Request request) async {
        print(SystemEncoding().toString());
        final String payloadSysEnconde =
            await request.readAsString(SystemEncoding());
        final String payload = utf8.decode(payloadSysEnconde.codeUnits);

        final responseHandler = await myHandler.value(RequestParams(
          body: payload.isNotEmpty ? jsonDecode(payload) : null,
        ));

        switch (responseHandler.status) {
          case StatusHandler.ok:
            return ResponseJSON.ok(responseHandler.body);
          case StatusHandler.created:
            return ResponseJSON.created(responseHandler.body);
          case StatusHandler.badRequest:
            return ResponseJSON.badRequest(responseHandler.body);
          default:
            return Response.internalServerError();
        }
      });
    }
  }
}
