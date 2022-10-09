import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import '../../../abstracts/states/state.dart';
import '../../../addresses/address_module_route.dart';
import '../../../hive/hive.dart';
import '../../../utils/Colors/colors.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/images/images.dart';
import '../../homepage_route.dart';
import '../../state_manager/homepage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widget/Google_Map/google_maps.dart';
import '../widget/images_details/images_details.dart';
import '../widget/order_card_widget.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomePageCubit cubit;
  final AuthPrefsHelper locationHelper;

  const HomePage(this.cubit,this.locationHelper);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    currentLocation;
    widget.cubit.getHomePage(this);
    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 500);
  }

  getHome() {
    widget.cubit.getHomePage(this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  String dropdownValue = 'One';
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late AnimationController controller;

  TextEditingController textFieldController = TextEditingController();

  String currentLocation = 'Zahle';
  // final DestinationWithPlaces homepage = DestinationWithPlaces();
  // final Destinations dest = Destinations();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/images/yallaJeyeLogo.png'),
        leadingWidth: 150,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black26),
                      height: 6,
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Text(
                            "Where should we deliver to?",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LocationMap(),
                              ),
                            ).then((value) async {
                              print("Current Loc = ${currentLocation}");

                              value as LatLng;
                              List<Placemark> newPlace = await GeocodingPlatform
                                  .instance
                                  .placemarkFromCoordinates(
                                      value.latitude, value.longitude,
                                      localeIdentifier: "en");

                              // print(newPlace[0].locality  + newPlace[0].subLocality +newPlace[0].thoroughfare );
                              currentLocation = newPlace[0].locality!;
                              widget.locationHelper.setLocation(currentLocation);
                              // +' '+newPlace[0].thoroughfare!;
                              print("Current Loc = ${currentLocation}");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.my_location,
                                  color: redColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Deliver to my current location',
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: redColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LocationMap(),
                                    ),
                                  ).then((value) async {
                                    print("Current Loc = ${currentLocation}");

                                    value as LatLng;
                                    List<Placemark> newPlace =
                                        await GeocodingPlatform.instance
                                            .placemarkFromCoordinates(
                                                value.latitude, value.longitude,
                                                localeIdentifier: "en");

                                    // print(newPlace[0].locality  + newPlace[0].subLocality +newPlace[0].thoroughfare );
                                    currentLocation = newPlace[0].locality!;
                                    // +' '+newPlace[0].thoroughfare!;
                                    print("Current Loc = ${currentLocation}");
                                  });
                                },
                                child: Text(
                                  'Deliver somewhere else...',
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.26,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 120, right: 120, top: 16, bottom: 16),
                          backgroundColor: redColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          )),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AddressRoutes.Createaddress,
                        );
                      },
                      child: Text(
                        "Add new address",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Deliver to',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.locationHelper.getLocation()}',
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: redColor,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: redColor,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 35,
            ),
          )
        ],
      ),
      body: BlocBuilder<HomePageCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (orderModelList.isNotEmpty
          ? Theme(
              data: Theme.of(context).copyWith(
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(
                  height: 65,
                ),
              )),
              child: FloatingActionButton.extended(
                backgroundColor: redColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  showModalBottomSheet(
                      transitionAnimationController: controller,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      enableDrag: false,
                      // useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        // var currentPlace = orderModelList.where((element) =>
                        // element.CategoryName == homepage.title&&
                        //     element.PlaceName == dest.title);
                        return StatefulBuilder(builder: (context, setState) {
                          return AnimatedContainer(
                            duration: Duration(seconds: 5),
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, left: 8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: redColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.calendar_month),
                                                SizedBox(width: 15),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 16.0,
                                                    bottom: 16.0,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "What's your order?",
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "What do you want to order?",
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                              ImageAsset.cancel_Icon,
                                              height: 30,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 550,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [

                                            ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    orderModelList.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: OrderCardWidget(orderModel: orderModelList[index],)
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 999,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       left: 18.0),
                                            //   child: Text("Total: 99 L.L"),
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Row(
                                                // mainAxisAlignment:
                                                // MainAxisAlignment.spaceBetween,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      // if (currentPlace == null) {
                                                      //   orderModelList
                                                      //       .add(CartOrderModel(
                                                      //     Description: textFieldController.text,
                                                      //     CategoryName:
                                                      //     homepage.title,
                                                      //     isCall: true,
                                                      //     isPay: true,
                                                      //     PlaceName: dest.title,
                                                      //   ));
                                                      // }
                                                      // else {
                                                      //   orderModelList
                                                      //       .remove(currentPlace);
                                                      //   orderModelList
                                                      //       .add(CartOrderModel(
                                                      //     Description: textFieldController.text,
                                                      //     CategoryName:
                                                      //     homepage.title,
                                                      //     isCall: true,
                                                      //     isPay: true,
                                                      //     PlaceName: dest.title,
                                                      //   ));
                                                      // }
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      padding: EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 13,
                                                        bottom: 13,
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      side: BorderSide(
                                                        width: 1.0,
                                                        color: Color.fromRGBO(
                                                            12, 105, 126, 0.5),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Add place',
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            12, 105, 126, 0.5),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  MaterialButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Checkout',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    color: redColor,
                                                    elevation: 0,
                                                    padding: EdgeInsets.only(
                                                        left: 75,
                                                        right: 75,
                                                        top: 13,
                                                        bottom: 13),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 80,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      });
                },
                label: Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 70.0,
                        bottom: 70.0,
                        right: 120.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What's your order?",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "What do you want to order?",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      size: 30,
                    ),
                  ],
                ),
              ),
            )
          : Container()),
    );
  }
}
