# Poruaa Core

Core business logic, models, and repositories for the Poruaa education platform.

## Features

- **Playlist Management** - Create and manage video playlists for courses
- **Series Management** - Organize courses into series with ordering support
- **Teacher Profile** - Get comprehensive teacher profiles with all series and courses
- **Course Materials** - Manage course content including PDFs and videos
- **User Management** - Authentication and authorization
- **Database Caching** - Local caching with Drift (SQLite)
- **Type-safe Models** - Complete domain models and DTOs
- **Error Handling** - Result type for safe error handling

## Documentation

📚 **[Playlist and Series Integration Guide](./PLAYLIST_AND_SERIES_GUIDE.md)** - Complete guide for using Playlist and Series features with examples

👤 **[Teacher Profile Integration Guide](./TEACHER_PROFILE_GUIDE.md)** - Complete guide for integrating Teacher Profile feature in your app

💰 **[Course Cost & Extension Invoice Guide](./COURSE_COST_EXTENSION_GUIDE.md)** - Reference for course publish cost info and extension invoice features

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  poruaa_core:
    path: ../poruaa_core  # Adjust path as needed
```

Then run:

```bash
flutter pub get
```

## Quick Start

### Initialize Repositories

```dart
import 'package:poruaa_core/poruaa_core.dart';

// Initialize Playlist Repository
final playlistRepository = PlaylistRepositoryImpl(
  PlaylistServiceImpl(apiService),
  userRepository,
);

// Initialize Series Repository
final seriesRepository = SeriesRepositoryImpl(
  SeriesServiceImpl(apiService),
  userRepository,
);

// Initialize Teacher Profile Repository
final teacherProfileRepository = TeacherProfileRepositoryImpl(
  TeacherProfileServiceImpl(apiService),
);
```

### Playlist Example

```dart
// Fetch playlists
final result = await playlistRepository.getPlaylists();

result.fold(
  (playlists) {
    print('Loaded ${playlists.length} playlists');
    for (final playlist in playlists) {
      print('- ${playlist.name}');
    }
  },
  (error) => print('Error: $error'),
);

// Create a new playlist
final createResult = await playlistRepository.createPlaylist(
  CreatePlaylistInput(
    name: 'Introduction to Physics',
    description: 'Basic physics concepts',
  ),
);
```

### Series Example

```dart
// Get series with courses
final result = await seriesRepository.getSeriesWithCourses(seriesId);

result.fold(
  (seriesWithCourses) {
    print('Series: ${seriesWithCourses.name}');
    print('Courses: ${seriesWithCourses.courses.length}');
    
    for (final course in seriesWithCourses.courses) {
      print('- ${course.name} (\$${course.price})');
    }
  },
  (error) => print('Error: $error'),
);
```

### Teacher Profile Example

```dart
// Get complete teacher profile with all series and courses
final result = await teacherProfileRepository.getTeacherProfile(teacherId);

result.fold(
  (profile) {
    final teacher = profile.teacher;
    print('Teacher: ${teacher.name}');
    print('Rating: ${teacher.rating}/5');
    print('Total Students: ${teacher.totalStudents}');
    print('Bio: ${teacher.bio}');
    
    print('\nSeries: ${profile.series.length}');
    for (final series in profile.series) {
      print('- ${series.name} (${series.courses.length} courses)');
    }
  },
  (error) => print('Error: $error'),
);
```

## Package Structure

```
lib/
├── domain/
│   ├── models/          # Domain models (Playlist, Series, Course, etc.)
│   └── use_cases/       # Business logic use cases
├── data/
│   ├── dao/            # Database access objects (Drift)
│   ├── services/       # API service implementations
│   └── repositories/   # Repository implementations
└── utils/              # Utility classes and helpers
```

## Key Models

### Playlist Models
- `Playlist` - Playlist entity
- `Video` - Video entity with CDN support
- `CreatePlaylistInput` - DTO for creating playlists
- `UpdatePlaylistInput` - DTO for updating playlists
- `CreateVideoInput` - DTO for creating videos
- `VideoType` - Enum (live, preRecorded)
- `CdnType` - Enum (cloudflare, aws, youtube, vimeo, other)

### Series Models
- `Series` - Series entity
- `SeriesDTO` - Series with course count
- `SeriesWithCoursesDTO` - Series with full course details
- `CourseInSeriesDTO` - Course within a series
- `CreateSeriesInput` - DTO for creating series
- `UpdateSeriesInput` - DTO for updating series

### Teacher Profile DTOs
- `TeacherDetailsDTO` - Comprehensive teacher information with social media, stats, and availability
- `TeacherProfileWithSeriesDTO` - Teacher profile with all series and courses

## Error Handling

All repository methods return a `Result<T>` type for safe error handling:

```dart
final result = await playlistRepository.getPlaylists();

