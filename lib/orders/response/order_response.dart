class OrderResponse {
  int? id;
  String? serialNumber;
  int? statusId;
  String? statusName;
  num? deliveryPrice;
  num? totalPrice;
  num? finalDeliveryPrice;
  List<String>? places;
  String? destinationAddressTitle;
  bool  isCustom = false;

  // OrderResponse.i? Card():COntainer()
  // i(){
  //  if(this.places.where((element) => element.id = 5)){
  //    this.places.add(value)
  //  }
  // }

  OrderResponse(
      {this.id,
        this.serialNumber,
        this.statusId,
        this.statusName,
        this.deliveryPrice,
        this.totalPrice,
        this.finalDeliveryPrice,
        this.places,
        this.destinationAddressTitle,
      required this.isCustom});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serialNumber = json['serialNumber'];
    statusId = json['statusId'];
    statusName = json['statusName'];
    deliveryPrice = json['deliveryPrice'];
    totalPrice = json['totalPrice'];
    finalDeliveryPrice = json['finalDeliveryPrice'];
    places = json['places'].cast<String>();
    destinationAddressTitle = json['destinationAddressTitle'];
    isCustom = json['isCustom'];

  }

}
