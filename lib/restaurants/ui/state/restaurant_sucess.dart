import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../../home_page/response/homepage_response.dart';
import '../screens/restaurant_list.dart';

class RestaurantSuccess extends States {
  final HomePageModel restaurantsModel;
  RestaurantPageState restaurantPageState;

  RestaurantSuccess(
      {required this.restaurantsModel, required this.restaurantPageState})
      : super(false);

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
      itemCount: restaurantsModel.resturnats!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: Image.network(
                restaurantsModel.resturnats![index].imageUrl.toString(),
                fit: BoxFit.contain,
              ),
              title: Text(
                restaurantsModel.resturnats![index].restaurantName.toString(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
