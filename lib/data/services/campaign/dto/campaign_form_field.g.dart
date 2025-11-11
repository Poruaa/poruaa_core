// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_form_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignFormField _$CampaignFormFieldFromJson(Map<String, dynamic> json) =>
    CampaignFormField(
      type: json['type'] as String,
      label: json['label'] as String,
      description: json['description'] as String?,
      placeholder: json['placeholder'] as String?,
      required: json['required'] as bool?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CampaignFormFieldToJson(CampaignFormField instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'description': instance.description,
      'placeholder': instance.placeholder,
      'required': instance.required,
      'options': instance.options,
    };
