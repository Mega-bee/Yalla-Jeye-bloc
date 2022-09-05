import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../abstracts/states/state.dart';
import '../../../restaurants/ui/screens/restaurant_list.dart';
import '../../response/homepage_response.dart';
import '../screens/home_page_list.dart';

class HomePageSuccess extends States {
  final HomePageModel homepage;
  HomePageState homepageState;

  HomePageSuccess({required this.homepage,required this.homepageState })
      : super(false);
  int _currentIndex = 0;
  @override
  Widget getUI(BuildContext context) {
    return  Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(

              height: 350,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                _currentIndex = index;
                print(_currentIndex);
                homepageState.refresh();
              }),
          itemCount: homepage.events!.services!.length,
          itemBuilder: (BuildContext context, int itemIndex,
              int pageViewIndex) =>
              CachedNetworkImage(
                imageUrl:homepage.events!.services![itemIndex].imageUrl.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Theme.of(context).primaryColor, size: 10),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),


        ),
        CarouselSlider.builder(
            options: CarouselOptions(

                height: 350,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  _currentIndex = index;
                  print(_currentIndex);
                  homepageState.refresh();
                }),
            itemCount: homepage.events!.other!.length,
            itemBuilder: (BuildContext context, int itemIndex,
                int pageViewIndex) =>
                CachedNetworkImage(
                  imageUrl:homepage.events!.other![itemIndex].imageUrl.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Theme.of(context).primaryColor, size: 10),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),


        ),
      ],
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
