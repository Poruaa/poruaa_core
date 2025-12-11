import 'package:poruaa_core/data/services/note/dto/note_dto.dart';
import 'package:poruaa_core/data/services/note/dto/note_chapter_dto.dart';
import 'package:poruaa_core/data/services/note/dto/note_topic_dto.dart';
import 'package:poruaa_core/data/services/note/dto/note_content_dto.dart';

class NoteWithStructureDto {
  final NoteDto note;
  final List<ChapterWithTopicsDto> chapters;

  NoteWithStructureDto({required this.note, required this.chapters});

  factory NoteWithStructureDto.fromJson(Map<String, dynamic> json) {
    return NoteWithStructureDto(
      note: NoteDto.fromJson(json['note']),
      chapters: (json['chapters'] as List)
          .map((chapterJson) => ChapterWithTopicsDto.fromJson(chapterJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'note': note.toJson(),
      'chapters': chapters.map((chapter) => chapter.toJson()).toList(),
    };
  }
}

class ChapterWithTopicsDto {
  final NoteChapterDto chapter;
  final List<TopicWithContentsDto> topics;

  ChapterWithTopicsDto({required this.chapter, required this.topics});

  factory ChapterWithTopicsDto.fromJson(Map<String, dynamic> json) {
    return ChapterWithTopicsDto(
      chapter: NoteChapterDto.fromJson(json['chapter']),
      topics: (json['topics'] as List)
          .map((topicJson) => TopicWithContentsDto.fromJson(topicJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chapter': chapter.toJson(),
      'topics': topics.map((topic) => topic.toJson()).toList(),
    };
  }
}

class TopicWithContentsDto {
  final NoteTopicDto topic;
  final List<NoteContentDto> contents;

  TopicWithContentsDto({required this.topic, required this.contents});

  factory TopicWithContentsDto.fromJson(Map<String, dynamic> json) {
    return TopicWithContentsDto(
      topic: NoteTopicDto.fromJson(json['topic']),
      contents: (json['contents'] as List)
          .map((contentJson) => NoteContentDto.fromJson(contentJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topic': topic.toJson(),
      'contents': contents.map((content) => content.toJson()).toList(),
    };
  }
}
