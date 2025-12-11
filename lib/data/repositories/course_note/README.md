# Course Note Repository

Repository interface for managing notes attached to courses.

## Abstract Class

```dart
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
```

## Methods

### `getCourseNotes(int teacherId, int courseId)`
Returns all notes attached to a specific course, ordered by their `order_index`.

**Returns:** `Future<Result<List<NoteWithCourseInfo>>>`

**Example:**
```dart
final result = await repository.getCourseNotes(teacherId: 1, courseId: 5);
```

### `attachNoteToCourse(int teacherId, int courseId, AttachNoteToCourseInput input)`
Attaches a note to a course with optional status and order index. If the note is already attached, it updates the status and order.

**Returns:** `Future<Result<CourseNote>>`

**Example:**
```dart
final input = AttachNoteToCourseInput(
  noteId: 10,
  status: 'public',
  orderIndex: 1,
);
final result = await repository.attachNoteToCourse(teacherId: 1, courseId: 5, input);
```

### `updateCourseNoteStatus(int teacherId, int courseId, int noteId, UpdateCourseNoteStatusInput input)`
Updates the visibility status of a note attached to a course (public or private).

**Returns:** `Future<Result<CourseNote>>`

**Example:**
```dart
final input = UpdateCourseNoteStatusInput(status: 'public');
final result = await repository.updateCourseNoteStatus(
  teacherId: 1,
  courseId: 5,
  noteId: 10,
  input,
);
```

### `detachNoteFromCourse(int teacherId, int courseId, int noteId)`
Removes a note from a course. The note itself is not deleted, only the association.

**Returns:** `Future<Result<bool>>`

**Example:**
```dart
final result = await repository.detachNoteFromCourse(
  teacherId: 1,
  courseId: 5,
  noteId: 10,
);
```

### `reorderCourseNotes(int teacherId, int courseId, ReorderCourseNotesInput input)`
Updates the order of multiple notes attached to a course in a single operation.

**Returns:** `Future<Result<bool>>`

**Example:**
```dart
final input = ReorderCourseNotesInput(
  orders: [
    CourseNoteOrder(noteId: 10, orderIndex: 1),
    CourseNoteOrder(noteId: 11, orderIndex: 2),
  ],
);
final result = await repository.reorderCourseNotes(
  teacherId: 1,
  courseId: 5,
  input,
);
```

## Models

### Domain Models

#### `CourseNote`
Represents the association between a course and a note.

```dart
class CourseNote {
  final int id;              // Course note association ID
  final int courseId;        // ID of the course
  final int noteId;          // ID of the note
  final String status;       // 'public' or 'private'
  final int orderIndex;      // Display order (lower numbers appear first)
  final DateTime createdAt;  // When the association was created
}
```

#### `NoteWithCourseInfo`
Extends `CourseNote` with additional note information.

```dart
class NoteWithCourseInfo {
  // Course note association fields
  final int id;
  final int courseId;
  final int noteId;
  final String status;       // 'public' or 'private'
  final int orderIndex;
  final DateTime createdAt;
  
  // Note details
  final int teacherId;
  final String title;
  final String? description;
  final String? thumbnail;
  final DateTime noteCreatedAt;
  final DateTime noteUpdatedAt;
}
```

### Input DTOs

#### `AttachNoteToCourseInput`
Input for attaching a note to a course.

```dart
class AttachNoteToCourseInput {
  final int noteId;           // Required: ID of the note to attach
  final String? status;       // Optional: 'public' or 'private' (defaults to 'private')
  final int? orderIndex;      // Optional: Display order (auto-incremented if not provided)
}
```

#### `UpdateCourseNoteStatusInput`
Input for updating the visibility status of a course note.

```dart
class UpdateCourseNoteStatusInput {
  final String status;       // Required: Must be 'public' or 'private'
}
```

#### `ReorderCourseNotesInput`
Input for reordering multiple course notes.

```dart
class CourseNoteOrder {
  final int noteId;          // ID of the note
  final int orderIndex;      // New order index
}

class ReorderCourseNotesInput {
  final List<CourseNoteOrder> orders;  // List of note orders
}
```

## Service Layer

The repository uses the `CourseNoteService` for API communication.

### Abstract Service
```dart
import 'package:poruaa_core/data/services/course_note/course_note_service.dart';

// Class: CourseNoteService
```

### Service Implementation
```dart
import 'package:poruaa_core/data/services/course_note/course_note_service_impl.dart';

// Class: CourseNoteServiceImpl
// Constructor: CourseNoteServiceImpl(AuthorizedApiService apiService)
```

## Import Paths

### Repository
```dart
// Abstract repository
import 'package:poruaa_core/data/repositories/course_note/course_note_repository.dart';

// Implementation
import 'package:poruaa_core/data/repositories/course_note/course_note_repository_impl.dart';
```

### Domain Models
```dart
import 'package:poruaa_core/domain/models/course_note/course_note.dart';
import 'package:poruaa_core/domain/models/course_note/note_with_course_info.dart';
```

### Input DTOs
```dart
import 'package:poruaa_core/data/services/course_note/dto/attach_note_to_course_input.dart';
import 'package:poruaa_core/data/services/course_note/dto/update_course_note_status_input.dart';
import 'package:poruaa_core/data/services/course_note/dto/reorder_course_notes_input.dart';
```

## Notes

- **Status Values**: `"public"` - visible to enrolled students, `"private"` - teacher only
- **Order Index**: Lower numbers appear first. If not provided when attaching, it auto-increments from the maximum existing order
- **Authorization**: Teachers can only attach their own notes to their own courses
- **Result Type**: `Result<T>` from `package:poruaa_core/utils/result.dart`
