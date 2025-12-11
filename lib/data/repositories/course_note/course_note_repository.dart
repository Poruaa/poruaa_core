import 'package:poruaa_core/data/services/course_note/dto/attach_note_to_course_input.dart';
import 'package:poruaa_core/data/services/course_note/dto/reorder_course_notes_input.dart';
import 'package:poruaa_core/data/services/course_note/dto/update_course_note_status_input.dart';
import 'package:poruaa_core/domain/models/course_note/course_note.dart';
import 'package:poruaa_core/domain/models/course_note/note_with_course_info.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class CourseNoteRepository {
  /// Get all notes attached to a specific course, ordered by their order_index
  Future<Result<List<NoteWithCourseInfo>>> getCourseNotes(
    int teacherId,
    int courseId,
  );

  /// Attach a note to a course with optional status and order index
  Future<Result<CourseNote>> attachNoteToCourse(
    int teacherId,
    int courseId,
    AttachNoteToCourseInput input,
  );

  /// Update the visibility status of a note attached to a course
  Future<Result<CourseNote>> updateCourseNoteStatus(
    int teacherId,
    int courseId,
    int noteId,
    UpdateCourseNoteStatusInput input,
  );

  /// Remove a note from a course (does not delete the note itself)
  Future<Result<bool>> detachNoteFromCourse(
    int teacherId,
    int courseId,
    int noteId,
  );

  /// Update the order of multiple notes attached to a course
  Future<Result<bool>> reorderCourseNotes(
    int teacherId,
    int courseId,
    ReorderCourseNotesInput input,
  );
}
