import 'package:poruaa_core/data/services/invoice/invoice_service.dart';
import 'package:poruaa_core/data/services/invoice/model/invoice_model.dart';
import 'package:poruaa_core/utils/result.dart';

class InvoiceRepository {
  final InvoiceService _invoiceService;

  InvoiceRepository(this._invoiceService);

  Future<Result<InvoiceModel>> generateCourseInvoice(int courseId) async {
    return await _invoiceService.generateCourseInvoice(courseId);
  }

  Future<Result<InvoiceModel>> generateShortExamInvoice(int shortExamId) async {
    return await _invoiceService.generateShortExamInvoice(shortExamId);
  }

  Future<Result<String>> createCoursePayment(int courseId) async {
    return await _invoiceService.createCoursePayment(courseId);
  }

  Future<Result<String>> createShortExamPayment(int shortExamId) async {
    return await _invoiceService.createShortExamPayment(shortExamId);
  }
}
