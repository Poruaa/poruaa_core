class SendMessageInputDto {
  final String message;

  SendMessageInputDto({required this.message});

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
