import 'package:injectable/injectable.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
@injectable
class MenuDetailsModel {
  String categoryName;
  String restaurantName;
  String image;
  List<PlaceMenu>? menuImages;
  int? placeId;
  int? placeTypeId;

  MenuDetailsModel({
    required this.placeId,required this.placeTypeId,
    required this.categoryName,required this.image,required this.restaurantName , required this.menuImages, });



}