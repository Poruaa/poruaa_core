import 'dart:typed_data';
import 'package:drift/drift.dart';
import 'package:poruaa_core/data/repositories/course/course_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/course/course_service.dart';
import 'package:poruaa_core/data/services/course/model/course_extension_invoice_dto.dart';
import 'package:poruaa_core/data/services/course/model/course_payment_redirect_dto.dart';
import 'package:poruaa_core/data/services/course/model/course_publish_cost_info_dto.dart';
import 'package:poruaa_core/data/services/course/model/send_course_notification_input_dto.dart';
import 'package:poruaa_core/data/services/course/model/send_course_notification_response_dto.dart';
import 'package:poruaa_core/data/dao/course/course_dao.dart';
import 'package:poruaa_core/domain/models/course/course.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';

class CourseRepositoryImpl extends CourseRepository {
  final CoursesService _coursesService;
  final UserRepository _userRepository;
  final CourseDao _courseDao;
  CourseRepositoryImpl(
    CoursesService coursesService,
    UserRepository userRepository,
    CourseDao courseDao,
  ) : _coursesService = coursesService,
      _userRepository = userRepository,
      _courseDao = courseDao;

  @override
  Stream<Result<List<Course>>> watchAllCourses() async* {
    yield* _courseDao.watchAllCourses().map(((event) {
      return Result.ok(event);
    }));
  }

  @override
  Stream<Result<Course>> watchCourse(int courseId) async* {
    try {
      await getCourse(courseId);
    } catch (e) {
      yield Err("Error");
    }
    yield* _courseDao.watchCourseById(courseId).map(((event) {
      if (event == null) {
        return Err("error");
      }
      return Ok(event);
    }));
  }

  @override
  Stream<Result<List<Course>>> watchAll() async* {
    yield* _courseDao.watchAllCourses().map(((event) {
      return Result.ok(event);
    }));
  }

  @override
  Stream<Result<List<Course>>> watchAllOfTeacher(int teacherId) async* {
    yield* _courseDao.watchAllCoursesOfTeacher(teacherId).map(((event) {
      return Result.ok(event);
    }));
  }

  // List<Course> get courses {
  //   var value = _courseSubject.value;
  //   if (value == null) {
  //     return [];
  //   }
  //   switch (value) {
  //     case Ok():
  //       return value.value;
  //     case Error():
  //       return [];
  //   }
  // }

  Future<void> _addCourseToSubject(Course course) async {
    await _courseDao.insertCourse(
      // db.CourseItemsCompanion(
      //   id: Value(course.id),
      //   name: Value(course.name),
      //   subTitle: Value(course.subTitle),
      //   thumbnail: Value(course.thumbnail),
      //   price: Value(course.price.toDouble()),
      //   regularPrice: Value(course.regularPrice.toDouble()),
      //   teacherId: Value(course.teacherId),
      // ),
      course.toCourseItemCompanion(),
    );
  }

  Future<void> _setCourseToSubject(Course course) async {
    await _courseDao.updateCourse(course.toCourseItemCompanion());
  }

  Future<void> _deleteCourseOfSubject(int id) async {
    await _courseDao.deleteCourse(id);
  }

