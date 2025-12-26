import 'package:flutter/material.dart';
import 'package:poruaa_core/data/dao/free_exam/free_exam_dao.dart';
import 'package:poruaa_core/data/repositories/campaign/campaign_repository.dart';
import 'package:poruaa_core/data/repositories/free_exam/free_exam_repository.dart';
import 'package:poruaa_core/data/repositories/free_exam/free_exam_repository_impl.dart';
import 'package:poruaa_core/data/repositories/playlist/playlist_repository.dart';
import 'package:poruaa_core/data/repositories/playlist/playlist_repository_impl.dart';
import 'package:poruaa_core/data/repositories/series/series_repository.dart';
import 'package:poruaa_core/data/repositories/series/series_repository_impl.dart';
import 'package:poruaa_core/data/repositories/short_exam/short_exam_repository_impl.dart';
import 'package:poruaa_core/data/repositories/storage/storage_repository.dart';
import 'package:poruaa_core/data/repositories/storage/storage_repository_impl.dart';
import 'package:poruaa_core/data/repositories/teacher/comprehensive_teacher_repository.dart';
import 'package:poruaa_core/data/repositories/teacher_bookmark/teacher_bookmark_repository.dart';
import 'package:poruaa_core/data/repositories/teacher_highlight/teacher_highlight_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/repositories/wallet/wallet_repository.dart';
import 'package:poruaa_core/data/services/teacher/comprehensive_teacher_service.dart';
import 'package:poruaa_core/domain/models/user/user.dart';
import 'package:poruaa_core/domain/use_cases/student/get_all_enrolled_short_exams_of_student.dart';
import 'package:poruaa_core/domain/use_cases/teacher/get_free_exams_of_teacher.dart';
import 'package:poruaa_core/ui/widgets/user_scope/view_model/user_scope_view_model.dart';
import 'package:provider/provider.dart';
import 'package:poruaa_core/data/repositories/course/course_repository.dart';
import 'package:poruaa_core/data/repositories/course/course_repository_impl.dart';
import 'package:poruaa_core/data/repositories/course_exam/course_exam_repository.dart';
import 'package:poruaa_core/data/repositories/enrollment/enrollment_repository.dart';
import 'package:poruaa_core/data/repositories/exam/exam_repository.dart';
import 'package:poruaa_core/data/repositories/exam/exam_repository_impl.dart';
import 'package:poruaa_core/data/repositories/question/question_repository.dart';
import 'package:poruaa_core/data/repositories/question/question_repository_impl.dart';
import 'package:poruaa_core/data/repositories/rating/rating_repository.dart';
import 'package:poruaa_core/data/repositories/rating/rating_repository_impl.dart';
import 'package:poruaa_core/data/repositories/short_exam/short_exam_repository.dart';
import 'package:poruaa_core/data/services/rating/rating_service.dart';
import 'package:poruaa_core/data/services/rating/rating_service_impl.dart';
import 'package:poruaa_core/data/dao/course/course_dao.dart';
import 'package:poruaa_core/data/dao/course_exam/course_exam_dao.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/data/dao/exam/exam_dao.dart';
import 'package:poruaa_core/data/dao/question/question_dao.dart';
import 'package:poruaa_core/domain/use_cases/student/get_student_enrollment_use_case.dart';
import 'package:poruaa_core/domain/use_cases/teacher/get_courses_of_teacher_use_case.dart';
import 'package:poruaa_core/domain/use_cases/teacher/get_exams_of_teacher_use_case.dart';
import 'package:poruaa_core/domain/use_cases/teacher/get_short_exams_of_teacher.dart';
import 'package:poruaa_core/domain/use_cases/student/get_course_exams_of_student_use_case.dart';
import 'package:poruaa_core/domain/use_cases/student/get_free_course_exams_of_student_use_case.dart';
import 'package:poruaa_core/domain/use_cases/teacher/get_course_materials_use_case.dart';
import 'package:poruaa_core/domain/use_cases/teacher/create_course_material_use_case.dart';
import 'package:poruaa_core/domain/use_cases/teacher/update_course_material_use_case.dart';
import 'package:poruaa_core/domain/use_cases/teacher/delete_course_material_use_case.dart';
import 'package:poruaa_core/domain/use_cases/teacher/reorder_course_materials_use_case.dart';
import 'package:poruaa_core/domain/use_cases/student/get_student_course_materials_use_case.dart';
import 'package:poruaa_core/data/dao/short_exam/short_exam_dao.dart';
import 'package:poruaa_core/data/dao/course_material/course_material_dao.dart';
import 'package:poruaa_core/data/repositories/course_material/course_material_repository.dart';
import 'package:poruaa_core/data/repositories/course_material/course_material_repository_impl.dart';
import 'package:poruaa_core/data/repositories/course_material/student_course_material_repository.dart';
import 'package:poruaa_core/data/repositories/course_material/student_course_material_repository_impl.dart';
import 'package:poruaa_core/data/dao/withdrawal_payment_method/withdrawal_payment_method_dao.dart';
import 'package:poruaa_core/data/dao/withdrawal_request/withdrawal_request_dao.dart';
import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_payment_method_repository.dart';
import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_request_repository.dart';
import 'package:poruaa_core/domain/use_cases/withdrawal/get_payment_methods_use_case.dart';
import 'package:poruaa_core/domain/use_cases/withdrawal/create_payment_method_use_case.dart';
import 'package:poruaa_core/domain/use_cases/withdrawal/update_payment_method_use_case.dart';
import 'package:poruaa_core/domain/use_cases/withdrawal/delete_payment_method_use_case.dart';
import 'package:poruaa_core/domain/use_cases/withdrawal/set_primary_payment_method_use_case.dart';
import 'package:poruaa_core/domain/use_cases/withdrawal/get_withdrawal_requests_use_case.dart';
import 'package:poruaa_core/domain/use_cases/withdrawal/create_withdrawal_request_use_case.dart';
import 'package:poruaa_core/domain/use_cases/withdrawal/check_pending_withdrawal_request_use_case.dart';
import 'package:poruaa_core/data/repositories/teacher_organization/teacher_organization_repository.dart';
import 'package:poruaa_core/data/repositories/note/note_repository.dart';
import 'package:poruaa_core/data/repositories/note/note_repository_impl.dart';
import 'package:poruaa_core/data/repositories/course_note/course_note_repository.dart';
import 'package:poruaa_core/data/repositories/course_note/course_note_repository_impl.dart';
import 'package:poruaa_core/data/repositories/support/support_repository.dart';
import 'package:poruaa_core/data/repositories/support/support_repository_impl.dart';
import 'package:poruaa_core/data/repositories/fcm/fcm_repository.dart';
import 'package:poruaa_core/data/repositories/fcm/fcm_repository_impl.dart';
import 'package:poruaa_core/data/repositories/teacher_notification/teacher_notification_repository.dart';
import 'package:poruaa_core/data/repositories/teacher_notification/teacher_notification_repository_impl.dart';

