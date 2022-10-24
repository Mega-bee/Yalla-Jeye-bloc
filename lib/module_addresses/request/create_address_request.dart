class CreateAddressRequest {
  int? id;
  int? city;

  String? street;
  String? buildingName;
  String? title;
  String? description;
  String? longitude;
  String? latitude;
  int? floorNumber;

  CreateAddressRequest({
      this.id,
      this.city,
      this.description,
      this.street,
      this.buildingName,
      this.title,
      this.longitude,
      this.latitude,
      this.floorNumber});

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'Title': title,
      "CityId": city,
      "Country": '',
      "Street": street,
      "BuildingName": buildingName,
      "Longitude": longitude,
      "Latitude": latitude,
      "FloorNumber": floorNumber
    };
  }
}
