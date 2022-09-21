import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../abstracts/states/state.dart';

import '../../../utils/Colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../address_module_route.dart';
import '../../request/edit_address_request.dart';
import '../../response/address_Response.dart';
import '../screens/addresses_list.dart';
import '../screens/edit_screen_list.dart';

class EditAddressPageSuccess extends States {
  EditAddressPageState editAddressPageState;
  final AddressModel addressmodel;

  EditAddressPageSuccess(
      {required this.editAddressPageState, required this.addressmodel})
      : super(false) {
   street.text = addressmodel.street??"";
   description.text = addressmodel.description??"";
   building.text = addressmodel.buildingName??"";
   street.text = addressmodel.street??"";
   title.text = addressmodel.title??"";
  }

   var street = TextEditingController();
   var description = TextEditingController();
   var building = TextEditingController();
   var instruction = TextEditingController();
   var title = TextEditingController();
   var nickname = TextEditingController();


  @override
  Widget getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nickname",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.all(12),
                      backgroundColor: Color(0xffEFEFEF),
                      label: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAsset.home,
                            height: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ), //Text
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Chip(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(12),
                      backgroundColor: Color(0xffEFEFEF),
                      label: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAsset.work,
                            height: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Work',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ), //Text
                    ),
                    SizedBox(
                      width: 7,
                    ),

                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.all(12),
                      backgroundColor: Color(0xffEFEFEF),
                      label: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAsset.parents,
                            height: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Parent's",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ), //Text
                    ),
                    SizedBox(
                      width: 7,
                    ),

                    // Chip(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15),),
                    //   elevation: 0,
                    //   padding: EdgeInsets.all(12),
                    //   backgroundColor: Color(0xffEFEFEF),
                    //   label: Row(
                    //     children: [
                    //       Icon(Icons.home),
                    //
                    //       Text(
                    //         "Custom",
                    //       ),
                    //     ],
                    //   ), //Text
                    // ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  controller: nickname,
                  decoration: InputDecoration(
                    hintText: 'write your custom nickname',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(204, 204, 204, 0.5),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Address details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  autofillHints: [AutofillHints.name],
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(204, 204, 204, 0.5),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  controller: description,
                  decoration: InputDecoration(
                    hintText: 'Decription',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(204, 204, 204, 0.5),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  autofillHints: [AutofillHints.name],
                  controller: street,
                  decoration: InputDecoration(
                    hintText: 'Street',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(204, 204, 204, 0.5),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),




                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  controller: building,
                  decoration: InputDecoration(
                    hintText: 'Building name',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(204, 204, 204, 0.5),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),

                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    hintText: 'Location',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(204, 204, 204, 0.5),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),

              ],
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      left: 150, right: 150, top: 16, bottom: 16),
                  backgroundColor: redColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  )),
              onPressed: () {
                editAddressPageState.editAddress(EditAddressRequest(
                  FloorNumber: 4,
                  Latitude: "",
                  Longitude: "",
                  id: addressmodel.id,
                  Cityid: addressmodel.cityId,
                  BuildingName: building.text,
                  Description: description.text,
                  Title: title.text,
                  Street: street.text,
                ));
                Navigator.pop(context,true);
              },
              child: Text(
                "Confirm",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
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
