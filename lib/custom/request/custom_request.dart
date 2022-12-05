class CustomOrderRequest {
 int? FromAddressId;
 int? DestinationAddressId;
 String? Description;
 String? promoCode;

 CustomOrderRequest({this.Description,this.DestinationAddressId,this.FromAddressId ,this.promoCode});

  Map<String, dynamic> toJson() {
    return {
      'FromAddressId': FromAddressId,
      'DestinationAddressId': DestinationAddressId,
      'Description': Description,
      'promoCode': promoCode,
    };
  }

}