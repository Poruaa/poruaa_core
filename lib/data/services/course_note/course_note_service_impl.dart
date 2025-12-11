import 'dart:convert';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/course_note/course_note_service.dart';
import 'package:poruaa_core/data/services/course_note/dto/attach_note_to_course_input.dart';
import 'package:poruaa_core/data/services/course_note/dto/course_note_dto.dart';
import 'package:poruaa_core/data/services/course_note/dto/note_with_course_info_dto.dart';
import 'package:poruaa_core/data/services/course_note/dto/reorder_course_notes_input.dart';
import 'package:poruaa_core/data/services/course_note/dto/update_course_note_status_input.dart';
import 'package:poruaa_core/utils/result.dart';

class CourseNoteServiceImpl extends CourseNoteService {
  final AuthorizedApiService _apiService;

  CourseNoteServiceImpl(this._apiService);

  @override
  Future<Result<List<NoteWithCourseInfoDto>>> getCourseNotes(
    int teacherId,
    int courseId,
  ) async {
    try {
      var result = await _apiService.get(
        "teachers/$teacherId/courses/$courseId/notes",
      );
      switch (result) {
        case Ok():
          var response = result.value;
          var body = response.body;
          var jsonBody = jsonDecode(body);
          if (jsonBody is List) {
            var notes = jsonBody
                .map((e) => NoteWithCourseInfoDto.fromJson(e))
                .toList();
            return Result.ok(notes);
          } else {
            return Result.error("Parse error");
          }
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<CourseNoteDto>> attachNoteToCourse(
    int teacherId,
    int courseId,
    AttachNoteToCourseInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/courses/$courseId/notes",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      switch (result) {
        case Ok():
          var response = result.value;
          var statusCode = response.statusCode;
          if (statusCode != 200 && statusCode != 201) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var courseNote = CourseNoteDto.fromJson(jsonBody);
          return Result.ok(courseNote);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<CourseNoteDto>> updateCourseNoteStatus(
    int teacherId,
    int courseId,
    int noteId,
    UpdateCourseNoteStatusInput input,
  ) async {
    try {
      var result = await _apiService.patch(
        "teachers/$teacherId/courses/$courseId/notes/$noteId",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var courseNote = CourseNoteDto.fromJson(jsonBody);
          return Result.ok(courseNote);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<bool>> detachNoteFromCourse(
    int teacherId,
    int courseId,
    int noteId,
  ) async {
    try {
      var result = await _apiService.delete(
        "teachers/$teacherId/courses/$courseId/notes/$noteId",
      );
      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          return Result.ok(true);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<bool>> reorderCourseNotes(
    int teacherId,
    int courseId,
    ReorderCourseNotesInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/courses/$courseId/notes/reorder",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          return Result.ok(true);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }
}
