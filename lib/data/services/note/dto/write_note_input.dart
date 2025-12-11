import 'package:poruaa_core/data/services/note/dto/write_chapter_input.dart';

class WriteNoteInput {
  final List<WriteChapterInput> chapters;

  WriteNoteInput({required this.chapters});

  Map<String, dynamic> toJson() {
    return {'chapters': chapters.map((chapter) => chapter.toJson()).toList()};
  }
}
