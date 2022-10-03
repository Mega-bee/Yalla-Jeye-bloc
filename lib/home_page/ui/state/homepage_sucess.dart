import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../abstracts/states/state.dart';
import '../../../custom/model/OrderModel.dart';
import '../../../hive/hive.dart';
import '../../../utils/Colors/colors.dart';
import '../../response/homepage_response.dart';
import '../../response/homepage_test_model.dart';
import '../screens/home_page_list.dart';
import '../widget/Carousel_slider_widget/carousel_image_slider.dart';
import '../widget/images_details/category_details.dart';
import '../widget/Listview_gridview/destination_with_places_list.dart';
import '../widget/Listview_gridview/gridView_images_details_homepage.dart';
import '../widget/images_details/homepage_ads_details.dart';
import '../widget/images_details/images_details.dart';
import '../widget/view_all_categories.dart';

class HomePageSuccess extends States {
  final HomePageModel homepage;
  HomePageState homepageState;

  HomePageSuccess({required this.homepage, required this.homepageState})
      : super(false);

  int _currentIndex = 0;

  ScrollController? _controller = ScrollController();
  List<Places> place = [];

  @override
  Widget getUI(BuildContext context) {
    ///cutsom cache image manager
    //  final customCacheManager = CacheManager(
    //   Config(
    //     'customCacheKey',
    //     stalePeriod: Duration(days: 15),
    //     maxNrOfCacheObjects: 100,
    //   ),
    // );

    return SafeArea(
      child: RefreshIndicator(
        color: redColor,
        onRefresh: () async {
          homepageState.getHome();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 15.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        height: 250,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          _currentIndex = index;
                          homepageState.refresh();
                        }),
                    itemCount: homepage.events!.services!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        CarouselImageSlider(
                          homepage: homepage,
                          itemIndex: itemIndex,
                        )),
                SizedBox(
                  height: 55,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nearest shop",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                      "You don't mind which shop, just order from the nearest",
                      style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Container(
                  height: 230,
                  // color: Colors.black.withOpacity(0.8),

                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (2 / 4),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                    ),
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: homepage.destinations!.length,
                    itemBuilder: (context, index) {
                      return GridViewDetails(
                        homepage: homepage,
                        index: index,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homepage.destinationWithPlaces!.length,
                        itemBuilder: (context, index) {
                          final model = homepage.destinationWithPlaces![index];
                          return DestinationWithPlacesList(
                            homepage: homepage,
                            model: model,
                            index: index,
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
