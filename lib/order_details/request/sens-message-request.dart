class SendMessageRequest {
  int? MessageTypeId;
  bool? IsFromAdmin;
  int? OrderId;
  String? Message;

  SendMessageRequest(
      {required this.IsFromAdmin,
      required this.Message,
      required this.MessageTypeId,
      required this.OrderId});

  Map<String, dynamic> toJson() {
    return {
      'MessageTypeId': MessageTypeId,
      'IsFromAdmin': IsFromAdmin,
      'OrderId': OrderId,
      'Message': Message,
    };
  }
}
