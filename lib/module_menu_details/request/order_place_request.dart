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
    data['AddressId'] = addressId;
    data['PromoCode'] = promoCode;
    data['TotalPrice'] = totalPrice;
    if (orderPlaces != null) {
      data['OrderPlaces'] = orderPlaces!.map((v) => v.toJson()) ;
    }

    return data;
  }
}
