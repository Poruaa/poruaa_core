import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/domain/models/teacher_organization/teacher_member.dart';
import 'package:poruaa_core/domain/models/teacher_organization/add_teacher_member_request.dart';
import 'package:poruaa_core/data/services/teacher_organization/teacher_organization_service.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class TeacherOrganizationRepository {
  Future<Result<List<TeacherMember>>> getOrganizationMembers();
  Future<Result<TeacherMember>> addMember(AddTeacherMemberRequest request);
  Future<Result<bool>> removeMember(int memberTeacherId);
  Future<Result<List<TeacherMember>>> getMyOrganizations();
}

class TeacherOrganizationRepositoryImpl
    implements TeacherOrganizationRepository {
  final TeacherOrganizationService _service;
  final UserRepository _userRepository;
  TeacherOrganizationRepositoryImpl(this._service, this._userRepository);

  @override
  Future<Result<List<TeacherMember>>> getOrganizationMembers() async {
    return await _service.getOrganizationMembers(
      _userRepository.getCurrentUserId,
    );
  }

  @override
  Future<Result<TeacherMember>> addMember(
    AddTeacherMemberRequest request,
  ) async {
    return await _service.addMember(_userRepository.getCurrentUserId, request);
  }

  @override
  Future<Result<bool>> removeMember(int memberTeacherId) async {
    return await _service.removeMember(
      _userRepository.getCurrentUserId,
      memberTeacherId,
    );
  }

  @override
  Future<Result<List<TeacherMember>>> getMyOrganizations() async {
    return await _service.getMyOrganizations(_userRepository.getCurrentUserId);
  }
}
