import 'package:poruaa_core/data/repositories/course_note/course_note_repository.dart';
import 'package:poruaa_core/data/services/course_note/course_note_service.dart';
import 'package:poruaa_core/data/services/course_note/dto/attach_note_to_course_input.dart';
import 'package:poruaa_core/data/services/course_note/dto/reorder_course_notes_input.dart';
import 'package:poruaa_core/data/services/course_note/dto/update_course_note_status_input.dart';
import 'package:poruaa_core/domain/models/course_note/course_note.dart';
import 'package:poruaa_core/domain/models/course_note/note_with_course_info.dart';
import 'package:poruaa_core/domain/models/note/note_with_structure.dart';
import 'package:poruaa_core/utils/result.dart';

class CourseNoteRepositoryImpl extends CourseNoteRepository {
  final CourseNoteService _courseNoteService;

  CourseNoteRepositoryImpl(CourseNoteService courseNoteService)
    : _courseNoteService = courseNoteService;

  @override
  Future<Result<List<NoteWithCourseInfo>>> getCourseNotes(
    int teacherId,
    int courseId,
  ) async {
    var result = await _courseNoteService.getCourseNotes(teacherId, courseId);
    switch (result) {
      case Ok():
        var notes = result.value
            .map((dto) => NoteWithCourseInfo.fromDto(dto))
            .toList();
        return Result.ok(notes);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<CourseNote>> attachNoteToCourse(
    int teacherId,
    int courseId,
    AttachNoteToCourseInput input,
  ) async {
    var result = await _courseNoteService.attachNoteToCourse(
      teacherId,
      courseId,
      input,
    );
    switch (result) {
      case Ok():
        var courseNote = CourseNote.fromDto(result.value);
        return Result.ok(courseNote);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<CourseNote>> updateCourseNoteStatus(
    int teacherId,
    int courseId,
    int noteId,
    UpdateCourseNoteStatusInput input,
  ) async {
    var result = await _courseNoteService.updateCourseNoteStatus(
      teacherId,
      courseId,
      noteId,
      input,
    );
    switch (result) {
      case Ok():
        var courseNote = CourseNote.fromDto(result.value);
        return Result.ok(courseNote);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<bool>> detachNoteFromCourse(
    int teacherId,
    int courseId,
    int noteId,
  ) async {
    return await _courseNoteService.detachNoteFromCourse(
      teacherId,
      courseId,
      noteId,
    );
  }

  @override
  Future<Result<bool>> reorderCourseNotes(
    int teacherId,
    int courseId,
    ReorderCourseNotesInput input,
  ) async {
    return await _courseNoteService.reorderCourseNotes(
      teacherId,
      courseId,
      input,
    );
  }

  // Student endpoints

  @override
  Future<Result<List<NoteWithCourseInfo>>> getStudentCourseNotes(
    int courseId,
  ) async {
    var result = await _courseNoteService.getStudentCourseNotes(courseId);
    switch (result) {
      case Ok():
        var notes = result.value
            .map((dto) => NoteWithCourseInfo.fromDto(dto))
            .toList();
        return Result.ok(notes);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<NoteWithStructure>> getStudentCourseNoteWithStructure(
    int courseId,
    int noteId,
  ) async {
    var result = await _courseNoteService.getStudentCourseNoteWithStructure(
      courseId,
      noteId,
    );
    switch (result) {
      case Ok():
        var noteWithStructure = NoteWithStructure.fromDto(result.value);
        return Result.ok(noteWithStructure);
      case Err():
        return Result.error(result.error);
    }
  }
}
