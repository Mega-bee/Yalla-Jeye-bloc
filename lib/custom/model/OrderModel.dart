import 'package:untitled1/addresses/response/address_Response.dart';

class CartOrderModel {
  String? categoryName;
  String? placeName;
  String? description;
  bool? makeOrder;
  bool? payOrder;
  int? placeTypeId;
  int? placeId;


  CartOrderModel(
      {this.description,
      this.categoryName,
      this.makeOrder,
      this.payOrder,
      this.placeTypeId,
      this.placeId,
      this.placeName });

  Map<dynamic, dynamic> toJson() {
    return {
      'description': description,
      'payOrder': payOrder,
      'makeOrder': makeOrder,
      'placeTypeId': placeTypeId,
      'placeId': placeId,
    };
  }
}

List<CartOrderModel> orderModelList = [];
AddressModel? selectedAddressModel  ;