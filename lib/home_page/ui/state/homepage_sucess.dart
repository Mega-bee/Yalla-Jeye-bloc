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
import '../widget/category_details.dart';
import '../widget/homepage_ads_details.dart';
import '../widget/images_details.dart';
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
                      InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePageAdsDetails(
                            image:
                                homepage.events!.services![itemIndex].imageUrl,
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              // cacheManager: customCacheManager,
                              // maxHeightDiskCache: 100,
                              key: UniqueKey(),
                              imageUrl: homepage
                                  .events!.services![itemIndex].imageUrl
                                  .toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: LoadingAnimationWidget.inkDrop(
                                    color: Theme.of(context).primaryColor,
                                    size: 20),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                            mainAxisSpacing: 0),
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: homepage.destinations!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CategoryDetails(
                                      image:
                                          homepage.destinations![index].image,
                                      title:
                                          homepage.destinations![index].title,
                                      homePageModel: homepage,
                                      CategoryName: homepage
                                          .destinationWithPlaces![index].title,
                                    )),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              Card(
                                elevation: 1,
                                child: CachedNetworkImage(
                                  // cacheManager: customCacheManager,
                                  // maxHeightDiskCache: 100,
                                  key: UniqueKey(),
                                  imageUrl: homepage.destinations![index].image
                                      .toString(),
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: LoadingAnimationWidget.inkDrop(
                                        color: Theme.of(context).primaryColor,
                                        size: 20),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              )
                            ],
                          ),
                        ),
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
                          return Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "${model.title}",
                                        style: GoogleFonts.poppins(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ViewAllCategories(
                                                    image: model
                                                        .places![index].image,
                                                    title: model.title,
                                                    name: model
                                                        .places![index].title,
                                                    homePageModel: model.places!
                                                    // homepage: homepage,
                                                    ),
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: redColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "${model.description}",
                                    style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ),
                                SizedBox(height: 34),
                                Container(
                                  height: 240,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: model.places!.take(6).length,
                                      itemBuilder: (context, index) {
                                        final F = model.places![index];
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              right: 18.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4.0, left: 8.0),
                                                child: Container(
                                                  width: 280,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              ImageDetails(
                                                            // currentPlace:[],


                                                            image: F.image,
                                                            title: F.title,
                                                            menu: F.menu,
                                                            categoryName:
                                                                model.title,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      child: CachedNetworkImage(
                                                        // cacheManager: customCacheManager,
                                                        // maxHeightDiskCache: 100,
                                                        key: UniqueKey(),
                                                        imageUrl:
                                                            F.image.toString(),
                                                        fit: BoxFit.cover,
                                                        height: 170,
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ),
                                                          ),
                                                        ),
                                                        placeholder:
                                                            (context, url) =>
                                                                Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: LoadingAnimationWidget
                                                              .inkDrop(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 20),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 9.0),
                                                child: Text(
                                                  "${F.title}",
                                                  style: GoogleFonts.poppins(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
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

  BuildIndicator() {
    return AnimatedSmoothIndicator(
        effect: const SlideEffect(
            dotHeight: 7,
            dotWidth: 7,
            dotColor: Colors.red,
            activeDotColor: Colors.yellow),
        activeIndex: _currentIndex,
        count: homepage.events!.services!.length);
  }
}
