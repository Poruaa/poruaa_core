# Note Repository

Repository interface for managing notes, chapters, topics, and content.

## Interface

`NoteRepository` - Abstract repository for note management operations.

## Methods

### Note Management

- `createNote(int teacherId, CreateNoteInput input)` → `Future<Result<Note>>`
- `getAllNotes(int teacherId)` → `Future<Result<List<Note>>>`
- `getNoteWithStructure(int teacherId, int noteId)` → `Future<Result<NoteWithStructure>>`
- `updateNote(int teacherId, int noteId, UpdateNoteInput input)` → `Future<Result<Note>>`
- `deleteNote(int teacherId, int noteId)` → `Future<Result<bool>>`
- `writeNote(int teacherId, int noteId, WriteNoteInput input)` → `Future<Result<NoteWithStructure>>`

### Chapter Management

- `createChapter(int teacherId, int noteId, CreateChapterInput input)` → `Future<Result<NoteChapter>>`
- `getAllChapters(int teacherId, int noteId)` → `Future<Result<List<NoteChapter>>>`
- `updateChapter(int teacherId, int noteId, int chapterId, UpdateChapterInput input)` → `Future<Result<NoteChapter>>`
- `deleteChapter(int teacherId, int noteId, int chapterId)` → `Future<Result<bool>>`
- `reorderChapters(int teacherId, int noteId, ReorderChaptersInput input)` → `Future<Result<bool>>`

### Topic Management

- `createTopic(int teacherId, int noteId, int chapterId, CreateTopicInput input)` → `Future<Result<NoteTopic>>`
- `getAllTopics(int teacherId, int noteId, int chapterId)` → `Future<Result<List<NoteTopic>>>`
- `updateTopic(int teacherId, int noteId, int chapterId, int topicId, UpdateTopicInput input)` → `Future<Result<NoteTopic>>`
- `deleteTopic(int teacherId, int noteId, int chapterId, int topicId)` → `Future<Result<bool>>`
- `reorderTopics(int teacherId, int noteId, int chapterId, ReorderTopicsInput input)` → `Future<Result<bool>>`

### Content Management

- `createContent(int teacherId, int noteId, int chapterId, int topicId, CreateContentInput input)` → `Future<Result<NoteContent>>`
- `getAllContents(int teacherId, int noteId, int chapterId, int topicId)` → `Future<Result<List<NoteContent>>>`
- `updateContent(int teacherId, int noteId, int chapterId, int topicId, int contentId, UpdateContentInput input)` → `Future<Result<NoteContent>>`
- `deleteContent(int teacherId, int noteId, int chapterId, int topicId, int contentId)` → `Future<Result<bool>>`
- `reorderContents(int teacherId, int noteId, int chapterId, int topicId, ReorderContentsInput input)` → `Future<Result<bool>>`

## Models

### Domain Models

- `Note` - Note entity
- `NoteChapter` - Chapter entity
- `NoteTopic` - Topic entity
- `NoteContent` - Content entity
- `NoteWithStructure` - Note with nested chapters, topics, and contents
- `ChapterWithTopics` - Chapter with nested topics
- `TopicWithContents` - Topic with nested contents

### Input DTOs

- `CreateNoteInput` - `{title: String, description?: String, thumbnail?: String}`
- `UpdateNoteInput` - `{title?: String, description?: String, thumbnail?: String}`
- `WriteNoteInput` - `{chapters: List<WriteChapterInput>}`
- `WriteChapterInput` - `{title: String, description?: String, orderIndex?: int, topics: List<WriteTopicInput>}`
- `WriteTopicInput` - `{title: String, description?: String, orderIndex?: int, contents: List<WriteContentInput>}`
- `WriteContentInput` - `{content: String, contentType?: String, orderIndex?: int}`
- `CreateChapterInput` - `{title: String, description?: String, orderIndex?: int}`
- `UpdateChapterInput` - `{title?: String, description?: String, orderIndex?: int}`
- `ReorderChaptersInput` - `{chapterOrders: List<ChapterOrder>}`
- `CreateTopicInput` - `{title: String, description?: String, orderIndex?: int}`
- `UpdateTopicInput` - `{title?: String, description?: String, orderIndex?: int}`
- `ReorderTopicsInput` - `{topicOrders: List<TopicOrder>}`
- `CreateContentInput` - `{content: String, contentType?: String, orderIndex?: int}`
- `UpdateContentInput` - `{content?: String, contentType?: String, orderIndex?: int}`
- `ReorderContentsInput` - `{contentOrders: List<ContentOrder>}`

## References

- **Package**: `poruaa_core/data/repositories/note/note_repository.dart`
- **Implementation**: `NoteRepositoryImpl`
- **Result Type**: `Result<T>` from `poruaa_core/utils/result.dart`

