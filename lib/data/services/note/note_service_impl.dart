import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/note/dto/create_chapter_input.dart';
import 'package:poruaa_core/data/services/note/dto/create_content_input.dart';
import 'package:poruaa_core/data/services/note/dto/create_note_input.dart';
import 'package:poruaa_core/data/services/note/dto/create_topic_input.dart';
import 'package:poruaa_core/data/services/note/dto/note_chapter_dto.dart';
import 'package:poruaa_core/data/services/note/dto/note_content_dto.dart';
import 'package:poruaa_core/data/services/note/dto/note_dto.dart';
import 'package:poruaa_core/data/services/note/dto/note_topic_dto.dart';
import 'package:poruaa_core/data/services/note/dto/note_with_structure_dto.dart';
import 'package:poruaa_core/data/services/note/dto/reorder_chapters_input.dart';
import 'package:poruaa_core/data/services/note/dto/reorder_contents_input.dart';
import 'package:poruaa_core/data/services/note/dto/reorder_topics_input.dart';
import 'package:poruaa_core/data/services/note/dto/update_chapter_input.dart';
import 'package:poruaa_core/data/services/note/dto/update_content_input.dart';
import 'package:poruaa_core/data/services/note/dto/update_note_input.dart';
import 'package:poruaa_core/data/services/note/dto/update_topic_input.dart';
import 'package:poruaa_core/data/services/note/dto/write_note_input.dart';
import 'package:poruaa_core/data/services/note/note_service.dart';
import 'package:poruaa_core/utils/result.dart';

class NoteServiceImpl extends NoteService {
  final AuthorizedApiService _apiService;

  NoteServiceImpl(this._apiService);

