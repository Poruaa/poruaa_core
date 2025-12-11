import 'package:poruaa_core/data/services/note/dto/note_with_structure_dto.dart';
import 'package:poruaa_core/domain/models/note/note.dart';
import 'package:poruaa_core/domain/models/note/note_chapter.dart';
import 'package:poruaa_core/domain/models/note/note_content.dart';
import 'package:poruaa_core/domain/models/note/note_topic.dart';

class NoteWithStructure {
  final Note note;
  final List<ChapterWithTopics> chapters;

  NoteWithStructure({required this.note, required this.chapters});

  factory NoteWithStructure.fromDto(NoteWithStructureDto dto) {
    return NoteWithStructure(
      note: Note.fromDto(dto.note),
      chapters: dto.chapters
          .map((chapterDto) => ChapterWithTopics.fromDto(chapterDto))
          .toList(),
    );
  }
}

class ChapterWithTopics {
  final NoteChapter chapter;
  final List<TopicWithContents> topics;

  ChapterWithTopics({required this.chapter, required this.topics});

  factory ChapterWithTopics.fromDto(ChapterWithTopicsDto dto) {
    return ChapterWithTopics(
      chapter: NoteChapter.fromDto(dto.chapter),
      topics: dto.topics
          .map((topicDto) => TopicWithContents.fromDto(topicDto))
          .toList(),
    );
  }
}

class TopicWithContents {
  final NoteTopic topic;
  final List<NoteContent> contents;

  TopicWithContents({required this.topic, required this.contents});

  factory TopicWithContents.fromDto(TopicWithContentsDto dto) {
    return TopicWithContents(
      topic: NoteTopic.fromDto(dto.topic),
      contents: dto.contents
          .map((contentDto) => NoteContent.fromDto(contentDto))
          .toList(),
    );
  }
}
