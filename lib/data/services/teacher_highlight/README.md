# Teacher Highlights & Bookmarks API Services

This directory contains the implementation of the Teacher Highlights & Bookmarks API services for the Flutter frontend application.

## Overview

The Teacher Highlights & Bookmarks API allows teachers to manage their highlights and bookmarks, and provides public access to view them. The implementation follows the clean architecture pattern with separate layers for services, repositories, and domain models.

## Architecture

### Domain Models
- `TeacherHighlight` - Represents a teacher highlight with all necessary fields
- `CreateHighlightRequest` - Request model for creating highlights
- `UpdateHighlightRequest` - Request model for updating highlights
- `TeacherBookmark` - Represents a teacher bookmark with all necessary fields
- `CreateBookmarkRequest` - Request model for creating bookmarks
- `UpdateBookmarkRequest` - Request model for updating bookmarks

### Services
- `TeacherHighlightService` - Handles all highlight-related API calls
- `TeacherBookmarkService` - Handles all bookmark-related API calls

### Repositories
- `TeacherHighlightRepository` - Repository layer for highlights
- `TeacherBookmarkRepository` - Repository layer for bookmarks

## API Endpoints

### Teacher Highlights API

#### Create Highlight
**POST** `/teachers/{teacher_id}/highlights`
- **Auth**: Teacher required
- **Body**: `CreateHighlightRequest`

#### Update Highlight
**PUT** `/teachers/{teacher_id}/highlights/{highlight_id}`
- **Auth**: Teacher required
- **Body**: `UpdateHighlightRequest`

#### Delete Highlight
**DELETE** `/teachers/{teacher_id}/highlights/{highlight_id}`
- **Auth**: Teacher required

#### Get Teacher's Highlights
**GET** `/teachers/{teacher_id}/highlights`
- **Auth**: Public
- **Response**: Array of highlights with teacher details

#### Get Specific Highlight
**GET** `/highlights/{highlight_id}`
- **Auth**: Public
- **Response**: Single highlight with teacher details

### Teacher Bookmarks API

#### Create Bookmark
**POST** `/teachers/{teacher_id}/bookmarks`
- **Auth**: Teacher required
- **Body**: `CreateBookmarkRequest`

#### Update Bookmark
**PUT** `/teachers/{teacher_id}/bookmarks/{bookmark_id}`
- **Auth**: Teacher required
- **Body**: `UpdateBookmarkRequest`

#### Delete Bookmark
**DELETE** `/teachers/{teacher_id}/bookmarks/{bookmark_id}`
- **Auth**: Teacher required

#### Get Teacher's Bookmarks
**GET** `/teachers/{teacher_id}/bookmarks`
- **Auth**: Public
- **Response**: Array of bookmarks with teacher details

#### Get Specific Bookmark
**GET** `/bookmarks/{bookmark_id}`
- **Auth**: Public
- **Response**: Single bookmark with teacher details

## Usage Examples

### Using TeacherHighlightRepository

```dart
// Get the repository from context
final highlightRepository = context.read<TeacherHighlightRepository>();

// Create a new highlight
final createRequest = CreateHighlightRequest(
  title: 'My Achievement',
  description: 'Description here',
  externalUrl: 'https://example.com',
);

final result = await highlightRepository.createHighlight(createRequest);
switch (result) {
  case Ok(:final highlight):
    print('Highlight created: ${highlight.title}');
  case Err(:final error):
    print('Error: $error');
}

// Get teacher's highlights
final highlightsResult = await highlightRepository.getTeacherHighlights(teacherId);
switch (highlightsResult) {
  case Ok(:final highlights):
    for (final highlight in highlights) {
      print('Highlight: ${highlight.title}');
    }
  case Err(:final error):
    print('Error: $error');
}

// Update a highlight
final updateRequest = UpdateHighlightRequest(
  title: 'Updated Title',
  description: 'Updated description',
);

final updateResult = await highlightRepository.updateHighlight(highlightId, updateRequest);
switch (updateResult) {
  case Ok(:final highlight):
    print('Highlight updated: ${highlight.title}');
  case Err(:final error):
    print('Error: $error');
}

// Delete a highlight
final deleteResult = await highlightRepository.deleteHighlight(highlightId);
switch (deleteResult) {
  case Ok(:final success):
    if (success) {
      print('Highlight deleted successfully');
    }
  case Err(:final error):
    print('Error: $error');
}
```

### Using TeacherBookmarkRepository

```dart
// Get the repository from context
final bookmarkRepository = context.read<TeacherBookmarkRepository>();

// Create a new bookmark
final createRequest = CreateBookmarkRequest(
  thumbnail: 'https://example.com/thumb.jpg',
  description: 'Useful resource',
  externalUrl: 'https://example.com',
);

final result = await bookmarkRepository.createBookmark(createRequest);
switch (result) {
  case Ok(:final bookmark):
    print('Bookmark created: ${bookmark.description}');
  case Err(:final error):
    print('Error: $error');
}

// Get teacher's bookmarks
final bookmarksResult = await bookmarkRepository.getTeacherBookmarks(teacherId);
switch (bookmarksResult) {
  case Ok(:final bookmarks):
    for (final bookmark in bookmarks) {
      print('Bookmark: ${bookmark.description}');
    }
  case Err(:final error):
    print('Error: $error');
}
```

## Error Handling

All methods return a `Result<T>` type that can be either:
- `Ok(T value)` - Success case with the expected data
- `Err(String error)` - Error case with error message

The error messages can be:
- Network errors
- Server response errors (400, 401, 403, 404, 500)
- JSON parsing errors
- Other unexpected errors

## Authentication

- **Teacher Routes**: Require teacher authentication (use `AuthorizedApiService`)
- **Public Routes**: No authentication required (use `ApiService`)

The services automatically handle authentication for teacher-only operations and use public endpoints for read-only operations.

## Dependencies

The services are registered in the dependency injection container and can be accessed using:
- `context.read<TeacherHighlightRepository>()`
- `context.read<TeacherBookmarkRepository>()`
- `context.read<TeacherHighlightService>()`
- `context.read<TeacherBookmarkService>()`
