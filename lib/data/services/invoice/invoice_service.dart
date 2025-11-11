import 'dart:convert';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/api/api_service_impl.dart';
import 'package:poruaa_core/data/services/invoice/model/invoice_model.dart';
import 'package:poruaa_core/utils/result.dart';

class InvoiceService {
  final AuthorizedApiService _apiService;

  InvoiceService(this._apiService);

  Future<Result<InvoiceModel>> generateCourseInvoice(int courseId) async {
    try {
      var body = {"item_type": "course", "item_id": courseId};
      var result = await _apiService.post(
        "students/me/invoice/course",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (result case Ok()) {
        var response = result.value;
        if (response.statusCode == 200) {
          var body = response.body;
          var jsonBody = jsonDecode(body);
          var invoice = InvoiceModel.fromJson(jsonBody);
          return Result.ok(invoice);
        } else {
          return Result.error("Failed to generate invoice");
        }
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<InvoiceModel>> generateShortExamInvoice(int shortExamId) async {
    try {
      var body = {"item_type": "short_exam", "item_id": shortExamId};
      var result = await _apiService.post(
        "students/me/invoice/short-exam",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (result case Ok()) {
        var response = result.value;
        if (response.statusCode == 200) {
          var body = response.body;
          var jsonBody = jsonDecode(body);
          var invoice = InvoiceModel.fromJson(jsonBody);
          return Result.ok(invoice);
        } else {
          return Result.error("Failed to generate invoice");
        }
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<String>> createCoursePayment(int courseId) async {
    try {
      var body = {"item_type": "course", "item_id": courseId};
      var result = await _apiService.post(
        "students/me/payment/course",
        headers: {
          "Content-Type": "application/json",
          "origin": ApiServiceImpl.hostname,
        },
        body: jsonEncode(body),
      );

      if (result case Ok()) {
        var response = result.value;
        if (response.statusCode == 200) {
          var body = response.body;
          var jsonBody = jsonDecode(body);
          if (jsonBody is! Map<String, dynamic>) {
            return Result.error("Parse error: Response is not a JSON object");
          }

          // Check if the response contains an error
          var status = jsonBody["status"];
          if (status != null && status != "SUCCESS") {
            var failedReason = jsonBody["failedreason"] ?? "Unknown error";
            return Result.error("Payment creation failed: $failedReason");
          }

          var gatewayPageUrl = jsonBody["GatewayPageURL"];
          if (gatewayPageUrl is! String) {
            return Result.error("Parse error: GatewayPageURL is not a string");
          }

          if (gatewayPageUrl.trim().isEmpty) {
            return Result.error("Parse error: GatewayPageURL is empty");
          }

          return Result.ok(gatewayPageUrl);
        } else {
          return Result.error(
            "Failed to create payment: ${response.statusCode}",
          );
        }
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<String>> createShortExamPayment(int shortExamId) async {
    try {
      var body = {"item_type": "short_exam", "item_id": shortExamId};
      var result = await _apiService.post(
        "students/me/payment/short-exam",
        headers: {
          "Content-Type": "application/json",
          "origin": ApiServiceImpl.hostname,
        },
        body: jsonEncode(body),
      );

      if (result case Ok()) {
        var response = result.value;
        if (response.statusCode == 200) {
          var body = response.body;
          var jsonBody = jsonDecode(body);
          if (jsonBody is! Map<String, dynamic>) {
            return Result.error("Parse error: Response is not a JSON object");
          }

          // Check if the response contains an error
          var status = jsonBody["status"];
          if (status != null && status != "SUCCESS") {
            var failedReason = jsonBody["failedreason"] ?? "Unknown error";
            return Result.error("Payment creation failed: $failedReason");
          }

          var gatewayPageUrl = jsonBody["GatewayPageURL"];
          if (gatewayPageUrl is! String) {
            return Result.error("Parse error: GatewayPageURL is not a string");
          }

          if (gatewayPageUrl.trim().isEmpty) {
            return Result.error("Parse error: GatewayPageURL is empty");
          }

          return Result.ok(gatewayPageUrl);
        } else {
          return Result.error(
            "Failed to create payment: ${response.statusCode}",
          );
        }
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
