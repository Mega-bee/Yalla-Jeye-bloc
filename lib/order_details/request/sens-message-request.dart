import 'package:dio/dio.dart';

class SendMessageRequest {
  MultipartFile? attachment; // private field
  int? MessageTypeId;
  bool? IsFromAdmin;
  int? OrderId;
  String? Message;
  MultipartFile? audiofile;

  SendMessageRequest({
    required this.IsFromAdmin,
    required this.Message,
    required this.MessageTypeId,
    required this.OrderId,
    this.audiofile,
    this.attachment,
  });

  Map<String, dynamic> toJson() {
    return {
      'MessageTypeId': MessageTypeId,
      'IsFromAdmin': IsFromAdmin,
      'OrderId': OrderId,
      'Message': Message,
      'AudioFile': audiofile,
      'attachment': attachment,
    };
  }
}
