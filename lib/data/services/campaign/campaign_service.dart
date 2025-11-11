import 'dart:convert';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
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

class CampaignService {
  final AuthorizedApiService _apiService;

  CampaignService(AuthorizedApiService apiService) : _apiService = apiService;

  Future<Result<List<CampaignDto>>> getCampaigns(int teacherId) async {
    var result = await _apiService.get('teachers/$teacherId/campaigns');
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        var json = jsonDecode(result.value.body);
        if (json is! List) {
          return Result.error("Parse error");
        }
        return Result.ok(json.map((e) => CampaignDto.fromJson(e)).toList());
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<CampaignDto>> getCampaignById(int campaignId) async {
    var result = await _apiService.get('campaigns/$campaignId');
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(CampaignDto.fromJson(jsonDecode(result.value.body)));
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<CampaignDto>> createCampaign(
    int teacherId,
    CreateCampaignDto campaign,
  ) async {
    var json = jsonEncode(campaign.toJson());
    var result = await _apiService.post(
      'teachers/$teacherId/campaigns',
      headers: {"Content-Type": "application/json"},
      body: json,
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(CampaignDto.fromJson(jsonDecode(result.value.body)));
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<CampaignDto>> updateCampaign(
    int campaignId,
    int teacherId,
    UpdateCampaignDto campaign,
  ) async {
    var json = jsonEncode(campaign.toJson());
    var result = await _apiService.put(
      'teachers/$teacherId/campaigns/$campaignId',
      headers: {"Content-Type": "application/json"},
      body: json,
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(CampaignDto.fromJson(jsonDecode(result.value.body)));
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<bool>> deleteCampaign(int teacherId, int campaignId) async {
    var result = await _apiService.delete(
      'teachers/$teacherId/campaigns/$campaignId',
      headers: {"Content-Type": "application/json"},
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(true);
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<CampaignDto>> updateCampaignWithFormFields(
    int teacherId,
    int campaignId,
    List<CampaignFormField> formFields,
  ) async {
    var json = jsonEncode({"form_fields": formFields});
    var result = await _apiService.put(
      'teachers/$teacherId/campaigns/$campaignId/form-fields',
      headers: {"Content-Type": "application/json"},
      body: json,
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(CampaignDto.fromJson(jsonDecode(result.value.body)));
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<PaginatedResponse<CampaignDto>>> getCampaignsPaginated(
    PaginationParams params,
  ) async {
    // Build query parameters
    final queryParams = <String, String>{'limit': params.limit.toString()};

    if (params.cursor != null) {
      queryParams['cursor'] = params.cursor!;
    }

    final queryString = queryParams.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');

    var result = await _apiService.get("campaigns/paginated?$queryString");
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);

        if (jsonBody is Map<String, dynamic>) {
          var items = (jsonBody['items'] as List)
              .map((e) => CampaignDto.fromJson(e))
              .toList();

          var paginatedResponse = PaginatedResponse<CampaignDto>(
            items: items,
            nextCursor: jsonBody['next_cursor'] as String?,
            hasMore: jsonBody['has_more'] as bool? ?? false,
            total: jsonBody['total'] as int? ?? 0,
          );

          return Result.ok(paginatedResponse);
        } else {
          return Result.error("Parse error");
        }
      case Err():
        return Result.error("error");
    }
  }

  Future<Result<CampaignDto>> getCampaignWithStudentParticipant(
    int campaignId,
  ) async {
    var result = await _apiService.get('students/me/campaigns/$campaignId');
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(CampaignDto.fromJson(jsonDecode(result.value.body)));
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<CampaignParticipantDto>> submitCampaignParticipant(
    int campaignId,
    Map<String, dynamic> formData,
  ) async {
    var json = jsonEncode({"form_data": formData});
    var result = await _apiService.post(
      'students/me/campaigns/$campaignId/participate',
      headers: {"Content-Type": "application/json"},
      body: json,
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(
          CampaignParticipantDto.fromJson(jsonDecode(result.value.body)),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  // Student Campaign Exam Methods

  Future<Result<CampaignExamDto>> startCampaignExam(int campaignId) async {
    var result = await _apiService.get(
      'students/me/campaigns/$campaignId/exam/start',
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(
          CampaignExamDto.fromJson(jsonDecode(result.value.body)),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<CampaignExamResultDto>> submitCampaignExam(
    int campaignId,
    Map<int, int> answers,
  ) async {
    var body = {
      "answers": answers.map((key, value) => MapEntry(key.toString(), value)),
    };
    var result = await _apiService.post(
      'students/me/campaigns/$campaignId/exam/submit',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(
          CampaignExamResultDto.fromJson(jsonDecode(result.value.body)),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<CampaignExamResultDto>> getCampaignExamResult(
    int campaignId,
  ) async {
    try {
      var result = await _apiService.get(
        'students/me/campaigns/$campaignId/exam/result',
      );
      switch (result) {
        case Ok(value: var response):
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          return Result.ok(
            CampaignExamResultDto.fromJson(jsonDecode(result.value.body)),
          );
        case Err():
          return Result.error(result.error);
      }
    } catch (e) {
      return Result.error(e);
    }
  }

  // Teacher Campaign Exam Methods

  Future<Result<List<CampaignExamResultWithStudentDto>>> getCampaignExamResults(
    int teacherId,
    int campaignId,
  ) async {
    var result = await _apiService.get(
      'teachers/$teacherId/campaigns/$campaignId/exam/results',
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        var json = jsonDecode(result.value.body);
        if (json is! List) {
          return Result.error("Parse error");
        }
        return Result.ok(
          json
              .map((e) => CampaignExamResultWithStudentDto.fromJson(e))
              .toList(),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<PublishRanksResponse>> publishCampaignExamRanks(
    int teacherId,
    int campaignId,
  ) async {
    var result = await _apiService.post(
      'teachers/$teacherId/campaigns/$campaignId/exam/publish-ranks',
      headers: {"Content-Type": "application/json"},
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        return Result.ok(
          PublishRanksResponse.fromJson(jsonDecode(result.value.body)),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<List<CampaignParticipantWithStudentDto>>>
  getCampaignParticipants(int teacherId, int campaignId) async {
    var result = await _apiService.get(
      'teachers/$teacherId/campaigns/$campaignId/participants',
    );
    switch (result) {
      case Ok(value: var response):
        if (response.statusCode != 200) {
          return Result.error(response.body);
        }
        var json = jsonDecode(result.value.body);
        if (json is! List) {
          return Result.error("Parse error");
        }
        return Result.ok(
          json
              .map((e) => CampaignParticipantWithStudentDto.fromJson(e))
              .toList(),
        );
      case Err():
        return Result.error(result.error);
    }
  }
}
