import 'dart:typed_data';

import 'package:http/http.dart' as http;

class Response {
  const Response(this.statusCode, this.body, this.bodyBytes);
  factory Response.fromHttpResponse(http.Response response) {
    return Response(response.statusCode, response.body, response.bodyBytes);
  }
  final String body;
  final int statusCode;
  final Uint8List bodyBytes;
}
