import 'package:poruaa_core/data/services/campaign/campaign_service.dart';
import 'package:poruaa_core/data/services/campaign/dto/campaign_dto.dart';
import 'package:poruaa_core/data/services/campaign/dto/campaign_exam_dto.dart';
import 'package:poruaa_core/data/services/campaign/dto/campaign_exam_result_dto.dart';
import 'package:poruaa_core/data/services/campaign/dto/campaign_exam_result_with_student_dto.dart';
import 'package:poruaa_core/data/services/campaign/dto/campaign_form_field.dart';
import 'package:poruaa_core/data/services/campaign/dto/campaign_participant_dto.dart';
import 'package:poruaa_core/data/services/campaign/dto/campaign_participant_with_student_dto.dart';
import 'package:poruaa_core/data/services/campaign/dto/create_campaign_dto.dart';
import 'package:poruaa_core/data/services/campaign/dto/update_campaign_dto.dart';
import 'package:poruaa_core/data/services/course_exam/model/publish_ranks_response.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';

class CampaignRepository {
  final CampaignService _campaignService;

  CampaignRepository(this._campaignService);

  Future<Result<List<CampaignDto>>> getCampaigns(int teacherId) async {
    return await _campaignService.getCampaigns(teacherId);
  }

  Future<Result<CampaignDto>> createCampaign(
    int teacherId,
    CreateCampaignDto campaign,
  ) async {
    return await _campaignService.createCampaign(teacherId, campaign);
  }

  Future<Result<CampaignDto>> getCampaignById(int campaignId) async {
    return await _campaignService.getCampaignById(campaignId);
  }

  Future<Result<CampaignDto>> updateCampaign(
    int teacherId,
    int campaignId,
    UpdateCampaignDto campaign,
  ) async {
    return await _campaignService.updateCampaign(
      campaignId,
      teacherId,
      campaign,
    );
  }

  Future<Result<bool>> deleteCampaign(int teacherId, int campaignId) async {
    return await _campaignService.deleteCampaign(teacherId, campaignId);
  }

  Future<Result<CampaignDto>> updateCampaignWithFormFields(
    int teacherId,
    int campaignId,
    List<CampaignFormField> formFields,
  ) async {
    return await _campaignService.updateCampaignWithFormFields(
      teacherId,
      campaignId,
      formFields,
    );
  }

  Future<Result<PaginatedResponse<CampaignDto>>> getCampaignsPaginated(
    PaginationParams params,
  ) async {
    return await _campaignService.getCampaignsPaginated(params);
  }

  Future<Result<CampaignDto>> getCampaignWithStudentParticipant(
    int campaignId,
  ) async {
    return await _campaignService.getCampaignWithStudentParticipant(campaignId);
  }

  Future<Result<CampaignParticipantDto>> submitCampaignParticipant(
    int campaignId,
    Map<String, dynamic> formData,
  ) async {
    return await _campaignService.submitCampaignParticipant(
      campaignId,
      formData,
    );
  }

  // Student Campaign Exam Methods

  Future<Result<CampaignExamDto>> startCampaignExam(int campaignId) async {
    return await _campaignService.startCampaignExam(campaignId);
  }

  Future<Result<CampaignExamResultDto>> submitCampaignExam(
    int campaignId,
    Map<int, int> answers,
  ) async {
    return await _campaignService.submitCampaignExam(campaignId, answers);
  }

  Future<Result<CampaignExamResultDto>> getCampaignExamResult(
    int campaignId,
  ) async {
    return await _campaignService.getCampaignExamResult(campaignId);
  }

  // Teacher Campaign Exam Methods

  Future<Result<List<CampaignExamResultWithStudentDto>>> getCampaignExamResults(
    int teacherId,
    int campaignId,
  ) async {
    return await _campaignService.getCampaignExamResults(teacherId, campaignId);
  }

  Future<Result<PublishRanksResponse>> publishCampaignExamRanks(
    int teacherId,
    int campaignId,
  ) async {
    return await _campaignService.publishCampaignExamRanks(
      teacherId,
      campaignId,
    );
  }

  Future<Result<List<CampaignParticipantWithStudentDto>>>
  getCampaignParticipants(int teacherId, int campaignId) async {
    return await _campaignService.getCampaignParticipants(
      teacherId,
      campaignId,
    );
  }
}