result.fold(
  (playlists) {
    // Success: Handle the data
    displayPlaylists(playlists);
  },
  (error) {
    // Error: Handle the error
    showErrorMessage(error);
  },
);
```

## Advanced Usage

### With Provider

```dart
class PlaylistProvider extends ChangeNotifier {
  final PlaylistRepository _repository;
  List<Playlist> _playlists = [];
  
  Future<void> fetchPlaylists() async {
    final result = await _repository.getPlaylists();
    result.fold(
      (playlists) {
        _playlists = playlists;
        notifyListeners();
      },
      (error) => print('Error: $error'),
    );
  }
}
```

### With Riverpod

```dart
final playlistsProvider = FutureProvider<List<Playlist>>((ref) async {
  final repository = ref.read(playlistRepositoryProvider);
  final result = await repository.getPlaylists();
  
  return result.fold(
    (playlists) => playlists,
    (error) => throw Exception(error),
  );
});
```

## Database

This package uses [Drift](https://drift.simonbinder.eu/) for local database caching. The database schema includes:

- **Playlists** - Video playlist storage
- **Videos** - Video metadata and URLs
- **Series** - Course series organization
- **Courses** - Course information
- **Materials** - Course materials (PDFs, videos, etc.)
- **And more...**

To regenerate database files after schema changes:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## API Integration

The package communicates with the Poruaa backend API. All API calls are abstracted through services and repositories for easy testing and maintenance.

### Public Routes
- Get teacher series (no auth)
- Get series details (no auth)
- Get course playlists for students

### Protected Routes  
- Create/update/delete playlists (teacher auth)
- Manage videos (teacher auth)
- Manage series (teacher auth)
- Reorder content

## Testing

```dart
// Mock the repository for testing
class MockPlaylistRepository extends Mock implements PlaylistRepository {}

void main() {
  test('should fetch playlists successfully', () async {
    final mockRepo = MockPlaylistRepository();
    when(mockRepo.getPlaylists())
        .thenAnswer((_) async => Result.ok([/* test playlists */]));
    
    final result = await mockRepo.getPlaylists();
    expect(result.isOk, true);
  });
}
```

## Development

### Prerequisites
- Flutter SDK
- Dart SDK

### Setup
```bash
# Get dependencies
flutter pub get

# Generate code
dart run build_runner build --delete-conflicting-outputs

# Run tests
flutter test
```

## Contributing

1. Create a feature branch
2. Make your changes
3. Run tests and ensure code quality
4. Submit a pull request

## Additional Resources

- [Playlist and Series Integration Guide](./PLAYLIST_AND_SERIES_GUIDE.md) - Detailed usage guide
- [Drift Documentation](https://drift.simonbinder.eu/) - Database ORM
- [Flutter Documentation](https://flutter.dev/docs) - Flutter framework

## License

See LICENSE file for details.

## Support

For issues or questions, please contact the development team or create an issue in the project repository.

---

**Last Updated:** November 2025
