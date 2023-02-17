import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/home_page/ui/screens/placess_list_screen.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';
import 'package:untitled1/home_page/ui/widget/destination_card.dart';
import 'package:untitled1/home_page/ui/widget/destination_place_card.dart';
import 'package:untitled1/home_page/ui/widget/title_home.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/Colors/colors.dart';
import '../../response/homepage_response.dart';
import '../screens/home_page.dart';
import '../widget/Carousel_slider_widget/carousel_image_slider.dart';

class HomePageSuccess extends HomeStates {
  final HomePageModel homepage;

  HomePageState homepageState;

  HomePageSuccess({required this.homepage, required this.homepageState});

  late List<HomePageModel> SearchPlaces;
  late List<HomePageModel> SearchPlaces1;


  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: redColor,
        onRefresh: () async {
          homepageState.getHome();
        },
        child: Container(
          color: Colors.grey.shade50,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
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
                    ),
                    itemCount: homepage.events!.services!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        CarouselImageSlider(
                      imageUrl:
                          homepage.events!.services![itemIndex].imageUrl ?? '',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Categories',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: GridView.builder(
                      // physics: BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (2 / 4),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 0,
                      ),
                      // controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: homepage.destinations!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlacesListScreen(
                                          categoryName: homepage
                                                  .destinations![index].title ??
                                              '',
                                          placeTypeId: homepage
                                                  .destinations![index].id ??
                                              -1,
                                          placesList: homepage
                                                  .destinationWithPlaces![index]
                                                  .places ??
                                              [],
                                        )),
                              ).then((value) => homepageState.refresh());
                            },
                            child: DestinationCard(
                              model: homepage.destinations![index],
                            ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: homepage.destinationWithPlaces!.length,
                      itemBuilder: (context, index) {
                        return DestWithPlaceCard(
                          model: homepage.destinationWithPlaces![index],
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


