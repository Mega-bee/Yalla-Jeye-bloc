import 'package:equatable/equatable.dart';

class RegionsResponse{
  int? id;
  String? location;

  RegionsResponse({this.id, this.location, });

  RegionsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['location'] = this.location;
    return data;
  }


}











