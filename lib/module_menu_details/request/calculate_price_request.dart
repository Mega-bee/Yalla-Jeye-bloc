class CalculatePriceRequest {
  int? addressId;
  List<int>? placesId;

  CalculatePriceRequest(this.addressId, this.placesId);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (placesId != null) {
      data['places'] = placesId;
    }
    data['addressId'] = addressId;
    return data;
  }
}