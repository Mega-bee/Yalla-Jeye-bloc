class CustomModel {
  int? id;
  String? city;
  int? cityId;
  String? street;
  String? buildingName;
  int? floorNumber;
  String? title;
  String? description;
  Null? longitude;
  Null? latitude;

  CustomModel(
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

  CustomModel.fromJson(Map<String, dynamic> json) {
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
