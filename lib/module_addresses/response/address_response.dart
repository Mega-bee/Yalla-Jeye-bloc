class AddressResponse {
  int? id;
  String? city;
  int? cityId;
  String? street;
  String? buildingName;
  String? title;
  String? description;
  String? longitude;
  String? latitude;
  int? floorNumber;
  bool? isSelected;

  AddressResponse({
    this.id,
    this.city,
    this.street,
    this.buildingName,
    this.title,
    this.floorNumber,
    this.latitude,
    this.longitude,
    this.description,
    this.cityId,
    this.isSelected = false,
  });

  AddressResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    city = json["city"];
    buildingName = json["buildingName"];
    street = json["street"];
    title = json["title"];
    longitude = json["longitude"] ?? '';
    latitude = json["latitude"] ?? '';
    floorNumber = json["floorNumber"];
    cityId = json["cityId"];
    description = json["description"];
    isSelected = false;
  }
}
