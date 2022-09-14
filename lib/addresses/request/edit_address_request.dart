
class EditAddressRequest {
  int? id;
  int? Cityid;
  String? Street;
  String? BuildingName;
  String? Description;
  int? FloorNumber;
  String? Longitude;
  String? Title;
  String? Latitude;


  EditAddressRequest(
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
