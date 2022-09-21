import '../../hive/hive.dart';

class CartOrderModel {
  // int? id;
  String? CategoryName;
  String? PlaceName;
  String? Description;
  bool? isCall;
  bool? isPay;
  // bool? Done=false;

  CartOrderModel({
     this.Description,
    // required this.id,
     this.CategoryName,
     this.isCall,
     this.isPay,
     this.PlaceName,
    // required this.Done,
  });
}







List<CartOrderModel> orderModelList = [];
