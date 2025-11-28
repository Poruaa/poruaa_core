# Course Cost & Extension Invoice Guide

Quick reference for course publish cost info and extension invoice features.

## DTOs

### CoursePublishCostInfoDTO
```dart
class CoursePublishCostInfoDTO {
  final int courseId;
  final double perExamCost;
  final DateTime publishedAt;
  final DateTime expiresAt;
  final int examCount;
  final int courseDuration;
  final double courseCost;
  final double targetCoursePrice;
  final double currentCoursePrice;
  final bool isPriceValid;
  final bool canPublish;
  final String message;
}
```

### CourseExpirationInput
```dart
class CourseExpirationInput {
  final DateTime expiresAt;
}
```

### CourseExtensionInvoiceDTO
```dart
class CourseExtensionInvoiceDTO {
  final int courseId;
  final DateTime currentExpiresAt;
  final DateTime newExpiresAt;
  final int extraMonths;
  final int examCount;
  final int enrollmentCount;
  final double perExamCost;
  final double costPerStudent;
  final double totalCost;
  final double walletBalance;
  final double walletFreeCredit;
  final bool canExtend;
  final double afterExtendBalance;
  final double afterExtendFreeCredit;
  final String message;
}
```

## Repository Methods

### Get Publish Cost Info
```dart
Future<Result<CoursePublishCostInfoDTO>> getPublishCostInfo(int courseId);
```

**Endpoint:** `GET /teachers/{teacher_id}/courses/{course_id}/publish-cost-info`

### Get Extension Invoice
```dart
Future<Result<CourseExtensionInvoiceDTO>> getExtensionInvoice(
  int courseId,
  CourseExpirationInput input,
);
```

**Endpoint:** `POST /teachers/{teacher_id}/courses/{course_id}/extension-invoice`

## Usage

```dart
// Get publish cost info
final costResult = await courseRepository.getPublishCostInfo(courseId);
if (costResult case Ok(:final value)) {
  print('Can publish: ${value.canPublish}');
  print('Total cost: ${value.courseCost}');
  print('Message: ${value.message}');
}

// Get extension invoice
final input = CourseExpirationInput(
  expiresAt: DateTime.now().add(Duration(days: 90)),
);
final invoiceResult = await courseRepository.getExtensionInvoice(courseId, input);
if (invoiceResult case Ok(:final value)) {
  print('Can extend: ${value.canExtend}');
  print('Total cost: ${value.totalCost}');
  print('Extra months: ${value.extraMonths}');
}
```

## Import

```dart
import 'package:poruaa_core/poruaa_core.dart';
```

