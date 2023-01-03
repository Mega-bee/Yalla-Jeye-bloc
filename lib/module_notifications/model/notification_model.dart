import 'dart:convert';
import 'dart:developer';

class RemoteNotificationModel {
  String? orderId;
  RemoteNotificationModel({this.orderId,});
  RemoteNotificationModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
  }
}
