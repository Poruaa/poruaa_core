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
import 'dart:typed_data';

import 'package:poruaa_core/data/services/note/dto/write_note_input.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class NoteService {
  // Note Management
  Future<Result<NoteDto>> createNote(int teacherId, CreateNoteInput input);
  Future<Result<List<NoteDto>>> getAllNotes(int teacherId);
  Future<Result<NoteWithStructureDto>> getNoteWithStructure(
    int teacherId,
    int noteId,
  );
  Future<Result<NoteDto>> updateNote(
    int teacherId,
    int noteId,
    UpdateNoteInput input,
  );
  Future<Result<bool>> deleteNote(int teacherId, int noteId);
  Future<Result<NoteWithStructureDto>> writeNote(
    int teacherId,
    int noteId,
    WriteNoteInput input,
  );
  Future<Result<Uint8List>> exportNotePdf(
    int teacherId,
    int noteId, {
    int columnCount = 2,
  });

  // Chapter Management
  Future<Result<NoteChapterDto>> createChapter(
    int teacherId,
    int noteId,
    CreateChapterInput input,
  );
  Future<Result<List<NoteChapterDto>>> getAllChapters(
    int teacherId,
    int noteId,
  );
  Future<Result<NoteChapterDto>> updateChapter(
    int teacherId,
    int noteId,
    int chapterId,
    UpdateChapterInput input,
  );
  Future<Result<bool>> deleteChapter(int teacherId, int noteId, int chapterId);
  Future<Result<bool>> reorderChapters(
    int teacherId,
    int noteId,
    ReorderChaptersInput input,
  );

  // Topic Management
  Future<Result<NoteTopicDto>> createTopic(
    int teacherId,
    int noteId,
    int chapterId,
    CreateTopicInput input,
  );
  Future<Result<List<NoteTopicDto>>> getAllTopics(
    int teacherId,
    int noteId,
    int chapterId,
  );
  Future<Result<NoteTopicDto>> updateTopic(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    UpdateTopicInput input,
  );
  Future<Result<bool>> deleteTopic(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
  );
  Future<Result<bool>> reorderTopics(
    int teacherId,
    int noteId,
    int chapterId,
    ReorderTopicsInput input,
  );

  // Content Management
  Future<Result<NoteContentDto>> createContent(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    CreateContentInput input,
  );
  Future<Result<List<NoteContentDto>>> getAllContents(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
  );
  Future<Result<NoteContentDto>> updateContent(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    int contentId,
    UpdateContentInput input,
  );
  Future<Result<bool>> deleteContent(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    int contentId,
  );
  Future<Result<bool>> reorderContents(
    int teacherId,
    int noteId,
    int chapterId,
    int topicId,
    ReorderContentsInput input,
  );
}
