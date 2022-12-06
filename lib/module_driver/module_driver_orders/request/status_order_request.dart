class StatusOrderRequest {
  int? orderId;
  int? statusId;

  StatusOrderRequest({this.orderId, required this.statusId});

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'statusId': statusId,
    };
  }
}
