class CalculateCustomPrice {
  int? fromAddressId;
  int? toAddressId;
  String? promoCode;

  CalculateCustomPrice({this.fromAddressId, this.toAddressId , this.promoCode});
  Map<String, dynamic> toJson() {
    return {
      'fromAddressId': fromAddressId,
      'toAddressId': toAddressId,
      'promoCode': promoCode,
    };
  }
}