  @override
  Future<Result<Course>> create(Course course) async {
    var result = await _coursesService.create(
      _userRepository.getCurrentUserId,
      course.name,
      course.subTitle,
      course.price,
      course.regularPrice,
    );
    switch (result) {
      case Ok():
        var course = Course.fromModel(result.value);
        _addCourseToSubject(course);
        return Result.ok(course);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<bool>> delete(int id) async {
    var result = await _coursesService.delete(
      _userRepository.getCurrentUserId,
      id,
    );
    switch (result) {
      case Ok():
        _deleteCourseOfSubject(id);
        return Ok(true);
      case Err():
        return result;
    }
  }

  @override
  Future<Result<List<Course>>> getCoursesOfTeacher(int teacherId) async {
    var result = await _coursesService.getCoursesOfTeacher(teacherId);
    switch (result) {
      case Ok():
        var value = result.value;
        var courses = value.map((e) => Course.fromModel(e)).toList();
        await _courseDao.replaceAllCourses(
          courses.map((e) => e.toCourseItemCompanion()),
          teacherId,
        );
        return Result.ok(courses);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<List<Course>>> getCoursesOfStudentByMeByTeacherId(
    int teacherId,
  ) async {
    var result = await _coursesService.getCoursesOfStudentByMeByTeacherId(
      teacherId,
    );
    switch (result) {
      case Ok():
        var value = result.value;
        var courses = value.map((e) => Course.fromModel(e)).toList();
        await _courseDao.insertAllCourses(
          courses.map((e) => e.toCourseItemCompanion()),
        );
        return Result.ok(courses);
      case Err():
        return Result.error("error");
    }
  }

  // @override
  // Future<Result<List<Course>>> getAllCourses() async {
  //   var result = await _coursesService.getAllCourses();
  //   switch (result) {
  //     case Ok():
  //       var value = result.value;
  //       await _courseDao.insertAllCourses(
  //         value.map(
  //           (e) => db.CourseItem(
  //             id: e.id,
  //             name: e.name,
  //             subTitle: e.subTitle,
  //             thumbnail: e.thumbnail,
  //             price: e.price.toDouble(),
  //             regularPrice: e.regularPrice.toDouble(),
  //             teacherId: e.teacherId,
  //             isEnrolled: e.isEnrolled ?? false,
  //           ),
  //         ),
  //       );
  //       var courses = value.map((e) => Course.fromModel(e)).toList();
  //       return Result.ok(courses);
  //     case Error():
  //       return Result.error("error");
  //   }
  // }

  // @override
  // Future<Result<List<Course>>> getAllCoursesOfStudentByMe() async {
  //   var result = await _coursesService.getAllCoursesOfStudentByMe();
  //   switch (result) {
  //     case Ok():
  //       var value = result.value;
  //       var courses = value.map((e) => Course.fromModel(e)).toList();
  //       await _courseDao.insertAllCourses(
  //         courses.map(
  //           (e) {
  //             return e.toCourseItemCompanion();
  //           },
  //         ),
  //       );
  //       return Result.ok(courses);
  //     case Err():
  //       return Result.error("error");
  //   }
  // }

  @override
  Future<Result<PaginatedResponse<Course>>> getCoursesOfStudentByMePaginated(
    PaginationParams params,
  ) async {
    var result = await _coursesService.getCoursesOfStudentByMePaginated(params);
    switch (result) {
      case Ok():
        var paginatedResponse = result.value;
        var courses = paginatedResponse.items
            .map((e) => Course.fromModel(e))
            .toList();

        // Store courses in local database for offline access
        await _courseDao.insertAllCourses(
          courses.map((e) => e.toCourseItemCompanion()),
        );

        // Update pagination state with the last loaded course ID
        if (courses.isNotEmpty) {
          final lastCourse = courses.last;
          setLastLoadedCourseId(lastCourse.id.toString());
        }

        var paginatedCourseResponse = PaginatedResponse<Course>(
          items: courses,
          nextCursor: paginatedResponse.nextCursor,
          hasMore: paginatedResponse.hasMore,
          total: paginatedResponse.total,
        );

        return Result.ok(paginatedCourseResponse);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<List<Course>> getAllCoursesFromCache() async {
    // Get cached courses from local database without making an API call
    final courseItems = await _courseDao.getAllCourses();
    return courseItems.map((item) => Course.fromItem(item)).toList();
  }

  @override
  Future<Result<List<Course>>> getAllEnrolledCoursesOfStudentByMe() async {
    var result = await _coursesService.getAllEnrolledCoursesOfStudentByMe();
    switch (result) {
      case Ok():
        var value = result.value;
        var courses = value.map((e) => Course.fromModel(e)).toList();
        await _courseDao.insertAllCourses(
          courses.map((e) {
            return e.toCourseItemCompanion();
          }),
        );
        return Result.ok(courses);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<Course>> update(Course course) async {
    var result = await _coursesService.update(
      _userRepository.getCurrentUserId,
      course.id,
      course.name,
      course.subTitle,
      course.price,
      course.regularPrice,
    );

    switch (result) {
      case Ok():
        var value = result.value;
        var course = Course.fromModel(value);
        await _setCourseToSubject(course);
        return Result.ok(course);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result> uploadCourseThumbnail(
    Course course,
    Uint8List thumbnail,
  ) async {
    if (thumbnail.length > 100 * 1024) {
      return Result.error("Image size should be less than 100kb");
    }
    var result = await _coursesService.uploadCourseThumbnail(
      _userRepository.getCurrentUserId,
      course.id,
      thumbnail,
    );
    if (result case Ok(:final value)) {
      var course = Course.fromModel(value);
      await _setCourseToSubject(course);
      return Result.ok(course);
    }
    return Result.error("Upload failed.");
  }

  void dispose() {
    // _courseSubject.close();
  }

  @override
  Future<Result<Course>> getCourse(int id, {bool refresh = false}) async {
    try {
      if (!refresh) {
        var courseItem = await _courseDao.getCourseById(id);
        if (courseItem != null) {
          return Result.ok(Course.fromItem(courseItem));
        }
      }
      var course = await _coursesService.getCourseOfTeacherById(
        _userRepository.getCurrentUserId,
        id,
      );
      if (course case Ok(:final value)) {
        var course = Course.fromModel(value);
        var companion = course.toCourseItemCompanion();
        await _courseDao.insertCourseOrUpdate(companion);
        return Result.ok(course);
      }
      return Result.error("Course not found");
    } catch (e) {
      return Result.error("Unexpected issue");
    }
  }

  @override
  Stream<Result<List<Course>>> watchAllEnrolledCoursesOfStudentByMe() async* {
    yield* _courseDao.watchAllEnrolledCourses().map(((event) {
      return Result.ok(event);
    }));
  }

  @override
  Future<Result<Course>> getCourseOfStudentByCourseId(
    int courseId, {
    bool refresh = false,
  }) async {
    var result = await _coursesService.getCourseOfStudentByCourseId(courseId);
    switch (result) {
      case Ok():
        var value = result.value;
        var course = Course.fromModel(value);
        var companion = course.toCourseItemCompanion();
        await _courseDao.insertCourseOrUpdate(companion);

        // Update pagination state when loading individual course (e.g., from deep link)
        setLastLoadedCourseId(course.id.toString());

        return Result.ok(course);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result> updateCourseExpirationDate(
    Course course,
    DateTime expiresAt,
  ) async {
    var result = await _coursesService.updateCourseExpirationDate(
      _userRepository.getCurrentUserId,
      course.id,
      expiresAt,
    );
    if (result case Ok(:final value)) {
      var course = Course.fromModel(value);
      await _setCourseToSubject(course);
      return Result.ok(course);
    }
    return Result.error("Update failed.");
  }

  @override
  Future<Result> publishCourse(Course course) async {
    var result = await _coursesService.publishCourse(
      _userRepository.getCurrentUserId,
      course.id,
    );
    if (result case Ok(:final value)) {
      var course = Course.fromModel(value);
      await _setCourseToSubject(course);
      return Result.ok(course);
    }
    return result;
  }

  @override
  Future<Result> unpublishCourse(Course course) async {
    var result = await _coursesService.unPublishCourse(
      _userRepository.getCurrentUserId,
      course.id,
    );
    if (result case Ok(:final value)) {
      var course = Course.fromModel(value);
      await _setCourseToSubject(course);
      return Result.ok(course);
    }
    return result;
  }

  @override
  Future<Result<CoursePublishCostInfoDTO>> getPublishCostInfo(
    int courseId,
  ) async {
    return await _coursesService.getPublishCostInfo(
      _userRepository.getCurrentUserId,
      courseId,
    );
  }

  @override
  Future<Result<CourseExtensionInvoiceDTO>> getExtensionInvoice(
    int courseId,
    CourseExpirationInput input,
  ) async {
    return await _coursesService.getExtensionInvoice(
      _userRepository.getCurrentUserId,
      courseId,
      input,
    );
  }

  @override
  Future<Result<CoursePaymentRedirectDTO>> generatePaymentToken(
    int courseId,
  ) async {
    return await _coursesService.generatePaymentToken(courseId);
  }

  @override
  Future<Result<SendCourseNotificationResponseDto>> notifyCourse(
    int courseId,
    SendCourseNotificationInputDto input,
  ) async {
    return await _coursesService.notifyCourse(
      _userRepository.getCurrentUserId,
      courseId,
      input,
    );
  }

  // Pagination state management
  @override
  String? getLastLoadedCourseId() {
    return _courseDao.getLastLoadedCourseId();
  }

  @override
  void setLastLoadedCourseId(String? courseId) {
    _courseDao.setLastLoadedCourseId(courseId);
  }

  @override
  void resetPaginationState() {
    _courseDao.resetPaginationState();
  }

  @override
  Future<PaginationState<Course>> getPaginationState() async {
    final cachedCourses = await getAllCoursesFromCache();
    final lastLoadedId = getLastLoadedCourseId();

    if (cachedCourses.isEmpty) {
      return const PaginationState<Course>();
    }

    // Find the last course in the cached data
    final lastCourse = cachedCourses.last;
    final nextCursor = lastLoadedId ?? lastCourse.id.toString();

    return PaginationState<Course>(
      items: cachedCourses,
      nextCursor: nextCursor,
      hasMore: true, // Assume there might be more data
      isLoading: false,
      isLoadingMore: false,
    );
  }
}
