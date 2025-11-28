# Playlist and Series Integration Guide

This guide explains how to integrate and use the Playlist and Series features from the `poruaa_core` package in your Flutter application.

## Table of Contents

- [Installation](#installation)
- [Setup](#setup)
- [Playlist Features](#playlist-features)
  - [Teacher Operations](#playlist-teacher-operations)
  - [Student Operations](#playlist-student-operations)
  - [Models & DTOs](#playlist-models)
- [Series Features](#series-features)
  - [Public Operations](#series-public-operations)
  - [Teacher Operations](#series-teacher-operations)
  - [Models & DTOs](#series-models)
- [Teacher Profile](#teacher-profile)
  - [Get Complete Profile](#get-teacher-profile)
  - [DTOs](#teacher-profile-dtos)
- [Error Handling](#error-handling)
- [Best Practices](#best-practices)

---

## Installation

Add `poruaa_core` to your `pubspec.yaml`:

```yaml
dependencies:
  poruaa_core:
    path: ../poruaa_core  # Adjust path as needed
```

Then run:

```bash
flutter pub get
```

---

## Setup

### 1. Import Required Modules

```dart
import 'package:poruaa_core/poruaa_core.dart';
```

### 2. Initialize Repositories

```dart
// Assuming you have these dependencies set up
final ApiService apiService = ApiServiceImpl(/* your config */);
final UserRepository userRepository = UserRepositoryImpl(/* your config */);

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

---

## Playlist Features

### Playlist Teacher Operations

#### Get All Playlists

```dart
Future<void> fetchPlaylists() async {
  final result = await playlistRepository.getPlaylists();
  
  result.fold(
    (playlists) {
      // Success: Display playlists
      for (final playlist in playlists) {
        print('${playlist.name}: ${playlist.description}');
      }
    },
    (error) {
      // Error: Show error message
      print('Error: $error');
    },
  );
}
```

#### Create a Playlist

```dart
Future<void> createNewPlaylist() async {
  final input = CreatePlaylistInput(
    name: 'Introduction to Physics',
    description: 'Basic physics concepts',
    thumbnail: 'https://example.com/thumb.jpg',
  );
  
  final result = await playlistRepository.createPlaylist(input);
  
  result.fold(
    (playlist) {
      print('Created playlist: ${playlist.id}');
    },
    (error) {
      print('Error creating playlist: $error');
    },
  );
}
```

#### Update a Playlist

```dart
Future<void> updatePlaylist(int playlistId) async {
  final input = UpdatePlaylistInput(
    name: 'Advanced Physics',
    description: 'Updated description',
  );
  
  final result = await playlistRepository.updatePlaylist(playlistId, input);
  
  result.fold(
    (playlist) {
      print('Updated playlist: ${playlist.name}');
    },
    (error) {
      print('Error updating playlist: $error');
    },
  );
}
```

#### Delete a Playlist

```dart
Future<void> deletePlaylist(int playlistId) async {
  final result = await playlistRepository.deletePlaylist(playlistId);
  
  result.fold(
    (_) {
      print('Playlist deleted successfully');
    },
    (error) {
      print('Error deleting playlist: $error');
    },
  );
}
```

#### Add Video to Playlist

```dart
Future<void> addVideo(int playlistId) async {
  final input = CreateVideoInput(
    title: 'Introduction Video',
    description: 'Welcome to the course',
    videoType: VideoType.preRecorded,
    cdnType: 'cloudflare',
    videoUrl: 'https://example.com/video.mp4',
    thumbnail: 'https://example.com/thumb.jpg',
    duration: 3600, // Duration in seconds
    orderIndex: 0,
    isPublic: false,
  );
  
  final result = await playlistRepository.createVideo(playlistId, input);
  
  result.fold(
    (video) {
      print('Video added: ${video.title}');
    },
    (error) {
      print('Error adding video: $error');
    },
  );
}
```

#### Get Videos in a Playlist

```dart
Future<void> fetchVideos(int playlistId) async {
  final result = await playlistRepository.getVideos(playlistId);
  
  result.fold(
    (videos) {
      for (final video in videos) {
        print('${video.title} - ${video.videoType.displayName}');
        print('Duration: ${video.duration}s, Public: ${video.isPublic}');
      }
    },
    (error) {
      print('Error fetching videos: $error');
    },
  );
}
```

#### Update Video

```dart
Future<void> updateVideo(int playlistId, int videoId) async {
  final input = UpdateVideoInput(
    title: 'Updated Title',
    isPublic: true,
  );
  
  final result = await playlistRepository.updateVideo(
    playlistId,
    videoId,
    input,
  );
  
  result.fold(
    (video) {
      print('Video updated: ${video.title}');
    },
    (error) {
      print('Error updating video: $error');
    },
  );
}
```

#### Reorder Videos

```dart
Future<void> reorderVideos(int playlistId) async {
  final input = ReorderVideosInput(
    videoOrders: [
      VideoOrder(videoId: 1, orderIndex: 0),
      VideoOrder(videoId: 2, orderIndex: 1),
      VideoOrder(videoId: 3, orderIndex: 2),
    ],
  );
  
  final result = await playlistRepository.reorderVideos(playlistId, input);
  
  result.fold(
    (_) {
      print('Videos reordered successfully');
    },
    (error) {
      print('Error reordering videos: $error');
    },
  );
}
```

#### Attach Playlist to Course

```dart
Future<void> attachPlaylistToCourse(int courseId, int playlistId) async {
  final input = AttachPlaylistToCourseInput(
    playlistId: playlistId,
    orderIndex: 0,
  );
  
  final result = await playlistRepository.attachPlaylistToCourse(
    courseId,
    input,
  );
  
  result.fold(
    (_) {
      print('Playlist attached to course');
    },
    (error) {
      print('Error attaching playlist: $error');
    },
  );
}
```

### Playlist Student Operations

#### Get Course Playlists (Student View)

```dart
Future<void> fetchCoursePlaylistsForStudent(int courseId) async {
  final result = await playlistRepository.getCoursePlaylistsForStudent(courseId);
  
  result.fold(
    (playlists) {
      // Only playlists attached to enrolled courses
      for (final playlist in playlists) {
        print('${playlist.name}');
      }
    },
    (error) {
      print('Error: $error');
    },
  );
}
```

#### Get Playlist Videos (Student View)

```dart
Future<void> fetchPlaylistVideosForStudent(int courseId, int playlistId) async {
  final result = await playlistRepository.getPlaylistVideosForStudent(
    courseId,
    playlistId,
  );
  
  result.fold(
    (videos) {
      // Only public videos will be returned
      for (final video in videos) {
        print('${video.title} - ${video.videoUrl}');
      }
    },
    (error) {
      print('Error: $error');
    },
  );
}
```

#### Get Single Video (Student View)

```dart
Future<void> fetchVideoForStudent(
  int courseId,
  int playlistId,
  int videoId,
) async {
  final result = await playlistRepository.getVideoForStudent(
    courseId,
    playlistId,
    videoId,
  );
  
  result.fold(
    (video) {
      print('Playing: ${video.title}');
      print('URL: ${video.videoUrl}');
      print('Duration: ${video.duration} seconds');
    },
    (error) {
      print('Error: $error');
    },
  );
}
```

### Playlist Models

#### VideoType Enum

```dart
enum VideoType {
  live,          // Live streaming video
  preRecorded,   // Pre-recorded video
}

// Usage
VideoType.live.displayName;  // Returns "Live"
VideoType.live.icon;         // Returns "🔴"
```

#### CdnType Enum

```dart
enum CdnType {
  cloudflare,
  aws,
  youtube,
  vimeo,
  other,
}

// Usage
CdnType.cloudflare.displayName;  // Returns "Cloudflare"
```

---

## Series Features

### Series Public Operations

These operations don't require authentication and can be used to display public series data.

#### Get All Series for a Teacher

```dart
Future<void> fetchTeacherSeries(int teacherId) async {
  final result = await seriesRepository.getAllSeries(teacherId);
  
  result.fold(
    (seriesList) {
      for (final series in seriesList) {
        print('${series.name}: ${series.courseCount} courses');
        print('Description: ${series.description}');
      }
    },
    (error) {
      print('Error: $error');
    },
  );
}
```

#### Get Series by ID

```dart
Future<void> fetchSeriesDetails(int seriesId) async {
  final result = await seriesRepository.getSeriesById(seriesId);
  
  result.fold(
    (series) {
      print('Series: ${series.name}');
      print('Teacher ID: ${series.teacherId}');
      print('Description: ${series.description}');
    },
    (error) {
      print('Error: $error');
    },
  );
}
```

#### Get Series with All Courses

```dart
Future<void> fetchSeriesWithCourses(int seriesId) async {
  final result = await seriesRepository.getSeriesWithCourses(seriesId);
  
  result.fold(
    (seriesWithCourses) {
      print('Series: ${seriesWithCourses.name}');
      print('Total Courses: ${seriesWithCourses.courses.length}');
      
      for (final course in seriesWithCourses.courses) {
        print('\nCourse: ${course.name}');
        print('Price: \$${course.price}');
        print('Rating: ${course.rating}/5');
        print('Enrollments: ${course.enrollmentCount}');
        print('Exams: ${course.examCount}, Materials: ${course.materialCount}');
      }
    },
    (error) {
      print('Error: $error');
    },
  );
}
```

### Series Teacher Operations

These operations require teacher authentication.

#### Create a Series

```dart
Future<void> createNewSeries() async {
  final input = CreateSeriesInput(
    name: 'Complete Physics Series',
    description: 'All physics courses from beginner to advanced',
    thumbnail: 'https://example.com/series-thumb.jpg',
  );
  
  final result = await seriesRepository.createSeries(input);
  
  result.fold(
    (series) {
      print('Created series: ${series.id}');
      print('Name: ${series.name}');
    },
    (error) {
      print('Error creating series: $error');
    },
  );
}
```

#### Update a Series

```dart
Future<void> updateSeries(int seriesId) async {
  final input = UpdateSeriesInput(
    name: 'Updated Series Name',
    description: 'Updated description',
  );
  
  final result = await seriesRepository.updateSeries(seriesId, input);
  
  result.fold(
    (series) {
      print('Updated series: ${series.name}');
    },
    (error) {
      print('Error updating series: $error');
    },
  );
}
```

#### Delete a Series

```dart
Future<void> deleteSeries(int seriesId) async {
  final result = await seriesRepository.deleteSeries(seriesId);
  
  result.fold(
    (deletedSeries) {
      print('Deleted series: ${deletedSeries.name}');
    },
    (error) {
      print('Error deleting series: $error');
    },
  );
}
```

#### Reorder Series

```dart
Future<void> reorderSeries() async {
  final input = ReorderSeriesInput(
    seriesOrders: [
      SeriesOrder(seriesId: 1, orderIndex: 0),
      SeriesOrder(seriesId: 3, orderIndex: 1),
      SeriesOrder(seriesId: 2, orderIndex: 2),
    ],
  );
  
  final result = await seriesRepository.reorderSeries(input);
  
  result.fold(
    (_) {
      print('Series reordered successfully');
    },
    (error) {
      print('Error reordering series: $error');
    },
  );
}
```

#### Add Course to Series

```dart
Future<void> addCourseToSeries(int seriesId, int courseId) async {
  final input = AddCourseToSeriesInput(
    courseId: courseId,
    orderIndex: 0, // Optional, defaults to 0 if not provided
  );
  
  final result = await seriesRepository.addCourseToSeries(seriesId, input);
  
  result.fold(
    (_) {
      print('Course added to series successfully');
    },
    (error) {
      print('Error adding course: $error');
    },
  );
}
```

#### Remove Course from Series

```dart
Future<void> removeCourseFromSeries(int seriesId, int courseId) async {
  final result = await seriesRepository.removeCourseFromSeries(
    seriesId,
    courseId,
  );
  
  result.fold(
    (_) {
      print('Course removed from series successfully');
    },
    (error) {
      print('Error removing course: $error');
    },
  );
}
```

#### Reorder Courses in Series

```dart
Future<void> reorderCoursesInSeries(int seriesId) async {
  final input = ReorderCoursesInSeriesInput(
    courseOrders: [
      CourseOrder(courseId: 10, orderIndex: 0),
      CourseOrder(courseId: 11, orderIndex: 1),
      CourseOrder(courseId: 12, orderIndex: 2),
    ],
  );
  
  final result = await seriesRepository.reorderCoursesInSeries(
    seriesId,
    input,
  );
  
  result.fold(
    (_) {
      print('Courses reordered successfully');
    },
    (error) {
      print('Error reordering courses: $error');
    },
  );
}
```

### Series Models

#### SeriesDTO

Contains series information with course count:

```dart
class SeriesDTO {
  final int id;
  final int teacherId;
  final String name;
  final String? description;
  final String? thumbnail;
  final int orderIndex;
  final int courseCount;  // Number of courses in this series
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

#### SeriesWithCoursesDTO

Contains series information with full course details:

```dart
class SeriesWithCoursesDTO {
  final int id;
  final int teacherId;
  final String name;
  final String? description;
  final String? thumbnail;
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<CourseInSeriesDTO> courses;
}
```

#### CourseInSeriesDTO

Contains detailed course information within a series:

```dart
class CourseInSeriesDTO {
  final int id;
  final int courseId;
  final int orderIndex;
  final String name;
  final String? subTitle;
  final String? thumbnail;
  final DateTime createdAt;
  final DateTime expiresAt;
  final DateTime? publishedAt;
  final double rating;
  final int enrollmentCount;
  final double price;
  final double? regularPrice;
  final bool isUnlisted;
  final int examCount;
  final int materialCount;
}
```

---

## Teacher Profile

The Teacher Profile endpoint provides a comprehensive view of a teacher's profile including all their series and courses in a single API call. This is a public endpoint that doesn't require authentication.

### Get Teacher Profile

#### Fetch Complete Teacher Profile with Series and Courses

```dart
Future<void> fetchTeacherProfile(int teacherId) async {
  final result = await teacherProfileRepository.getTeacherProfile(teacherId);
  
  result.fold(
    (profile) {
      // Teacher details
      final teacher = profile.teacher;
      print('Teacher: ${teacher.name}');
      print('Email: ${teacher.email}');
      print('Bio: ${teacher.bio}');
      print('Rating: ${teacher.rating}/5');
      print('Total Students: ${teacher.totalStudents}');
      print('Total Courses: ${teacher.totalCourses}');
      print('Years of Experience: ${teacher.yearsExperience}');
      
      // Social media links
      if (teacher.youtube != null) print('YouTube: ${teacher.youtube}');
      if (teacher.facebook != null) print('Facebook: ${teacher.facebook}');
      if (teacher.instagram != null) print('Instagram: ${teacher.instagram}');
      
      // Availability
      print('Available: ${teacher.isAvailable ?? false}');
      if (teacher.nextAvailableSlot != null) {
        print('Next Available: ${teacher.nextAvailableSlot}');
      }
      
      // Series and courses
      print('\nSeries (${profile.series.length}):');
      for (final series in profile.series) {
        print('\n  Series: ${series.name}');
        print('  Courses: ${series.courses.length}');
        
        for (final course in series.courses) {
          print('    - ${course.name}');
          print('      Price: \$${course.price}');
          print('      Rating: ${course.rating}/5');
          print('      Students: ${course.enrollmentCount}');
        }
      }
    },
    (error) {
      if (error.contains('not found')) {
        print('Teacher not found');
      } else {
        print('Error: $error');
      }
    },
  );
}
```

#### Building a Teacher Profile Page

```dart
class TeacherProfilePage extends StatefulWidget {
  final int teacherId;
  
  TeacherProfilePage({required this.teacherId});
  
  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  final teacherProfileRepository = getIt<TeacherProfileRepository>();
  
  bool _isLoading = false;
  TeacherProfileWithSeriesDTO? _profile;
  String? _error;
  
  @override
  void initState() {
    super.initState();
    _loadProfile();
  }
  
  Future<void> _loadProfile() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    
    final result = await teacherProfileRepository.getTeacherProfile(
      widget.teacherId,
    );
    
    result.fold(
      (profile) {
        setState(() {
          _profile = profile;
          _isLoading = false;
        });
      },
      (error) {
        setState(() {
          _error = error;
          _isLoading = false;
        });
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Teacher Profile')),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: Text('Teacher Profile')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.red),
              SizedBox(height: 16),
              Text(_error!),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadProfile,
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }
    
    if (_profile == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Teacher Profile')),
        body: Center(child: Text('No data')),
      );
    }
    
    final teacher = _profile!.teacher;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Banner
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(teacher.name),
              background: teacher.bannerImage != null
                  ? Image.network(teacher.bannerImage!, fit: BoxFit.cover)
                  : Container(color: Colors.blue),
            ),
          ),
          
          // Profile Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Profile Image
                Transform.translate(
                  offset: Offset(0, -50),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: teacher.profileImage != null
                        ? NetworkImage(teacher.profileImage!)
                        : null,
                    child: teacher.profileImage == null
                        ? Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
                
                // Title & Institution
                if (teacher.title != null)
                  Text(
                    teacher.title!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                if (teacher.institution != null)
                  Text(teacher.institution!),
                
                SizedBox(height: 16),
                
                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat('Rating', '${teacher.rating ?? 0}/5'),
                    _buildStat('Students', '${teacher.totalStudents ?? 0}'),
                    _buildStat('Courses', '${teacher.totalCourses ?? 0}'),
                    _buildStat('Experience', '${teacher.yearsExperience ?? 0}y'),
                  ],
                ),
                
                SizedBox(height: 24),
                
                // Bio
                if (teacher.bio != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(teacher.bio!),
                  ),
                
                SizedBox(height: 24),
                
                // Social Links
                _buildSocialLinks(teacher),
                
                SizedBox(height: 24),
                
                // Series and Courses
                ..._profile!.series.map((series) => _buildSeriesCard(series)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
  
  Widget _buildSocialLinks(TeacherDetailsDTO teacher) {
    final links = <String, String?>{
      'YouTube': teacher.youtube,
      'Facebook': teacher.facebook,
      'Instagram': teacher.instagram,
      'Twitter': teacher.twitter,
      'LinkedIn': teacher.linkedin,
      'Website': teacher.website,
    };
    
    final activeLinks = links.entries.where((e) => e.value != null).toList();
    
    if (activeLinks.isEmpty) return SizedBox.shrink();
    
    return Wrap(
      spacing: 8,
      children: activeLinks.map((entry) {
        return Chip(
          label: Text(entry.key),
          onDeleted: () {
            // Open link
          },
          deleteIcon: Icon(Icons.open_in_new),
        );
      }).toList(),
    );
  }
  
  Widget _buildSeriesCard(SeriesWithCoursesDTO series) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (series.thumbnail != null)
            Image.network(series.thumbnail!, height: 150, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  series.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (series.description != null)
                  Text(series.description!),
                SizedBox(height: 16),
                Text(
                  'Courses (${series.courses.length})',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...series.courses.map((course) => ListTile(
                  title: Text(course.name),
                  subtitle: Text('\$${course.price}'),
                  trailing: Text('⭐ ${course.rating}'),
                  onTap: () {
                    // Navigate to course details
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### Teacher Profile DTOs

#### TeacherDetailsDTO

Contains comprehensive teacher information:

```dart
class TeacherDetailsDTO {
  final int id;
  final String name;
  final String profileUrl;
  final String? phone;
  final String email;
  
  // Social Media
  final String? whatsapp;
  final String? telegram;
  final String? youtube;
  final String? facebook;
  final String? twitter;
  final String? linkedin;
  final String? instagram;
  final String? website;
  
  // Profile Information
  final String? bio;
  final String? title;
  final String? institution;
  final String? location;
  final DateTime? joinedDate;
  final bool? isVerified;
  
  // Statistics
  final double? rating;
  final int? totalStudents;
  final int? totalCourses;
  final int? yearsExperience;
  
  // Images
  final String? profileImage;
  final String? bannerImage;
  
  // Consultation
  final double? consultationFee;
  final String? currency;
  final String? timezone;
  final bool? isAvailable;
  final DateTime? nextAvailableSlot;
}
```

#### TeacherProfileWithSeriesDTO

Contains teacher details and all their series with courses:

```dart
class TeacherProfileWithSeriesDTO {
  final TeacherDetailsDTO teacher;
  final List<SeriesWithCoursesDTO> series;  // Already defined in Series models
}
```

**Note:** `SeriesWithCoursesDTO` and `CourseInSeriesDTO` are reused from the Series models.

---

## Error Handling

All repository methods return a `Result<T>` type that can be either `Ok(value)` or `Err(error)`.

### Basic Error Handling

```dart
final result = await playlistRepository.getPlaylists();

result.fold(
  (playlists) {
    // Success case
    print('Fetched ${playlists.length} playlists');
  },
  (error) {
    // Error case
    print('Error: $error');
  },
);
```

### Advanced Error Handling

```dart
Future<void> handleOperation() async {
  final result = await playlistRepository.createPlaylist(input);
  
  result.fold(
    (playlist) {
      // Success
      showSuccessMessage('Playlist created: ${playlist.name}');
      navigateToPlaylistDetails(playlist.id);
    },
    (error) {
      // Error
      if (error.contains('401') || error.contains('Unauthorized')) {
        showAuthError('Please log in again');
        navigateToLogin();
      } else if (error.contains('403') || error.contains('Forbidden')) {
        showError('You don\'t have permission to perform this action');
      } else if (error.contains('404')) {
        showError('Resource not found');
      } else {
        showError('An error occurred: $error');
      }
    },
  );
}
```

---

## Best Practices

### 1. Dependency Injection

Use a dependency injection framework (like `get_it`) to manage repository instances:

```dart
// In your DI setup file
final getIt = GetIt.instance;

void setupDependencies() {
  // Register services
  getIt.registerSingleton<ApiService>(ApiServiceImpl());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  
  // Register playlist repository
  getIt.registerSingleton<PlaylistRepository>(
    PlaylistRepositoryImpl(
      PlaylistServiceImpl(getIt<ApiService>()),
      getIt<UserRepository>(),
    ),
  );
  
  // Register series repository
  getIt.registerSingleton<SeriesRepository>(
    SeriesRepositoryImpl(
      SeriesServiceImpl(getIt<ApiService>()),
      getIt<UserRepository>(),
    ),
  );
  
  // Register teacher profile repository
  getIt.registerSingleton<TeacherProfileRepository>(
    TeacherProfileRepositoryImpl(
      TeacherProfileServiceImpl(getIt<ApiService>()),
    ),
  );
}

// Usage in widgets
class MyWidget extends StatelessWidget {
  final playlistRepository = getIt<PlaylistRepository>();
  
  @override
  Widget build(BuildContext context) {
    // Use playlistRepository...
  }
}
```

### 2. State Management Integration

#### With Provider:

```dart
class PlaylistProvider extends ChangeNotifier {
  final PlaylistRepository _repository;
  
  PlaylistProvider(this._repository);
  
  List<Playlist> _playlists = [];
  bool _isLoading = false;
  String? _error;
  
  List<Playlist> get playlists => _playlists;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  Future<void> fetchPlaylists() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    final result = await _repository.getPlaylists();
    
    result.fold(
      (playlists) {
        _playlists = playlists;
        _isLoading = false;
        notifyListeners();
      },
      (error) {
        _error = error;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
```

#### With Riverpod:

```dart
final playlistRepositoryProvider = Provider<PlaylistRepository>((ref) {
  return PlaylistRepositoryImpl(
    PlaylistServiceImpl(ref.read(apiServiceProvider)),
    ref.read(userRepositoryProvider),
  );
});

final playlistsProvider = FutureProvider<List<Playlist>>((ref) async {
  final repository = ref.read(playlistRepositoryProvider);
  final result = await repository.getPlaylists();
  
  return result.fold(
    (playlists) => playlists,
    (error) => throw Exception(error),
  );
});
```

### 3. Loading States

Always show loading indicators while fetching data:

```dart
class PlaylistListWidget extends StatefulWidget {
  @override
  _PlaylistListWidgetState createState() => _PlaylistListWidgetState();
}

class _PlaylistListWidgetState extends State<PlaylistListWidget> {
  final playlistRepository = getIt<PlaylistRepository>();
  bool isLoading = false;
  List<Playlist>? playlists;
  String? error;
  
  @override
  void initState() {
    super.initState();
    _loadPlaylists();
  }
  
  Future<void> _loadPlaylists() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    
    final result = await playlistRepository.getPlaylists();
    
    result.fold(
      (data) {
        setState(() {
          playlists = data;
          isLoading = false;
        });
      },
      (err) {
        setState(() {
          error = err;
          isLoading = false;
        });
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            ElevatedButton(
              onPressed: _loadPlaylists,
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      itemCount: playlists?.length ?? 0,
      itemBuilder: (context, index) {
        final playlist = playlists![index];
        return ListTile(
          title: Text(playlist.name),
          subtitle: Text(playlist.description ?? ''),
        );
      },
    );
  }
}
```

### 4. Caching

Consider implementing caching for frequently accessed data:

```dart
class CachedPlaylistRepository implements PlaylistRepository {
  final PlaylistRepository _repository;
  final Map<int, Playlist> _cache = {};
  
  CachedPlaylistRepository(this._repository);
  
  @override
  Future<Result<Playlist>> getPlaylist(int playlistId) async {
    // Check cache first
    if (_cache.containsKey(playlistId)) {
      return Result.ok(_cache[playlistId]!);
    }
    
    // Fetch from repository
    final result = await _repository.getPlaylist(playlistId);
    
    result.fold(
      (playlist) {
        _cache[playlistId] = playlist;
      },
      (_) {},
    );
    
    return result;
  }
  
  // Implement other methods...
}
```

---

## Complete Example: Building a Playlist Manager

Here's a complete example of a playlist management screen:

```dart
import 'package:flutter/material.dart';
import 'package:poruaa_core/poruaa_core.dart';

class PlaylistManagerScreen extends StatefulWidget {
  @override
  _PlaylistManagerScreenState createState() => _PlaylistManagerScreenState();
}

class _PlaylistManagerScreenState extends State<PlaylistManagerScreen> {
  final PlaylistRepository _playlistRepository = getIt<PlaylistRepository>();
  
  bool _isLoading = false;
  List<Playlist> _playlists = [];
  String? _error;
  
  @override
  void initState() {
    super.initState();
    _loadPlaylists();
  }
  
  Future<void> _loadPlaylists() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    
    final result = await _playlistRepository.getPlaylists();
    
    result.fold(
      (playlists) {
        setState(() {
          _playlists = playlists;
          _isLoading = false;
        });
      },
      (error) {
        setState(() {
          _error = error;
          _isLoading = false;
        });
      },
    );
  }
  
  Future<void> _createPlaylist() async {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Playlist'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final input = CreatePlaylistInput(
                name: nameController.text,
                description: descController.text,
              );
              
              final result = await _playlistRepository.createPlaylist(input);
              
              result.fold(
                (_) {
                  Navigator.pop(context, true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Playlist created!')),
                  );
                },
                (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $error')),
                  );
                },
              );
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
    
    if (result == true) {
      _loadPlaylists();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Playlists'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPlaylist,
        child: Icon(Icons.add),
      ),
    );
  }
  
  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red),
            SizedBox(height: 16),
            Text('Error: $_error'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadPlaylists,
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }
    
    if (_playlists.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.playlist_play, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('No playlists yet'),
            SizedBox(height: 8),
            Text('Tap + to create your first playlist'),
          ],
        ),
      );
    }
    
    return ListView.builder(
      itemCount: _playlists.length,
      itemBuilder: (context, index) {
        final playlist = _playlists[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: playlist.thumbnail != null
                ? Image.network(playlist.thumbnail!, width: 60, height: 60)
                : Icon(Icons.playlist_play, size: 40),
            title: Text(playlist.name),
            subtitle: Text(playlist.description ?? 'No description'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                // Navigate to playlist details
              },
            ),
          ),
        );
      },
    );
  }
}
```

---

## Support

For issues or questions, please refer to the main project documentation or contact the development team.

---

**Last Updated:** November 2025

