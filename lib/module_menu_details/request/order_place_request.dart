import 'package:untitled1/custom/model/OrderModel.dart';

class OrderPlaceRequest {
  int? addressId;
  int? totalPrice;
  String? promoCode;
  List<CartOrderModel>? orderPlaces;

  OrderPlaceRequest(
  { this.addressId, this.totalPrice, this.promoCode, this.orderPlaces});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['addressId'] = addressId;
    data['promoCode'] = promoCode;
    data['totalPrice'] = totalPrice;
    if (orderPlaces != null) {
      data['orderPlaces'] = List<dynamic>.from(orderPlaces!.map((x) => x.toJson()));
    }

    return data;
  }
}
