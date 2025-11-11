import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poruaa_core/utils/haptic_feedback.dart';

class ShareUtils {
  /// Generate deep link URLs for sharing
  static String generateCourseDeepLink(int courseId) {
    return 'https://poruaa.com/course/$courseId';
  }

  static String generateStudentCourseDeepLink(int courseId) {
    return 'https://poruaa.com/student/courses/$courseId';
  }

  static String generateTeacherCourseDeepLink(int courseId) {
    return 'https://poruaa.com/teacher/courses/$courseId';
  }

  static String generateExamDeepLink(int examId) {
    return 'https://poruaa.com/exam/$examId';
  }

  static String generateShortExamDeepLink(int shortExamId) {
    return 'https://poruaa.com/short-exam/$shortExamId';
  }

  static String generateStudentShortExamDeepLink(int shortExamId) {
    return 'https://poruaa.com/student/short-exams/$shortExamId';
  }

  static String generateTeacherShortExamDeepLink(int shortExamId) {
    return 'https://poruaa.com/teacher/short-exams/$shortExamId';
  }

  static String generateStudentCourseExamDeepLink(int courseExamId) {
    return 'https://poruaa.com/student/exams/$courseExamId';
  }

  static String generateTeacherCourseExamDeepLink(
    int courseId,
    int courseExamId,
  ) {
    return 'https://poruaa.com/teacher/courses/$courseId/exams/$courseExamId';
  }

  static String generateTeacherProfileDeepLink(int teacherId) {
    return 'https://poruaa.com/teacher/$teacherId';
  }

  static String generateFreeExamDeepLink(int freeExamId) {
    return 'https://poruaa.com/free-exam/$freeExamId';
  }

  static String generateStudentFreeExamDeepLink(int freeExamId) {
    return 'https://poruaa.com/student/free-exams/$freeExamId';
  }

  static String generateTeacherFreeExamDeepLink(int freeExamId) {
    return 'https://poruaa.com/teacher/free-exams/$freeExamId';
  }

