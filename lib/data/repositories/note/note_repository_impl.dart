import 'dart:typed_data';

import 'package:poruaa_core/data/repositories/note/note_repository.dart';
import 'package:poruaa_core/data/services/note/dto/create_chapter_input.dart';
import 'package:poruaa_core/data/services/note/dto/create_content_input.dart';
import 'package:poruaa_core/data/services/note/dto/create_note_input.dart';
import 'package:poruaa_core/data/services/note/dto/create_topic_input.dart';
import 'package:poruaa_core/data/services/note/dto/reorder_chapters_input.dart';
import 'package:poruaa_core/data/services/note/dto/reorder_contents_input.dart';
import 'package:poruaa_core/data/services/note/dto/reorder_topics_input.dart';
import 'package:poruaa_core/data/services/note/dto/update_chapter_input.dart';
import 'package:poruaa_core/data/services/note/dto/update_content_input.dart';
import 'package:poruaa_core/data/services/note/dto/update_note_input.dart';
import 'package:poruaa_core/data/services/note/dto/update_topic_input.dart';
import 'package:poruaa_core/data/services/note/dto/write_note_input.dart';
import 'package:poruaa_core/data/services/note/note_service.dart';
import 'package:poruaa_core/domain/models/note/note.dart';
import 'package:poruaa_core/domain/models/note/note_chapter.dart';
import 'package:poruaa_core/domain/models/note/note_content.dart';
import 'package:poruaa_core/domain/models/note/note_topic.dart';
import 'package:poruaa_core/domain/models/note/note_with_structure.dart';
import 'package:poruaa_core/utils/result.dart';

class NoteRepositoryImpl extends NoteRepository {
  final NoteService _noteService;

  NoteRepositoryImpl(NoteService noteService) : _noteService = noteService;

