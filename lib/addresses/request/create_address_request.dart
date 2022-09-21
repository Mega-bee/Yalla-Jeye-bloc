
class CreateAddressRequest {
  int? id;
  String? Title;
  String? Description;
  int? Cityid;
  String? Street;
  String? BuildingName;
  int? FloorNumber;
  String? Longitude;
  String? Latitude;


  CreateAddressRequest(
      {

        required this.Longitude,
        required this.Latitude,
        required this.FloorNumber,
        required this.BuildingName,
        required this.Description,
        required this.Street,
        required this.id,
        required this.Title,
        required this.Cityid
      });

  Map<String, dynamic> toJson() {
    return {
      'Id':id,
      'Title': Title,
      'Description': Description,
      'CityId': Cityid,
      'Street': Street,
      'BuildingName': BuildingName,
      'FloorNumber': FloorNumber,
      'Longitude': Longitude,
      'Latitude': Latitude,
    };
  }
}
