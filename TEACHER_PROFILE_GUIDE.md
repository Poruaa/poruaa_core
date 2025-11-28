# Teacher Profile API Reference

Complete reference for integrating the Teacher Profile feature from the `poruaa_core` package.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Setup](#setup)
- [API Reference](#api-reference)
- [DTOs Reference](#dtos-reference)
- [Usage](#usage)
- [Error Handling](#error-handling)

---

## Overview

The Teacher Profile endpoint provides a comprehensive view of a teacher's profile including all their series and courses in a single API call.

**Endpoint:** `GET /teacher-profile/{teacher_id}/`

**Key Features:**
- ✅ Public endpoint (no authentication required)
- ✅ Single API call for complete profile data
- ✅ Teacher information, statistics, and social media links
- ✅ All series and courses organized by teacher
- ✅ Real-time data (no caching)
- ✅ Teacher availability and consultation information

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  poruaa_core:
    path: ../poruaa_core
```

```bash
flutter pub get
```

---

## Setup

### Import Package

```dart
import 'package:poruaa_core/poruaa_core.dart';
```

### Initialize Repository

```dart
final ApiService apiService = ApiServiceImpl(/* config */);

final teacherProfileRepository = TeacherProfileRepositoryImpl(
  TeacherProfileServiceImpl(apiService),
);
```

### With Dependency Injection (get_it)

```dart
getIt.registerSingleton<TeacherProfileRepository>(
  TeacherProfileRepositoryImpl(
    TeacherProfileServiceImpl(getIt<ApiService>()),
  ),
);
```

---

## API Reference

### Get Teacher Profile

```dart
Future<Result<TeacherProfileWithSeriesDTO>> getTeacherProfile(int teacherId)
```

**Parameters:**
- `teacherId` (int) - The ID of the teacher

**Returns:**
- `Result<TeacherProfileWithSeriesDTO>` - Result type containing either profile data or error

**Response Codes:**
- `200 OK` - Teacher profile retrieved successfully
- `404 Not Found` - Teacher not found

---

## DTOs Reference

### TeacherDetailsDTO

Complete teacher information with all fields.

```dart
class TeacherDetailsDTO {
  // Required Fields
  final int id;
  final String name;
  final String profileUrl;
  final String email;
  
  // Optional Contact
  final String? phone;
  
  // Optional Social Media
  final String? whatsapp;
  final String? telegram;
  final String? youtube;
  final String? facebook;
  final String? twitter;
  final String? linkedin;
  final String? instagram;
  final String? website;
  
  // Optional Profile Information
  final String? bio;
  final String? title;              // e.g., "Professor", "PhD"
  final String? institution;        // e.g., "MIT"
  final String? location;           // e.g., "New York, USA"
  final DateTime? joinedDate;
  final bool? isVerified;
  
  // Optional Statistics
  final double? rating;             // 0.0 - 5.0
  final int? totalStudents;
  final int? totalCourses;
  final int? yearsExperience;
  
  // Optional Images
  final String? profileImage;       // URL
  final String? bannerImage;        // URL
  
  // Optional Consultation
  final double? consultationFee;
  final String? currency;           // e.g., "USD"
  final String? timezone;           // e.g., "America/New_York"
  final bool? isAvailable;
  final DateTime? nextAvailableSlot;
}
```

**Field Descriptions:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `id` | int | Yes | Teacher's unique identifier |
| `name` | String | Yes | Teacher's full name |
| `profileUrl` | String | Yes | URL slug for teacher profile |
| `email` | String | Yes | Teacher's email address |
| `phone` | String? | No | Contact phone number |
| `whatsapp` | String? | No | WhatsApp contact |
| `telegram` | String? | No | Telegram username/link |
| `youtube` | String? | No | YouTube channel URL |
| `facebook` | String? | No | Facebook profile URL |
| `twitter` | String? | No | Twitter handle/URL |
| `linkedin` | String? | No | LinkedIn profile URL |
| `instagram` | String? | No | Instagram handle/URL |
| `website` | String? | No | Personal/professional website |
| `bio` | String? | No | Teacher biography/description |
| `title` | String? | No | Professional title (e.g., "Dr.", "Prof.") |
| `institution` | String? | No | Current institution/organization |
| `location` | String? | No | Geographic location |
| `joinedDate` | DateTime? | No | Platform join date |
| `isVerified` | bool? | No | Verification status |
| `rating` | double? | No | Average rating (0.0-5.0) |
| `totalStudents` | int? | No | Total number of students taught |
| `totalCourses` | int? | No | Total number of courses created |
| `yearsExperience` | int? | No | Years of teaching experience |
| `profileImage` | String? | No | Profile picture URL |
| `bannerImage` | String? | No | Banner/cover image URL |
| `consultationFee` | double? | No | Consultation fee amount |
| `currency` | String? | No | Fee currency code |
| `timezone` | String? | No | Teacher's timezone |
| `isAvailable` | bool? | No | Current availability status |
| `nextAvailableSlot` | DateTime? | No | Next available consultation time |

### TeacherProfileWithSeriesDTO

Main response structure combining teacher details and series.

```dart
class TeacherProfileWithSeriesDTO {
  final TeacherDetailsDTO teacher;
  final List<SeriesWithCoursesDTO> series;
}
```

**Properties:**
- `teacher` - Complete teacher information (TeacherDetailsDTO)
- `series` - List of all series with their courses (SeriesWithCoursesDTO)

### SeriesWithCoursesDTO

Series information with all associated courses (reused from Series models).

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

### CourseInSeriesDTO

Detailed course information within a series (reused from Series models).

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
  final String courseUrl;
}
```

---

## Usage

### Basic Usage

```dart
Future<void> fetchTeacherProfile(int teacherId) async {
  final result = await teacherProfileRepository.getTeacherProfile(teacherId);
  
  result.fold(
    (profile) {
      // Success - access teacher data
      final teacher = profile.teacher;
      print('Teacher: ${teacher.name}');
      print('Email: ${teacher.email}');
      print('Rating: ${teacher.rating ?? 0}/5');
      print('Students: ${teacher.totalStudents ?? 0}');
      print('Series: ${profile.series.length}');
    },
    (error) {
      // Error occurred
      print('Error: $error');
    },
  );
}
```

### Accessing Teacher Information

```dart
final teacher = profile.teacher;

// Basic information
final name = teacher.name;
final email = teacher.email;
final bio = teacher.bio;

// Statistics
final rating = teacher.rating ?? 0.0;
final totalStudents = teacher.totalStudents ?? 0;
final totalCourses = teacher.totalCourses ?? 0;
final experience = teacher.yearsExperience ?? 0;

// Verification
final isVerified = teacher.isVerified ?? false;

// Social media (check for null)
if (teacher.youtube != null) {
  final youtubeUrl = teacher.youtube!;
}
if (teacher.facebook != null) {
  final facebookUrl = teacher.facebook!;
}

// Availability
final isAvailable = teacher.isAvailable ?? false;
if (teacher.nextAvailableSlot != null) {
  final nextSlot = teacher.nextAvailableSlot!;
}

// Consultation
if (teacher.consultationFee != null) {
  final fee = teacher.consultationFee!;
  final currency = teacher.currency ?? 'USD';
}
```

### Accessing Series and Courses

```dart
final series = profile.series;

for (final s in series) {
  print('Series: ${s.name}');
  print('Description: ${s.description ?? "No description"}');
  print('Courses: ${s.courses.length}');
  
  for (final course in s.courses) {
    print('  - ${course.name}');
    print('    Price: \$${course.price}');
    print('    Rating: ${course.rating}/5');
    print('    Students: ${course.enrollmentCount}');
    print('    Exams: ${course.examCount}');
    print('    Materials: ${course.materialCount}');
  }
}
```

### Using with FutureBuilder

```dart
FutureBuilder<Result<TeacherProfileWithSeriesDTO>>(
  future: teacherProfileRepository.getTeacherProfile(teacherId),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    
    if (!snapshot.hasData) {
      return Text('No data');
    }
    
    return snapshot.data!.fold(
      (profile) => YourProfileWidget(profile: profile),
      (error) => Text('Error: $error'),
    );
  },
)
```

---

## Error Handling

### Basic Error Handling

```dart
result.fold(
  (profile) {
    // Success
    handleSuccess(profile);
  },
  (error) {
    // Error - check error message
    if (error.contains('Teacher not found') || error.contains('404')) {
      handleNotFound();
    } else if (error.contains('network') || error.contains('connection')) {
      handleNetworkError();
    } else {
      handleGenericError(error);
    }
  },
);
```

### Error Types

| Error Message | Description | Recommended Action |
|--------------|-------------|-------------------|
| "Teacher not found" | Teacher ID doesn't exist | Show "Teacher not found" message |
| Contains "404" | Resource not found | Same as above |
| Contains "network" | Network connectivity issue | Show "Check internet connection" |
| Contains "connection" | Connection error | Retry with exponential backoff |
| Other | Unknown error | Show generic error message, log for debugging |

### State Management Pattern

```dart
// Loading state
bool isLoading = false;
TeacherProfileWithSeriesDTO? profile;
String? error;

Future<void> loadProfile(int teacherId) async {
  isLoading = true;
  error = null;
  notifyListeners(); // or setState
  
  final result = await repository.getTeacherProfile(teacherId);
  
  result.fold(
    (data) {
      profile = data;
      isLoading = false;
      notifyListeners(); // or setState
    },
    (err) {
      error = err;
      isLoading = false;
      notifyListeners(); // or setState
    },
  );
}
```

---

## Notes

### Important Considerations

1. **No Authentication Required** - This is a public endpoint, anyone can access teacher profiles
2. **No Caching** - Data is fetched fresh on each request. Implement your own caching if needed
3. **Optional Fields** - Always check for null before using optional fields
4. **Series Order** - Series are ordered by `order_index` (ascending)
5. **Course Order** - Courses within series are ordered by `order_index` (ascending)
6. **Empty Arrays** - If teacher has no series, `series` array will be empty
7. **Social Media** - Check each social media field for null before displaying

### Caching Strategy

Since this endpoint has no built-in caching, consider implementing your own:

```dart
class CachedTeacherProfileRepository {
  final Map<int, TeacherProfileWithSeriesDTO> _cache = {};
  final Map<int, DateTime> _cacheTime = {};
  final Duration cacheDuration = Duration(minutes: 10);
  
  Future<Result<TeacherProfileWithSeriesDTO>> getTeacherProfile(
    int teacherId,
  ) async {
    // Check cache validity
    if (_cache.containsKey(teacherId)) {
      final time = _cacheTime[teacherId]!;
      if (DateTime.now().difference(time) < cacheDuration) {
        return Result.ok(_cache[teacherId]!);
      }
    }
    
    // Fetch and update cache
    final result = await _repository.getTeacherProfile(teacherId);
    result.fold(
      (profile) {
        _cache[teacherId] = profile;
        _cacheTime[teacherId] = DateTime.now();
      },
      (_) {},
    );
    
    return result;
  }
}
```

### Null Safety Best Practices

```dart
// Safe access patterns
String getTitle(TeacherDetailsDTO teacher) {
  return teacher.title ?? 'Teacher';
}

String getRating(TeacherDetailsDTO teacher) {
  final rating = teacher.rating ?? 0.0;
  return '$rating/5';
}

bool hasSocialMedia(TeacherDetailsDTO teacher) {
  return teacher.youtube != null ||
         teacher.facebook != null ||
         teacher.instagram != null ||
         teacher.twitter != null ||
         teacher.linkedin != null;
}

bool canBookConsultation(TeacherDetailsDTO teacher) {
  return teacher.isAvailable == true && 
         teacher.consultationFee != null;
}
```

---

## Support

For issues, questions, or feature requests, please refer to the main project documentation or contact the development team.

---

**Last Updated:** November 2025
