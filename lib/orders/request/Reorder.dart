class ReorderRequest {
  int? orderId;

  ReorderRequest({this.orderId});

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
    };
  }

}