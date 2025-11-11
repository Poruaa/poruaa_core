import 'package:json_annotation/json_annotation.dart';

part 'campaign_form_field.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CampaignFormField {
  final String type;
  final String label;
  final String? description;
  final String? placeholder;
  final bool? required;
  final List<String>? options;

  const CampaignFormField({
    required this.type,
    required this.label,
    this.description,
    this.placeholder,
    this.required,
    this.options,
  });

  factory CampaignFormField.fromJson(Map<String, dynamic> json) =>
      _$CampaignFormFieldFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignFormFieldToJson(this);
}
