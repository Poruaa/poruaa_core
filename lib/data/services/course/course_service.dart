import 'dart:typed_data';

import 'package:poruaa_core/data/services/course/model/course_extension_invoice_dto.dart';
import 'package:poruaa_core/data/services/course/model/course_model.dart';
import 'package:poruaa_core/data/services/course/model/course_payment_redirect_dto.dart';
import 'package:poruaa_core/data/services/course/model/course_publish_cost_info_dto.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class CoursesService {
  Future<Result<List<CourseModel>>> getCoursesOfTeacher(int teacherId);
  Future<Result<CourseModel>> getCourseOfTeacherById(
    int teacherId,
    int courseId,
  );
  Future<Result<List<CourseModel>>> getCoursesOfStudentByMeByTeacherId(
    int teacherId,
  );

  // Future<Result<List<CourseModel>>> getAllCoursesOfStudentByMe();
  Future<Result<PaginatedResponse<CourseModel>>>
  getCoursesOfStudentByMePaginated(PaginationParams params);
  Future<Result<CourseModel>> getCourseOfStudentByCourseId(int courseId);
  Future<Result<List<CourseModel>>> getAllEnrolledCoursesOfStudentByMe();

  Future<Result<CourseModel>> create(
    int teacherId,
    String name,
    String subTitle,
    num price,
    num regularPrice,
  );

  Future<Result<CourseModel>> update(
    int teacherId,
    int id,
    String name,
    String subTitle,
    num price,
    num regularPrice,
  );

  Future<Result<CourseModel>> uploadCourseThumbnail(
    int teacherId,
    int id,
    Uint8List thumbnailBytes,
  );

  Future<Result<CourseModel>> updateCourseExpirationDate(
    int teacherId,
    int id,
    DateTime expiresAt,
  );

  Future<Result<CourseModel>> publishCourse(int teacherId, int id);
  Future<Result<CourseModel>> unPublishCourse(int teacherId, int id);

  Future<Result<CoursePublishCostInfoDTO>> getPublishCostInfo(
    int teacherId,
    int courseId,
  );

  Future<Result<CourseExtensionInvoiceDTO>> getExtensionInvoice(
    int teacherId,
    int courseId,
    CourseExpirationInput input,
  );

  Future<Result<CoursePaymentRedirectDTO>> generatePaymentToken(int courseId);

  Future<Result<bool>> delete(int teacherId, int id);
}
