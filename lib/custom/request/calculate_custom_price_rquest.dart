class CalculateCustomPrice {
  int? fromAddressId;
  int? toAddressId;

  CalculateCustomPrice({this.fromAddressId, this.toAddressId});
  Map<String, dynamic> toJson() {
    return {
      'fromAddressId': fromAddressId,
      'toAddressId': toAddressId,
    };
  }
}