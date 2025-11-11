// import 'dart:async';
// import 'package:frontend/data/repositories/course/course_repository.dart';
// import 'package:frontend/data/repositories/course_exam/course_exam_repository.dart';
// import 'package:frontend/utils/result.dart';
// import 'package:frontend/utils/result_loading_use_case_mixin.dart';

// class GetAllCourseExamOfStudentUseCase with ResultLoadingUseCaseMixin {
//   final CourseExamRepository _courseExamRepository;

//   GetAllCourseExamOfStudentUseCase(this._courseExamRepository);

//   Future<Result<dynamic>> call() async {
//     return execute(
//         () => _courseExamRepository.getAllCourseExamsOfStudentByMe());
//   }
// }
