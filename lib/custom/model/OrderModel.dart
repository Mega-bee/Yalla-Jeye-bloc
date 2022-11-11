import 'package:untitled1/module_addresses/response/address_response.dart';

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
      this.placeName   });

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
AddressResponse? selectedAddressModel  ;