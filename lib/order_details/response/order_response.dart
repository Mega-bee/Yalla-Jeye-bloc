class OrderDetailsResponse {
  int? id;
  String? long;
  String? lat;
  int? statusId;
  String? statusName;
  bool  isCustom = false;
  List<PlacesDetails>? orderPlaces;
  num? totalDistance;
  num? totalPrice;
  CustomOrder? customOrder;
  bool  requiresRating = false;
  num? rating;


  OrderDetailsResponse({
    this.id,
    required this.long,
    required this.lat,
    this.statusId,
    this.statusName,
   required this.isCustom,
    this.orderPlaces,
    this.totalPrice,
    this.totalDistance,
    this.customOrder,
    this.rating,
   required this.requiresRating
  });

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['addressLatitude'];
    long = json['addressLongitude'];
    rating = json['rating'];
    requiresRating = json['requiresRating'];
    statusId = json['statusId'];
    statusName = json['statusName'];
    isCustom = json['isCustom'];
    totalDistance = json['totalDistance'];
    totalPrice = json['totalPrice'];
    if (json['orderPlaces'] != null) {
      orderPlaces = <PlacesDetails>[];
      json['orderPlaces'].forEach((v) {
        orderPlaces!.add( PlacesDetails.fromJson(v));
      });
    }
    if(json['customOrder'] != null){
      customOrder = CustomOrder.fromJson(json['customOrder']);
    }

  }
}

class CustomOrder {
  FromAddress? toAddress;
  FromAddress? fromAddress;
  String? description;

  CustomOrder({this.toAddress, this.fromAddress});

  CustomOrder.fromJson(Map<String, dynamic> json) {
    toAddress = json['toAddress'] != null
        ?   FromAddress.fromJson(json['toAddress'])
        : null;
    fromAddress = json['fromAddress'] != null
        ?   FromAddress.fromJson(json['fromAddress'])
        : null;
    description = json['description'];
  }
}

class FromAddress {
  int? id;
  String? city;
  int? cityId;
  String? street;
  String? buildingName;
  int? floorNumber;
  String? title;
  String? description;
  String? longitude;
  String? latitude;

  FromAddress(
      {this.id,
      this.city,
      this.cityId,
      this.street,
      this.buildingName,
      this.floorNumber,
      this.title,
      this.description,
      this.longitude,
      this.latitude});

  FromAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    cityId = json['cityId'];
    street = json['street'];
    buildingName = json['buildingName'];
    floorNumber = json['floorNumber'];
    title = json['title'];
    description = json['description'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
}

class PlacesDetails {
  int? id;
  String? placeName;
  String? description;
  bool? makeOrder;
  bool? payOrder;

  PlacesDetails(
      this.id, this.placeName, this.description, this.makeOrder, this.payOrder);

  PlacesDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeName = json['placeName'];
    description = json['description'];
    makeOrder = json['makeOrder'];
    payOrder = json['payOrder'];
  }
}
