import 'dart:convert';
import 'dart:developer';

class RemoteNotificationModel {
  String? orderId;
  String? notificationTypeId;
  RemoteNotificationModel({this.orderId,this.notificationTypeId});
  RemoteNotificationModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    notificationTypeId = json['notificationTypeId'];
  }
}
