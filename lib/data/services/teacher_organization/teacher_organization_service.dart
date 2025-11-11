import 'dart:convert';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/domain/models/teacher_organization/teacher_member.dart';
import 'package:poruaa_core/domain/models/teacher_organization/add_teacher_member_request.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class TeacherOrganizationService {
  Future<Result<List<TeacherMember>>> getOrganizationMembers(int teacherId);
  Future<Result<TeacherMember>> addMember(
    int teacherId,
    AddTeacherMemberRequest request,
  );
  Future<Result<bool>> removeMember(int teacherId, int memberTeacherId);
  Future<Result<List<TeacherMember>>> getMyOrganizations(int teacherId);
}

class TeacherOrganizationServiceImpl implements TeacherOrganizationService {
  final AuthorizedApiService _authorizedApiService;

  TeacherOrganizationServiceImpl(this._authorizedApiService);

  @override
  Future<Result<List<TeacherMember>>> getOrganizationMembers(
    int teacherId,
  ) async {
    try {
      final response = await _authorizedApiService.get(
        'teachers/$teacherId/members',
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            final List<dynamic> jsonList = jsonDecode(value.body);
            final members = jsonList
                .map(
                  (json) =>
                      TeacherMember.fromJson(json as Map<String, dynamic>),
                )
                .toList();
            return Ok(members);
          } else {
            // Return the actual server response body for error message
            return Err(value.body);
          }
        case Err():
          return Err('Network error while fetching organization members');
      }
    } catch (e) {
      return Err('Error getting organization members: $e');
    }
  }

  @override
  Future<Result<TeacherMember>> addMember(
    int teacherId,
    AddTeacherMemberRequest request,
  ) async {
    try {
      final response = await _authorizedApiService.post(
        'teachers/$teacherId/members',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 201) {
            final member = TeacherMember.fromJson(
              jsonDecode(value.body) as Map<String, dynamic>,
            );
            return Ok(member);
          } else {
            // Return the actual server response body for error message
            return Err(value.body);
          }
        case Err():
          return Err('Network error while adding member');
      }
    } catch (e) {
      return Err('Error adding member: $e');
    }
  }

  @override
  Future<Result<bool>> removeMember(int teacherId, int memberTeacherId) async {
    try {
      final response = await _authorizedApiService.delete(
        'teachers/$teacherId/members/$memberTeacherId',
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            return Ok(true);
          } else {
            // Return the actual server response body for error message
            return Err(value.body);
          }
        case Err():
          return Err('Network error while removing member');
      }
    } catch (e) {
      return Err('Error removing member: $e');
    }
  }

  @override
  Future<Result<List<TeacherMember>>> getMyOrganizations(int teacherId) async {
    try {
      final response = await _authorizedApiService.get(
        'teachers/$teacherId/organizations',
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            final List<dynamic> jsonList = jsonDecode(value.body);
            final organizations = jsonList
                .map(
                  (json) =>
                      TeacherMember.fromJson(json as Map<String, dynamic>),
                )
                .toList();
            return Ok(organizations);
          } else {
            // Return the actual server response body for error message
            return Err(value.body);
          }
        case Err():
          return Err('Network error while fetching my organizations');
      }
    } catch (e) {
      return Err('Error getting my organizations: $e');
    }
  }
}
