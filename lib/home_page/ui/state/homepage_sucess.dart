import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../abstracts/states/state.dart';
import '../../response/homepage_response.dart';
import '../../response/homepage_test_model.dart';
import '../screens/home_page_list.dart';

class HomePageSuccess extends States {
  final HomePageModel homepage;
  HomePageState homepageState;

  HomePageSuccess({required this.homepage, required this.homepageState})
      : super(false);
  int _currentIndex = 0;

  final List<HomePageTestModel> homemodel = [
    HomePageTestModel(
      img:
          'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
          'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),

  ];

  final List<HomePageTestModel> homemodel1 = [
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),

  ];

  final List<HomePageTestModel> homemodel2 = [
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),
    HomePageTestModel(
      img:
      'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
      title: 'Bites & CO',
      subTitle: 'Salads, Dessert, Burger',
    ),

  ];
  ScrollController? _controller = ScrollController();

  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 9.0, right: 15.0, top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                        homepage.events!.services![itemIndex].imageUrl.toString(),
                        imageBuilder: (context, imageProvider) => Container(
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
                              color: Theme.of(context).primaryColor, size: 20),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned.fill(
              //   child: Align(
              //     alignment: Alignment.topCenter,
              //     child: BuildIndicator(),
              //   ),
              // ),
              SizedBox(
                height: 55,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Any place",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Make your order from any market,bakery...",
                    style: TextStyle(color: Color(0xff707070),
                        fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Container(
                height: 200,
                // color: Colors.black.withOpacity(0.8),

                child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      childAspectRatio: (2/4),

                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: 41,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            color: Colors.black,
                            child: Opacity(
                              opacity: 0.6,
                              child: Image.network(
                                'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
                                width: 200,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(
                              8.0
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Bakeries',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   height: 110,
              //   child: ListView.builder(
              //
              //     scrollDirection: Axis.horizontal,
              //     controller: _controller,
              //     itemCount: 4,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(25),
              //           child: Stack(
              //             alignment: Alignment.bottomLeft,
              //             children: [
              //               Container(
              //                 color: Colors.black,
              //                 child: Opacity(
              //                   opacity: 0.6,
              //                   child: Image.network(
              //                     'https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg',
              //                     width: 200,
              //                     fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ),
              //
              //               Center(
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(
              //                     left: 18.0,
              //                     top: 48.0,
              //                   ),
              //                   child: Text(
              //                     'Restaurants',
              //                     style: TextStyle(
              //                       fontSize: 22,
              //                       fontWeight: FontWeight.w300,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),



              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Market',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                     Icon(Icons.arrow_forward_ios_rounded,color: Color(0xffFFD400),)
                    ],
                  ),
                  SizedBox(height: 3,),
                  Text(
                    'Make your order from any of this restaurants',
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 12
                    ),
                  ),
                ],
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: homemodel1.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 270,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  homemodel[index].img.toString(),
                                  height: 170,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${homemodel[index].title} - ${'Loc'}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${homemodel[index].subTitle}',style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Super market',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,color: Color(0xffFFD400),)
                    ],
                  ),
                  SizedBox(height: 3,),
                  Text(
                    'Make your order from any of this restaurants',
                    style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12
                    ),
                  ),
                ],
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: homemodel2.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 270,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  homemodel[index].img.toString(),
                                  height: 170,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${homemodel[index].title} - ${'Loc'}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${homemodel[index].subTitle}',style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Market',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,color: Color(0xffFFD400),)
                    ],
                  ),
                  SizedBox(height: 3,),
                  Text(
                    'Make your order from any of this restaurants',
                    style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12
                    ),
                  ),
                ],
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: homemodel1.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 270,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  homemodel[index].img.toString(),
                                  height: 170,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${homemodel[index].title} - ${'Loc'}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${homemodel[index].subTitle}',style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Super market',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,color: Color(0xffFFD400),)
                    ],
                  ),
                  SizedBox(height: 3,),
                  Text(
                    'Make your order from any of this restaurants',
                    style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12
                    ),
                  ),
                ],
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: homemodel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 270,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  homemodel[index].img.toString(),
                                  height: 170,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${homemodel[index].title} - ${'Loc'}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${homemodel[index].subTitle}',style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
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
