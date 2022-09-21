class CustomOrderRequest {
 int? FromAddressId;
 int? DestinationAddressId;
 String? Description;

 CustomOrderRequest({this.Description,this.DestinationAddressId,this.FromAddressId});

  Map<String, dynamic> toJson() {
    return {
      'FromAddressId': FromAddressId,
      'DestinationAddressId': DestinationAddressId,
      'Description': Description,
    };
  }

}