class DriverOrderResponse {
  int? id;
  String? serialNumber;
  int? statusId;
  String? statusName;
  num? deliveryPrice;
  num? totalPrice;
  num? finalDeliveryPrice;
  List<String>? places;
  String? destinationAddressTitle;

  // OrderResponse.i? Card():COntainer()
  // i(){
  //  if(this.places.where((element) => element.id = 5)){
  //    this.places.add(value)
  //  }
  // }

  DriverOrderResponse(
      {this.id,
        this.serialNumber,
        this.statusId,
        this.statusName,
        this.deliveryPrice,
        this.totalPrice,
        this.finalDeliveryPrice,
        this.places,
        this.destinationAddressTitle});

  DriverOrderResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serialNumber = json['serialNumber'];
    statusId = json['statusId'];
    statusName = json['statusName'];
    deliveryPrice = json['deliveryPrice'];
    totalPrice = json['totalPrice'];
    finalDeliveryPrice = json['finalDeliveryPrice'];
    places = json['places'].cast<String>();
    destinationAddressTitle = json['destinationAddressTitle'];
  }

}
