import 'package:untitled1/home_page/response/homepage_response.dart';

class MenuDetailsModel {
  String categoryName;
  String restaurantName;
  String image;
  List<PlaceMenu>? menuImages;
  int? placeId;
  int? placeTypeId;

  MenuDetailsModel({
    this.placeId,this.placeTypeId,
    required this.categoryName,required this.image,required this.restaurantName , this.menuImages });



}