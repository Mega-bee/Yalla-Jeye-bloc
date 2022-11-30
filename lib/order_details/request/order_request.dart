class ChangeOrderPriceRequest {
  int? orderId;

  ChangeOrderPriceRequest({this.orderId});

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
    };
  }

}