  // Note Management
  @override
  Future<Result<NoteDto>> createNote(
    int teacherId,
    CreateNoteInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notes",
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
          var note = NoteDto.fromJson(jsonBody);
          return Result.ok(note);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<List<NoteDto>>> getAllNotes(int teacherId) async {
    try {
      var result = await _apiService.get("teachers/$teacherId/notes");
      switch (result) {
        case Ok():
          var response = result.value;
          var body = response.body;
          var jsonBody = jsonDecode(body);
          if (jsonBody is List) {
            var notes = jsonBody.map((e) => NoteDto.fromJson(e)).toList();
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
  Future<Result<NoteWithStructureDto>> getNoteWithStructure(
    int teacherId,
    int noteId,
  ) async {
    try {
      var result = await _apiService.get("teachers/$teacherId/notes/$noteId");
      switch (result) {
        case Ok():
          var response = result.value;
          var body = response.body;
          var jsonBody = jsonDecode(body);
          var noteWithStructure = NoteWithStructureDto.fromJson(jsonBody);
          return Result.ok(noteWithStructure);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<NoteDto>> updateNote(
    int teacherId,
    int noteId,
    UpdateNoteInput input,
  ) async {
    try {
      var result = await _apiService.put(
        "teachers/$teacherId/notes/$noteId",
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
          var note = NoteDto.fromJson(jsonBody);
          return Result.ok(note);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<bool>> deleteNote(int teacherId, int noteId) async {
    try {
      var result = await _apiService.delete(
        "teachers/$teacherId/notes/$noteId",
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
  Future<Result<NoteWithStructureDto>> writeNote(
    int teacherId,
    int noteId,
    WriteNoteInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notes/$noteId/write",
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
          var noteWithStructure = NoteWithStructureDto.fromJson(jsonBody);
          return Result.ok(noteWithStructure);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<Uint8List>> exportNotePdf(
    int teacherId,
    int noteId, {
    int columnCount = 2,
  }) async {
    try {
      var baseUrl = 'https://pdf-export.poruaa.com';
      if (kDebugMode) {
        baseUrl = 'http://localhost:3002';
      }
      var result = await _apiService.get(
        "teachers/$teacherId/notes/$noteId?column_count=$columnCount",
        overrideBaseUrl: baseUrl,
      );

      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode == 200) {
            // Success: return PDF bytes
            return Result.ok(response.bodyBytes);
          } else {
            // Error response (404, 500): try to parse JSON error message
            try {
              var jsonBody = jsonDecode(response.body);
              var errorMessage = jsonBody['error'] ?? response.body;
              return Result.error(errorMessage);
            } catch (e) {
              return Result.error(response.body);
            }
          }
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  // Chapter Management
  @override
  Future<Result<NoteChapterDto>> createChapter(
    int teacherId,
    int noteId,
    CreateChapterInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notes/$noteId/chapters",
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
          var chapter = NoteChapterDto.fromJson(jsonBody);
          return Result.ok(chapter);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<List<NoteChapterDto>>> getAllChapters(
    int teacherId,
    int noteId,
  ) async {
    try {
      var result = await _apiService.get(
        "teachers/$teacherId/notes/$noteId/chapters",
      );
      switch (result) {
        case Ok():
          var response = result.value;
          var body = response.body;
          var jsonBody = jsonDecode(body);
          if (jsonBody is List) {
            var chapters = jsonBody
                .map((e) => NoteChapterDto.fromJson(e))
                .toList();
            return Result.ok(chapters);
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
  Future<Result<NoteChapterDto>> updateChapter(
    int teacherId,
    int noteId,
    int chapterId,
    UpdateChapterInput input,
  ) async {
    try {
      var result = await _apiService.put(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId",
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
          var chapter = NoteChapterDto.fromJson(jsonBody);
          return Result.ok(chapter);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<bool>> deleteChapter(
    int teacherId,
    int noteId,
    int chapterId,
  ) async {
    try {
      var result = await _apiService.delete(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId",
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
  Future<Result<bool>> reorderChapters(
    int teacherId,
    int noteId,
    ReorderChaptersInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notes/$noteId/chapters/reorder",
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

  // Topic Management
  @override
  Future<Result<NoteTopicDto>> createTopic(
    int teacherId,
    int noteId,
    int chapterId,
    CreateTopicInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics",
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
          var topic = NoteTopicDto.fromJson(jsonBody);
          return Result.ok(topic);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<List<NoteTopicDto>>> getAllTopics(
    int teacherId,
    int noteId,
    int chapterId,
  ) async {
    try {
      var result = await _apiService.get(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics",
      );
      switch (result) {
        case Ok():
          var response = result.value;
          var body = response.body;
          var jsonBody = jsonDecode(body);
          if (jsonBody is List) {
            var topics = jsonBody.map((e) => NoteTopicDto.fromJson(e)).toList();
            return Result.ok(topics);
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
  Future<Result<NoteTopicDto>> updateTopic(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    UpdateTopicInput input,
  ) async {
    try {
      var result = await _apiService.put(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics/$topicId",
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
          var topic = NoteTopicDto.fromJson(jsonBody);
          return Result.ok(topic);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<bool>> deleteTopic(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
  ) async {
    try {
      var result = await _apiService.delete(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics/$topicId",
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
  Future<Result<bool>> reorderTopics(
    int teacherId,
    int noteId,
    int chapterId,
    ReorderTopicsInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics/reorder",
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

  // Content Management
  @override
  Future<Result<NoteContentDto>> createContent(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    CreateContentInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics/$topicId/contents",
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
          var content = NoteContentDto.fromJson(jsonBody);
          return Result.ok(content);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<List<NoteContentDto>>> getAllContents(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
  ) async {
    try {
      var result = await _apiService.get(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics/$topicId/contents",
      );
      switch (result) {
        case Ok():
          var response = result.value;
          var body = response.body;
          var jsonBody = jsonDecode(body);
          if (jsonBody is List) {
            var contents = jsonBody
                .map((e) => NoteContentDto.fromJson(e))
                .toList();
            return Result.ok(contents);
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
  Future<Result<NoteContentDto>> updateContent(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    int contentId,
    UpdateContentInput input,
  ) async {
    try {
      var result = await _apiService.put(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics/$topicId/contents/$contentId",
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
          var content = NoteContentDto.fromJson(jsonBody);
          return Result.ok(content);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<bool>> deleteContent(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    int contentId,
  ) async {
    try {
      var result = await _apiService.delete(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics/$topicId/contents/$contentId",
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
  Future<Result<bool>> reorderContents(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    ReorderContentsInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notes/$noteId/chapters/$chapterId/topics/$topicId/contents/reorder",
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
