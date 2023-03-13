import 'package:flutter/material.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/screens/driver_order_details_screen.dart';
import 'package:untitled1/order_details/response/order_response.dart';
import 'package:untitled1/order_details/ui/widget/order_place_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverOrderDetailsInfo extends StatelessWidget {
  final OrderDetailsResponse orderDetailsResponse;
  final DriverOrderDetailsScreenState screenState;

  DriverOrderDetailsInfo(
      {required this.orderDetailsResponse, required this.screenState});

  void launchGoogleMaps(String latitude, String longitude) async {
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total KM'),
                        Text(
                          '${orderDetailsResponse.totalDistance} KM',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total price'),
                        Text('${orderDetailsResponse.totalPrice} L.L',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            orderDetailsResponse.isCustom
                ? Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(orderDetailsResponse.customOrder?.description ??
                              ''),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('From : '),
                              Text(orderDetailsResponse
                                      .customOrder?.fromAddress?.title ??
                                  ''),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('To : '),
                              Text(orderDetailsResponse
                                      .customOrder?.toAddress?.title ??
                                  ''),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => OrderPlaceCard(
                        placesDetails:
                            orderDetailsResponse.orderPlaces![index]),
                    itemCount: orderDetailsResponse.orderPlaces?.length,
                    shrinkWrap: true,
                  ),
            SizedBox(height: 50,),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                launchGoogleMaps(
                  orderDetailsResponse.lat ?? "null",
                  orderDetailsResponse.long ?? "null",
                ); // Replace with the latitude and longitude values from your API
              },
              child: Text('Open in Google Maps'),
            )
          ],
        ),
      ),
    );
  }
}
