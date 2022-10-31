class CalculatePriceRequest {
  int? addressId;
  List<int>? placesId;
  List<int>? placeTypes;

  CalculatePriceRequest(this.addressId, this.placesId ,this.placeTypes);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (placesId != null) {
      data['places'] = placesId;
    }
    if (placeTypes != null) {
      data['placeTypes'] = placeTypes;
    }
    data['addressId'] = addressId;
    return data;
  }
}