  /// Share a course with a deep link
  static Future<void> shareCourse({
    required BuildContext context,
    required int courseId,
    required String courseName,
    String? description,
  }) async {
    final deepLink = generateCourseDeepLink(courseId);
    final shareText = _buildShareText(
      title: courseName,
      description: description ?? 'Check out this course on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a course for students with a deep link
  static Future<void> shareStudentCourse({
    required BuildContext context,
    required int courseId,
    required String courseName,
    String? description,
  }) async {
    final deepLink = generateStudentCourseDeepLink(courseId);
    final shareText = _buildShareText(
      title: courseName,
      description: description ?? 'Enroll in this course on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a course for teachers with a deep link
  static Future<void> shareTeacherCourse({
    required BuildContext context,
    required int courseId,
    required String courseName,
    String? description,
  }) async {
    final deepLink = generateTeacherCourseDeepLink(courseId);
    final shareText = _buildShareText(
      title: courseName,
      description: description ?? 'Check out this course on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share an exam with a deep link
  static Future<void> shareExam({
    required BuildContext context,
    required int examId,
    required String examName,
    String? description,
  }) async {
    final deepLink = generateExamDeepLink(examId);
    final shareText = _buildShareText(
      title: examName,
      description: description ?? 'Take this exam on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a short exam with a deep link
  static Future<void> shareShortExam({
    required BuildContext context,
    required int shortExamId,
    required String shortExamTitle,
    String? description,
  }) async {
    final deepLink = generateShortExamDeepLink(shortExamId);
    final shareText = _buildShareText(
      title: shortExamTitle,
      description: description ?? 'Try this quiz on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a short exam for students with a deep link
  static Future<void> shareStudentShortExam({
    required BuildContext context,
    required int shortExamId,
    required String shortExamTitle,
    String? description,
  }) async {
    final deepLink = generateStudentShortExamDeepLink(shortExamId);
    final shareText = _buildShareText(
      title: shortExamTitle,
      description: description ?? 'Try this quiz on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a short exam for teachers with a deep link
  static Future<void> shareTeacherShortExam({
    required BuildContext context,
    required int shortExamId,
    required String shortExamTitle,
    String? description,
  }) async {
    final deepLink = generateTeacherShortExamDeepLink(shortExamId);
    final shareText = _buildShareText(
      title: shortExamTitle,
      description: description ?? 'Check out this quiz on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a course exam for students with a deep link
  static Future<void> shareStudentCourseExam({
    required BuildContext context,
    required int courseExamId,
    required String examName,
    String? description,
  }) async {
    final deepLink = generateStudentCourseExamDeepLink(courseExamId);
    final shareText = _buildShareText(
      title: examName,
      description: description ?? 'Take this exam on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a course exam for teachers with a deep link
  static Future<void> shareTeacherCourseExam({
    required BuildContext context,
    required int courseId,
    required int courseExamId,
    required String examName,
    String? description,
  }) async {
    final deepLink = generateTeacherCourseExamDeepLink(courseId, courseExamId);
    final shareText = _buildShareText(
      title: examName,
      description: description ?? 'Check out this exam on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share teacher profile with a deep link
  static Future<void> shareTeacherProfile({
    required BuildContext context,
    required int teacherId,
    required String teacherName,
    String? description,
  }) async {
    final deepLink = generateTeacherProfileDeepLink(teacherId);
    final shareText = _buildShareText(
      title: teacherName,
      description: description ?? 'Check out this teacher on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a free exam for students with a deep link
  static Future<void> shareStudentFreeExam({
    required BuildContext context,
    required int freeExamId,
    required String freeExamTitle,
    String? description,
  }) async {
    final deepLink = generateStudentFreeExamDeepLink(freeExamId);
    final shareText = _buildShareText(
      title: freeExamTitle,
      description: description ?? 'Try this free exam on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Share a free exam for teachers with a deep link
  static Future<void> shareTeacherFreeExam({
    required BuildContext context,
    required int freeExamId,
    required String freeExamTitle,
    String? description,
  }) async {
    final deepLink = generateTeacherFreeExamDeepLink(freeExamId);
    final shareText = _buildShareText(
      title: freeExamTitle,
      description: description ?? 'Check out this free exam on Poruaa!',
      deepLink: deepLink,
    );

    await _shareText(context, shareText);
  }

  /// Simple share method for any text
  static Future<void> share(BuildContext context, String text) async {
    await _shareText(context, text);
  }

  /// Share the app itself
  static Future<void> shareApp({
    required BuildContext context,
    String? customMessage,
  }) async {
    final shareText =
        customMessage ??
        'Join me on Poruaa - the best educational platform for learning and teaching! Download the app: https://poruaa.com';

    await _shareText(context, shareText);
  }

  static String _buildShareText({
    required String title,
    required String description,
    required String deepLink,
  }) {
    return '$title\n\n$description\n\n$deepLink\n\nDownload Poruaa: https://poruaa.com';
  }

  static Future<void> _shareText(BuildContext context, String text) async {
    // For now, we'll use a simple approach
    // In a real app, you might want to use the share_plus package
    try {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Share'),
          content: SelectableText(text),
          actions: [
            TextButton(
              onPressed: () {
                Haptic.light();
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint('Error sharing: $e');
    }
  }

  /// Copy text to clipboard
  static Future<void> copyToClipboard(BuildContext context, String text) async {
    try {
      // You can use the clipboard package for this
      // For now, we'll show a dialog with selectable text
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Copy Link'),
          content: SelectableText(text),
          actions: [
            TextButton(
              onPressed: () {
                Haptic.light();
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint('Error copying to clipboard: $e');
    }
  }

  /// Copy text to clipboard and show snackbar
  static Future<void> copyToClipboardWithSnackbar(
    BuildContext context,
    String text,
  ) async {
    try {
      // Copy to clipboard
      await Clipboard.setData(ClipboardData(text: text));

      // Show success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Link copied to clipboard!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error copying to clipboard: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to copy link'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
