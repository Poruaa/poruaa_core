import 'dart:convert';

import 'package:poruaa_core/data/services/api/api_service_impl.dart';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/utils/result.dart';

class PaymentService {
  PaymentService(this._apiService);
  final AuthorizedApiService _apiService;

  Future<Result<String>> makeKPayment(double amount) async {
    try {
      var result = await _apiService.post(
        "payment",
        headers: {
          "Content-Type": "application/json",
          "origin": ApiServiceImpl.hostname,
        },
        body: jsonEncode({"amount": amount}),
      );
      if (result case Ok()) {
      } else {
        return Result.error("Network error");
      }

      var response = result.value;

      var statusCode = response.statusCode;
      if (statusCode != 200) {
        return Result.error(response.body);
      }
      var jsonBody = response.body;
      var body = jsonDecode(jsonBody);
      if (body is! Map<String, dynamic>) {
        return Result.error("Parse error");
      }

      var gatewayPageUrl = body["GatewayPageURL"];
      if (gatewayPageUrl is! String) {
        return Result.error("Parse error");
      }

      if (gatewayPageUrl.trim().isEmpty) {
        return Result.error("Parse error");
      }

      return Result.ok(gatewayPageUrl);
    } catch (e) {
      return Result.error("Something went wrong");
    }
  }
}
