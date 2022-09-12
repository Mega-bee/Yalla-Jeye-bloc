class DestenationModel {
  int? id=0;
  String? name="";
  String? location="";
  String? description="";
  bool? isDeliveryOnly=false;
  num? price=0;


  DestenationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    isDeliveryOnly = json['isDeliveryOnly'] ;
    price = json['price'] ;
  }

}