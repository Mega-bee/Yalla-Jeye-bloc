class OrderDetailsModell {
  int? id;
  int? statusId;
  String? statusName;
  bool? isCustom;
  // List<Null>? orderPlaces;
  CustomOrder? customOrder;

  OrderDetailsModell(
      {this.id,
        this.statusId,
        this.statusName,
        this.isCustom,
        // this.orderPlaces,
        this.customOrder});

  OrderDetailsModell.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['statusId'];
    statusName = json['statusName'];
    isCustom = json['isCustom'];
    // if (json['orderPlaces'] != null) {
    //   orderPlaces = <Null>[];
    //   json['orderPlaces'].forEach((v) {
    //     orderPlaces!.add(new Null.fromJson(v));
    //   });
    // }
    customOrder = json['customOrder'] != null
        ? new CustomOrder.fromJson(json['customOrder'])
        : null;
  }

}

class CustomOrder {
  FromAddress? fromAddress;
  FromAddress? toAddress;
  String? description;

  CustomOrder({this.fromAddress, this.toAddress, this.description});

  CustomOrder.fromJson(Map<String, dynamic> json) {
    fromAddress = json['fromAddress'] != null
        ? new FromAddress.fromJson(json['fromAddress'])
        : null;
    toAddress = json['toAddress'] != null
        ? new FromAddress.fromJson(json['toAddress'])
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
