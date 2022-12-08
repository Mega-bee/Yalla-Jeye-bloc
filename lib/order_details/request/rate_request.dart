class RateRequest {
  int orderId ;
  num rating;

  RateRequest({required this.orderId,required this.rating});

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'rating': rating,
    };
  }
}