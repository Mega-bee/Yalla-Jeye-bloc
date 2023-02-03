import 'package:flutter/cupertino.dart';

class CalculatePriceResponse{
  num? totalPrice;
  num? totalDistance;
  num? pricePerKilometer;
  List<Pricing>? pricingList;

  CalculatePriceResponse({this.totalPrice, this.totalDistance, this.pricingList ,this.pricePerKilometer});
  CalculatePriceResponse.fromJson(Map<String, dynamic> json) {

    if (json['pricingList'] != null) {
      pricingList = <Pricing>[];
      json['pricingList'].forEach((v) {
        pricingList!.add(Pricing.fromJson(v));
      });
    }
    totalDistance = json['totalDistance'];
    totalPrice = json['totalPrice'];
    pricePerKilometer = json['pricePerKilometer'];
  }

}

class Pricing {
  String? from;
  String? to;
  String? fromAddress;

  num? price;
  num? distance;

  Pricing(this.from, this.to, this.fromAddress, this.price, this.distance);

  Pricing.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    fromAddress = json['fromAddress'];
    distance = json['distance'];
    price = json['price'];
  }
}
