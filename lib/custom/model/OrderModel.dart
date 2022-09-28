import '../../hive/hive.dart';

class CartOrderModel {
  String? CategoryName;
  String? PlaceName;
  String? Description;
  bool? isCall;
  bool? isPay;

  CartOrderModel({
     this.Description,
     this.CategoryName,
     this.isCall,
     this.isPay,
     this.PlaceName,
  });

  Map<dynamic, dynamic> toJson() {
    return {
    'CategoryName':this.CategoryName,
    'PlaceName':this.PlaceName,
    'Description':this.Description,
    'isCall':this.isCall,
    'isPay':this.isPay,

  };
  }

  CartOrderModel.fromJson(Map<dynamic, dynamic> json) {
    CategoryName = json['CategoryName'];
    PlaceName = json['PlaceName'];
    Description = json['Description'];
    isCall = json['isCall'];
    isPay = json['isPay'];

  }
}










List<CartOrderModel> orderModelList = [];