class UserScopeWidget extends StatefulWidget {
  const UserScopeWidget({
    super.key,
    required this.child,
    this.additionalProviders,
  });
  // final WidgetBuilder builder;
  final Widget child;
  final List<Provider<Object>>? additionalProviders;

  @override
  State<UserScopeWidget> createState() => _UserScopeWidgetState();
}

class _UserScopeWidgetState extends State<UserScopeWidget> {
  late final UserScopeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = UserScopeViewModel(context.read<UserRepository>());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        var currentUser = context.read<UserRepository>().currentUser;
        var userType = switch (currentUser) {
          Student(:final id) => "$id-student",
          Teacher(:final id) => "$id-teacher",
          Organization(:final id) => "$id-organization",
          null => "Unauthorized",
        };

        return MultiProvider(
          key: ValueKey(userType),
          providers: [
            // Database Providers
            Provider<AppDatabase>(
              create: (context) => AppDatabase(),
              dispose: (context, value) => value.close(),
            ),
            Provider<CourseDao>(
              create: (context) => CourseDao(context.read()),
              dispose: (context, value) => value.close(),
            ),
            Provider<ExamDao>(
              create: (context) => ExamDao(context.read()),
              dispose: (context, value) => value.close(),
            ),
            Provider<StorageRepository>(
              create: (context) =>
                  StorageRepositoryImpl(storageService: context.read()),
            ),
            Provider<TeacherBookmarkRepository>(
              create: (context) =>
                  TeacherBookmarkRepositoryImpl(context.read(), context.read()),
            ),
            Provider<TeacherHighlightRepository>(
              create: (context) => TeacherHighlightRepositoryImpl(
                context.read(),
                context.read(),
              ),
            ),
            Provider<ComprehensiveTeacherRepository>(
              create: (context) => ComprehensiveTeacherRepository(
                service: context.read<ComprehensiveTeacherService>(),
              ),
            ),
            Provider<QuestionDao>(
              create: (context) => QuestionDao(context.read()),
              dispose: (context, value) => value.close(),
            ),
            Provider<CourseExamDao>(
              create: (context) => CourseExamDao(context.read()),
              dispose: (context, value) => value.close(),
            ),
            Provider<ShortExamDao>(
              create: (context) => ShortExamDao(context.read()),
              dispose: (context, value) => value.close(),
            ),
            Provider<FreeExamDao>(
              create: (context) => FreeExamDao(context.read()),
            ),
            Provider<CourseMaterialDao>(
              create: (context) => CourseMaterialDao(context.read()),
              dispose: (context, value) => value.close(),
            ),
            Provider<WithdrawalPaymentMethodDao>(
              create: (context) => WithdrawalPaymentMethodDao(context.read()),
            ),
            Provider<WithdrawalRequestDao>(
              create: (context) => WithdrawalRequestDao(context.read()),
            ),

            // Other Repositories
            Provider<WalletRepository>(
              create: (context) =>
                  WalletRepository(context.read(), context.read()),
            ),
            Provider<WithdrawalPaymentMethodRepository>(
              create: (context) => WithdrawalPaymentMethodRepositoryImpl(
                context.read(),
                context.read(),
              ),
            ),
            Provider<WithdrawalRequestRepository>(
              create: (context) => WithdrawalRequestRepositoryImpl(
                context.read(),
                context.read(),
              ),
            ),
            Provider<CourseRepository>(
              create: (context) => CourseRepositoryImpl(
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            Provider<GetCoursesOfTeacherUseCase>(
              create: (context) => GetCoursesOfTeacherUseCase(context.read()),
            ),
            // Provider<GetAllCoursesOfStudentByMeUseCase>(
            //   create: (context) =>
            //       GetAllCoursesOfStudentByMeUseCase(context.read()),
            // ),
            Provider<ExamRepository>(
              create: (context) => ExamRepositoryImpl(
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            Provider<GetExamsOfTeacherUseCase>(
              create: (context) => GetExamsOfTeacherUseCase(context.read()),
            ),
            Provider<QuestionRepository>(
              create: (context) => QuestionRepositoryImpl(
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            Provider<CourseExamRepository>(
              create: (context) => CourseExamRepository(
                context.read(),
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            Provider<EnrollmentRepository>(
              create: (context) => EnrollmentRepository(
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            Provider<ShortExamRepository>(
              create: (context) => ShortExamRepositoryImpl(
                context.read(),
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            Provider<FreeExamRepository>(
              create: (context) => FreeExamRepositoryImpl(
                context.read(),
                context.read(),
                context.read(),
                context.read(),
              ),
            ),
            Provider<CampaignRepository>(
              create: (context) => CampaignRepository(context.read()),
            ),
            Provider<RatingService>(
              create: (context) => RatingServiceImpl(context.read()),
            ),
            Provider<RatingRepository>(
              create: (context) => RatingRepositoryImpl(context.read()),
            ),
            Provider<GetAllEnrolledCoursesOfStudentCase>(
              create: (context) {
                return GetAllEnrolledCoursesOfStudentCase(context.read());
              },
            ),
            Provider<GetShortExamsOfTeacherUseCase>(
              create: (context) =>
                  GetShortExamsOfTeacherUseCase(context.read()),
            ),
            Provider<GetFreeExamsOfTeacher>(
              create: (context) => GetFreeExamsOfTeacher(context.read()),
            ),
            // Provider<GetAllShortExamsOfStudentUseCase>(
            //   create: (context) =>
            //       GetAllShortExamsOfStudentUseCase(context.read()),
            // ),
            Provider<GetAllEnrolledShortExamsOfStudentUseCase>(
              create: (context) =>
                  GetAllEnrolledShortExamsOfStudentUseCase(context.read()),
            ),
            Provider<GetCourseExamsOfStudentUseCase>(
              create: (context) =>
                  GetCourseExamsOfStudentUseCase(context.read()),
            ),
            Provider<GetFreeCourseExamsOfStudentUseCase>(
              create: (context) =>
                  GetFreeCourseExamsOfStudentUseCase(context.read()),
            ),
            // Course Material Repositories
            Provider<CourseMaterialRepository>(
              create: (context) =>
                  CourseMaterialRepositoryImpl(context.read(), context.read()),
            ),
            Provider<StudentCourseMaterialRepository>(
              create: (context) =>
                  StudentCourseMaterialRepositoryImpl(context.read()),
            ),
            Provider<PlaylistRepository>(
              create: (context) =>
                  PlaylistRepositoryImpl(context.read(), context.read()),
            ),
            Provider<SeriesRepository>(
              create: (context) =>
                  SeriesRepositoryImpl(context.read(), context.read()),
            ),
            Provider<GetCourseMaterialsUseCase>(
              create: (context) => GetCourseMaterialsUseCase(context.read()),
            ),
            Provider<CreateCourseMaterialUseCase>(
              create: (context) => CreateCourseMaterialUseCase(context.read()),
            ),
            Provider<UpdateCourseMaterialUseCase>(
              create: (context) => UpdateCourseMaterialUseCase(context.read()),
            ),
            Provider<DeleteCourseMaterialUseCase>(
              create: (context) => DeleteCourseMaterialUseCase(context.read()),
            ),
            Provider<ReorderCourseMaterialsUseCase>(
              create: (context) =>
                  ReorderCourseMaterialsUseCase(context.read()),
            ),
            Provider<GetStudentCourseMaterialsUseCase>(
              create: (context) =>
                  GetStudentCourseMaterialsUseCase(context.read()),
            ),
            // Withdrawal Use Cases
            Provider<GetPaymentMethodsUseCase>(
              create: (context) => GetPaymentMethodsUseCase(context.read()),
            ),
            Provider<CreatePaymentMethodUseCase>(
              create: (context) => CreatePaymentMethodUseCase(context.read()),
            ),
            Provider<UpdatePaymentMethodUseCase>(
              create: (context) => UpdatePaymentMethodUseCase(context.read()),
            ),
            Provider<DeletePaymentMethodUseCase>(
              create: (context) => DeletePaymentMethodUseCase(context.read()),
            ),
            Provider<SetPrimaryPaymentMethodUseCase>(
              create: (context) =>
                  SetPrimaryPaymentMethodUseCase(context.read()),
            ),
            Provider<GetWithdrawalRequestsUseCase>(
              create: (context) => GetWithdrawalRequestsUseCase(context.read()),
            ),
            Provider<CreateWithdrawalRequestUseCase>(
              create: (context) =>
                  CreateWithdrawalRequestUseCase(context.read()),
            ),
            Provider<CheckPendingWithdrawalRequestUseCase>(
              create: (context) =>
                  CheckPendingWithdrawalRequestUseCase(context.read()),
            ),
            // Teacher Organization Repository
            Provider<TeacherOrganizationRepository>(
              create: (context) => TeacherOrganizationRepositoryImpl(
                context.read(),
                context.read(),
              ),
            ),
            // Note Repository
            Provider<NoteRepository>(
              create: (context) => NoteRepositoryImpl(context.read()),
            ),
            // Course Note Repository
            Provider<CourseNoteRepository>(
              create: (context) => CourseNoteRepositoryImpl(context.read()),
            ),
            // Support Repository
            Provider<SupportRepository>(
              create: (context) => SupportRepositoryImpl(context.read()),
            ),
            // FCM Repository
            Provider<FcmRepository>(
              create: (context) => FcmRepositoryImpl(context.read()),
            ),
            // Teacher Notification Repository
            Provider<TeacherNotificationRepository>(
              create: (context) =>
                  TeacherNotificationRepositoryImpl(context.read()),
            ),
            ...(widget.additionalProviders ?? []),
          ],
          child: widget.child,
          // builder: (context, child) => widget.builder(context),
        );
      },
    );
  }
}