  // Note Management
  @override
  Future<Result<Note>> createNote(int teacherId, CreateNoteInput input) async {
    var result = await _noteService.createNote(teacherId, input);
    switch (result) {
      case Ok():
        var note = Note.fromDto(result.value);
        return Result.ok(note);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<Note>>> getAllNotes(int teacherId) async {
    var result = await _noteService.getAllNotes(teacherId);
    switch (result) {
      case Ok():
        var notes = result.value.map((dto) => Note.fromDto(dto)).toList();
        return Result.ok(notes);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<NoteWithStructure>> getNoteWithStructure(
    int teacherId,
    int noteId,
  ) async {
    var result = await _noteService.getNoteWithStructure(teacherId, noteId);
    switch (result) {
      case Ok():
        var noteWithStructure = NoteWithStructure.fromDto(result.value);
        return Result.ok(noteWithStructure);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Note>> updateNote(
    int teacherId,
    int noteId,
    UpdateNoteInput input,
  ) async {
    var result = await _noteService.updateNote(teacherId, noteId, input);
    switch (result) {
      case Ok():
        var note = Note.fromDto(result.value);
        return Result.ok(note);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<bool>> deleteNote(int teacherId, int noteId) async {
    return await _noteService.deleteNote(teacherId, noteId);
  }

  @override
  Future<Result<NoteWithStructure>> writeNote(
    int teacherId,
    int noteId,
    WriteNoteInput input,
  ) async {
    var result = await _noteService.writeNote(teacherId, noteId, input);
    switch (result) {
      case Ok():
        var noteWithStructure = NoteWithStructure.fromDto(result.value);
        return Result.ok(noteWithStructure);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Uint8List>> exportNotePdf(
    int teacherId,
    int noteId, {
    int columnCount = 2,
  }) async {
    return await _noteService.exportNotePdf(
      teacherId,
      noteId,
      columnCount: columnCount,
    );
  }

  // Chapter Management
  @override
  Future<Result<NoteChapter>> createChapter(
    int teacherId,
    int noteId,
    CreateChapterInput input,
  ) async {
    var result = await _noteService.createChapter(teacherId, noteId, input);
    switch (result) {
      case Ok():
        var chapter = NoteChapter.fromDto(result.value);
        return Result.ok(chapter);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<NoteChapter>>> getAllChapters(
    int teacherId,
    int noteId,
  ) async {
    var result = await _noteService.getAllChapters(teacherId, noteId);
    switch (result) {
      case Ok():
        var chapters = result.value
            .map((dto) => NoteChapter.fromDto(dto))
            .toList();
        return Result.ok(chapters);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<NoteChapter>> updateChapter(
    int teacherId,
    int noteId,
    int chapterId,
    UpdateChapterInput input,
  ) async {
    var result = await _noteService.updateChapter(
      teacherId,
      noteId,
      chapterId,
      input,
    );
    switch (result) {
      case Ok():
        var chapter = NoteChapter.fromDto(result.value);
        return Result.ok(chapter);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<bool>> deleteChapter(
    int teacherId,
    int noteId,
    int chapterId,
  ) async {
    return await _noteService.deleteChapter(teacherId, noteId, chapterId);
  }

  @override
  Future<Result<bool>> reorderChapters(
    int teacherId,
    int noteId,
    ReorderChaptersInput input,
  ) async {
    return await _noteService.reorderChapters(teacherId, noteId, input);
  }

  // Topic Management
  @override
  Future<Result<NoteTopic>> createTopic(
    int teacherId,
    int noteId,
    int chapterId,
    CreateTopicInput input,
  ) async {
    var result = await _noteService.createTopic(
      teacherId,
      noteId,
      chapterId,
      input,
    );
    switch (result) {
      case Ok():
        var topic = NoteTopic.fromDto(result.value);
        return Result.ok(topic);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<NoteTopic>>> getAllTopics(
    int teacherId,
    int noteId,
    int chapterId,
  ) async {
    var result = await _noteService.getAllTopics(teacherId, noteId, chapterId);
    switch (result) {
      case Ok():
        var topics = result.value.map((dto) => NoteTopic.fromDto(dto)).toList();
        return Result.ok(topics);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<NoteTopic>> updateTopic(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    UpdateTopicInput input,
  ) async {
    var result = await _noteService.updateTopic(
      teacherId,
      noteId,
      chapterId,
      topicId,
      input,
    );
    switch (result) {
      case Ok():
        var topic = NoteTopic.fromDto(result.value);
        return Result.ok(topic);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<bool>> deleteTopic(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
  ) async {
    return await _noteService.deleteTopic(
      teacherId,
      noteId,
      chapterId,
      topicId,
    );
  }

  @override
  Future<Result<bool>> reorderTopics(
    int teacherId,
    int noteId,
    int chapterId,
    ReorderTopicsInput input,
  ) async {
    return await _noteService.reorderTopics(
      teacherId,
      noteId,
      chapterId,
      input,
    );
  }

  // Content Management
  @override
  Future<Result<NoteContent>> createContent(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    CreateContentInput input,
  ) async {
    var result = await _noteService.createContent(
      teacherId,
      noteId,
      chapterId,
      topicId,
      input,
    );
    switch (result) {
      case Ok():
        var content = NoteContent.fromDto(result.value);
        return Result.ok(content);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<NoteContent>>> getAllContents(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
  ) async {
    var result = await _noteService.getAllContents(
      teacherId,
      noteId,
      chapterId,
      topicId,
    );
    switch (result) {
      case Ok():
        var contents = result.value
            .map((dto) => NoteContent.fromDto(dto))
            .toList();
        return Result.ok(contents);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<NoteContent>> updateContent(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    int contentId,
    UpdateContentInput input,
  ) async {
    var result = await _noteService.updateContent(
      teacherId,
      noteId,
      chapterId,
      topicId,
      contentId,
      input,
    );
    switch (result) {
      case Ok():
        var content = NoteContent.fromDto(result.value);
        return Result.ok(content);
      case Err():
        return Result.error(result.error);
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
    return await _noteService.deleteContent(
      teacherId,
      noteId,
      chapterId,
      topicId,
      contentId,
    );
  }

  @override
  Future<Result<bool>> reorderContents(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    ReorderContentsInput input,
  ) async {
    return await _noteService.reorderContents(
      teacherId,
      noteId,
      chapterId,
      topicId,
      input,
    );
  }
}
