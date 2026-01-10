import 'package:flutter/material.dart';
import 'package:poruaa_core/config/poruaa_app_config.dart';
import 'package:poruaa_core/data/dao/cache/exam_result_cache_dao.dart';
import 'package:poruaa_core/data/dao/cache/notification_topic_cache_dao.dart';
import 'package:poruaa_core/data/dao/db/cache_database.dart';
import 'package:poruaa_core/data/repositories/auth/auth_repository.dart';
import 'package:poruaa_core/data/repositories/auth/auth_repository_impl.dart';
import 'package:poruaa_core/data/repositories/config/config_repository.dart';
import 'package:poruaa_core/data/repositories/config/config_repository_impl.dart';
// import 'package:poruaa_core/data/repositories/gemini_api_key/gemini_api_key_repository.dart';
import 'package:poruaa_core/data/repositories/invoice/invoice_repository.dart';
import 'package:poruaa_core/data/repositories/r2_credential/r2_credentials_repository.dart';
import 'package:poruaa_core/data/repositories/theme/theme_repository.dart';
import 'package:poruaa_core/data/repositories/haptic_type/haptic_type_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository_impl.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:poruaa_core/data/services/access_token/access_token_service.dart';
import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/api/api_service_impl.dart';
import 'package:poruaa_core/data/services/auth/auth_service.dart';
import 'package:poruaa_core/data/services/auth/auth_service_impl.dart';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/campaign/campaign_service.dart';
import 'package:poruaa_core/data/services/config/config_service.dart';
import 'package:poruaa_core/data/services/config/config_service_impl.dart';
import 'package:poruaa_core/data/services/course/course_service.dart';
import 'package:poruaa_core/data/services/log/log_service.dart';
import 'package:poruaa_core/data/services/log/log_service_impl.dart';
import 'package:poruaa_core/data/services/course/course_service_impl.dart';
import 'package:poruaa_core/data/services/course_exam/course_exam_service.dart';
import 'package:poruaa_core/data/services/enrollment/enrollment_service.dart';
import 'package:poruaa_core/data/services/exam/exam_service.dart';
import 'package:poruaa_core/data/services/exam/exam_service_impl.dart';
import 'package:poruaa_core/data/services/invoice/invoice_service.dart';
import 'package:poruaa_core/data/services/payment/payment_service.dart';
import 'package:poruaa_core/data/services/playlist/playlist_service.dart';
import 'package:poruaa_core/data/services/playlist/playlist_service_impl.dart';
import 'package:poruaa_core/data/services/series/series_service.dart';
import 'package:poruaa_core/data/services/series/series_service_impl.dart';
import 'package:poruaa_core/data/services/teacher_profile/teacher_profile_service.dart';
import 'package:poruaa_core/data/services/teacher_profile/teacher_profile_service_impl.dart';
import 'package:poruaa_core/data/repositories/teacher_profile/teacher_profile_repository.dart';
import 'package:poruaa_core/data/repositories/teacher_profile/teacher_profile_repository_impl.dart';
import 'package:poruaa_core/data/services/question/question_service.dart';
import 'package:poruaa_core/data/services/question/question_service_impl.dart';
import 'package:poruaa_core/data/services/shared_preference/shared_preference_service.dart';
import 'package:poruaa_core/data/services/short_exam/short_exam_service.dart';
import 'package:poruaa_core/data/services/free_exam/free_exam_service.dart';
import 'package:poruaa_core/data/services/storage/my_storage_service.dart';
import 'package:poruaa_core/data/services/storage/r2_storage_service.dart';
import 'package:poruaa_core/data/services/storage/r2_storage_service_impl.dart';
import 'package:poruaa_core/data/services/storage/storage_service.dart';
import 'package:poruaa_core/data/services/teacher/comprehensive_teacher_service.dart';
import 'package:poruaa_core/data/services/teacher/teacher_notification_service.dart';
import 'package:poruaa_core/data/services/teacher/teacher_notification_service_impl.dart';
import 'package:poruaa_core/data/services/user/user_service_impl.dart';
import 'package:poruaa_core/data/services/user/user_service.dart';
import 'package:poruaa_core/data/services/wallet/wallet_service.dart';
import 'package:poruaa_core/data/services/course_material/course_material_service.dart';
import 'package:poruaa_core/data/services/course_material/course_material_service_impl.dart';
import 'package:poruaa_core/data/services/course_material/student_course_material_service.dart';
import 'package:poruaa_core/data/services/course_material/student_course_material_service_impl.dart';
import 'package:poruaa_core/data/services/wallet/withdrawal_payment_method_service.dart';
import 'package:poruaa_core/data/services/wallet/withdrawal_request_service.dart';
import 'package:poruaa_core/data/services/teacher_organization/teacher_organization_service.dart';
import 'package:poruaa_core/data/services/teacher_highlight/teacher_highlight_service.dart';
import 'package:poruaa_core/data/services/teacher_bookmark/teacher_bookmark_service.dart';
import 'package:poruaa_core/data/services/note/note_service.dart';
import 'package:poruaa_core/data/services/note/note_service_impl.dart';
import 'package:poruaa_core/data/services/course_note/course_note_service.dart';
import 'package:poruaa_core/data/services/course_note/course_note_service_impl.dart';
import 'package:poruaa_core/data/services/support/support_service.dart';
import 'package:poruaa_core/data/services/support/support_service_impl.dart';
import 'package:poruaa_core/data/services/fcm/fcm_service.dart';
import 'package:poruaa_core/data/services/fcm/fcm_service_impl.dart';
// import 'package:poruaa_core/domain/use_cases/auth_user_use_case.dart';
import 'package:poruaa_core/domain/use_cases/load_repositories_use_case.dart';
// import 'package:poruaa_core/domain/use_cases/auth_user_use_case_impl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Provider<Object>> getMainProviders(
  SharedPreferences sharedPreferences,
  PoruaaAppConfig poruaaAppConfig,
  List<Provider<Object>>? additionalProviders,
) {
  return [
    Provider<PoruaaAppConfig>(create: (context) => poruaaAppConfig),
    Provider<SharedPreferenceService>(
      create: (context) => SharedPreferenceService(sharedPreferences),
    ),
    Provider<CacheDatabase>(
      create: (context) => CacheDatabase(),
      dispose: (context, value) => value.close(),
    ),
    Provider<ExamResultCacheDao>(
      create: (context) => ExamResultCacheDao(context.read()),
      dispose: (context, value) => value.close(),
    ),
    Provider<NotificationTopicCacheDao>(
      create: (context) => NotificationTopicCacheDao(context.read()),
    ),
    Provider<StorageService>(create: (context) => MyStorageService()),
    Provider<ThemeModeRepository>(
      create: (context) => ThemeModeRepository(context.read()),
    ),
    Provider<HapticTypeRepository>(
      create: (context) => HapticTypeRepository(context.read()),
    ),
    Provider<AccessTokenService>(
      create: (context) => AccessTokenService(context.read()),
    ),
    Provider<ApiService>(
      create: (context) {
        final apiService = ApiServiceImpl(context.read(), context.read());
        // Initialize device info asynchronously
        apiService.initializeDeviceInfo();
        return apiService;
      },
    ),
    Provider<AuthService>(
      create: (context) => AuthServiceImpl(context.read(), context.read()),
    ),
    Provider<AuthorizedApiService>(
      create: (context) =>
          AuthorizedApiService(context.read(), context.read(), context.read()),
    ),
    Provider<R2StorageService>(
      create: (context) => R2StorageServiceImpl(apiService: context.read()),
    ),
    Provider<ConfigService>(create: (context) => ConfigServiceImpl()),
    Provider<ConfigRepository>(
      create: (context) => ConfigRepositoryImpl(context.read())..load(),
    ),
    Provider<LogService>(create: (context) => LogServiceImpl()),
    Provider<UserService>(create: (context) => UserServiceImpl(context.read())),
    Provider<CoursesService>(
      create: (context) => CoursesServiceImpl(context.read()),
    ),
    Provider<ExamService>(create: (context) => ExamServiceImpl(context.read())),
    Provider<QuestionService>(
      create: (context) => QuestionServiceImpl(context.read()),
    ),
    Provider<PlaylistService>(
      create: (context) => PlaylistServiceImpl(context.read()),
    ),
    Provider<SeriesService>(
      create: (context) => SeriesServiceImpl(context.read()),
    ),
    Provider<TeacherProfileService>(
      create: (context) => TeacherProfileServiceImpl(context.read()),
    ),
    Provider<TeacherProfileRepository>(
      create: (context) => TeacherProfileRepositoryImpl(context.read()),
    ),
    Provider<CourseExamService>(
      create: (context) => CourseExamService(context.read()),
    ),
    Provider<EnrollmentService>(
      create: (context) => EnrollmentService(context.read()),
    ),
    Provider<ShortExamService>(
      create: (context) => ShortExamService(context.read()),
    ),
    Provider<FreeExamService>(
      create: (context) => FreeExamService(context.read()),
    ),
    Provider<CampaignService>(
      create: (context) => CampaignService(context.read()),
    ),
    Provider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(context.read(), context.read()),
    ),
    Provider<PaymentService>(
      create: (context) => PaymentService(context.read()),
    ),
    Provider<WalletService>(create: (context) => WalletService(context.read())),
    Provider<WithdrawalPaymentMethodService>(
      create: (context) => WithdrawalPaymentMethodService(context.read()),
    ),
    Provider<WithdrawalRequestService>(
      create: (context) => WithdrawalRequestService(context.read()),
    ),
    Provider<UserRepository>(
      create: (context) => UserRepositoryImpl(
        context.read(),
        context.read(),
        context.read(),
        context.read(),
      ),
    ),
    // Provider<GeminiApiKeyRepository>(
    //   create: (context) => GeminiApiKeyRepository(context.read()),
    // ),
    Provider<R2CredentialsRepository>(
      create: (context) => R2CredentialsRepository(context.read()),
    ),
    // Provider<R2UploadService>(
    //   create: (context) => R2UploadService(context.read()),
    // ),
    Provider<InvoiceService>(
      create: (context) => InvoiceService(context.read()),
    ),
    Provider<InvoiceRepository>(
      create: (context) => InvoiceRepository(context.read()),
    ),
    Provider<CourseMaterialService>(
      create: (context) => CourseMaterialServiceImpl(context.read()),
    ),
    Provider<StudentCourseMaterialService>(
      create: (context) => StudentCourseMaterialServiceImpl(context.read()),
    ),
    // Teacher Organization Services
    Provider<TeacherOrganizationService>(
      create: (context) => TeacherOrganizationServiceImpl(context.read()),
    ),
    // Teacher Highlight Services
    Provider<TeacherHighlightService>(
      create: (context) =>
          TeacherHighlightServiceImpl(context.read(), context.read()),
    ),
    // Teacher Bookmark Services
    Provider<TeacherBookmarkService>(
      create: (context) =>
          TeacherBookmarkServiceImpl(context.read(), context.read()),
    ),
    // Teacher Notification Services
    Provider<TeacherNotificationService>(
      create: (context) => TeacherNotificationServiceImpl(context.read()),
    ),
    // Note Services
    Provider<NoteService>(create: (context) => NoteServiceImpl(context.read())),
    // Course Note Services
    Provider<CourseNoteService>(
      create: (context) => CourseNoteServiceImpl(context.read()),
    ),
    // Support Services
    Provider<SupportService>(
      create: (context) =>
          SupportServiceImpl(context.read(), context.read(), context.read()),
    ),
    // FCM Services
    Provider<FcmService>(create: (context) => FcmServiceImpl(context.read())),
    // RepositoryProvider<AuthUserUseCase>(
    //   create: (context) =>
    //       AuthUserUseCaseImpl(context.read(), context.read()),
    // ),
    Provider<ComprehensiveTeacherService>(
      create: (context) => ComprehensiveTeacherService(
        apiService: context.read(), // Replace with your actual API base URL
      ),
    ),
    // Provider<GoRouter>(
    //   create: (context) => router(context.read()),
    //   dispose: (context, value) => value.dispose(),
    // ),
    Provider<LoadRepositoriesUseCase>(
      create: (context) => LoadRepositoriesUseCase(context.read())..load(),
    ),
    ...(additionalProviders ?? []),
    // Withdrawal Services
  ];
}

class PoruaaApp extends StatelessWidget {
  const PoruaaApp({
    super.key,
    required this.child,
    this.providers,
    required this.poruaaAppConfig,
    required this.sharedPreferences,
  });
  final Widget child;
  final SharedPreferences sharedPreferences;

  final List<Provider<Object>>? providers;
  final PoruaaAppConfig poruaaAppConfig;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getMainProviders(
        sharedPreferences,
        poruaaAppConfig,
        providers,
      ),
      child: child,
    );
  }
}
