class SearchTermsModel {
  int? id;
  String? image;
  String? title;
  String? description;
  Null? sortId;
  Address? address;
  List<Menus>? menus;

  SearchTermsModel(
      {this.id,
      this.image,
      this.title,
      this.description,
      this.sortId,
      this.address,
      this.menus});

  SearchTermsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    sortId = json['sortId'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['sortId'] = this.sortId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  Null? city;
  Null? cityId;
  String? street;
  String? buildingName;
  int? floorNumber;
  String? title;
  String? description;
  String? longitude;
  String? latitude;

  Address(
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

  Address.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['cityId'] = this.cityId;
    data['street'] = this.street;
    data['buildingName'] = this.buildingName;
    data['floorNumber'] = this.floorNumber;
    data['title'] = this.title;
    data['description'] = this.description;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class Menus {
  int? id;
  int? placeMenuTypeId;
  String? placeMenuType;
  String? menu;

  Menus({this.id, this.placeMenuTypeId, this.placeMenuType, this.menu});

  Menus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeMenuTypeId = json['placeMenuTypeId'];
    placeMenuType = json['placeMenuType'];
    menu = json['menu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['placeMenuTypeId'] = this.placeMenuTypeId;
    data['placeMenuType'] = this.placeMenuType;
    data['menu'] = this.menu;
    return data;
  }
}
