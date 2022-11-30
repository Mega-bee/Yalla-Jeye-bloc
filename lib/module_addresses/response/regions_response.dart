class RegionsResponse {
  RegionsResponse({
    this.id,
    this.location
  });

  int? id;
  String? location;



  RegionsResponse.fromJson(Map<String, dynamic> json)  {
    id = json["id"];
    location = json["location"];

  }
}