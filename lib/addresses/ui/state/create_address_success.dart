import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/auth/ui/widget/custom_button.dart';
import 'package:untitled1/utils/components/custom_red_button.dart';
import 'package:untitled1/utils/images/images.dart';

import '../../../abstracts/states/state.dart';

import '../../../utils/Colors/colors.dart';
import '../../request/create_address_request.dart';
import '../../response/isSelected.dart';
import '../screens/create_address_list.dart';

class CreateAddressPageSuccess extends States {
  final CreateAddressPageState screenState;

  CreateAddressPageSuccess({required this.screenState});
  final title = TextEditingController();
  final building = TextEditingController();
  final decription = TextEditingController();
  final nickname = TextEditingController();
  final street = TextEditingController();
  final floorNumber = TextEditingController();

  bool? isSelected = false;
  final _formKey = GlobalKey<FormState>();
  final List<IsSelectedModel> model = [
    IsSelectedModel(
      Text: 'Home',
      Icon: SvgPicture.asset(
        ImageAsset.home,
        height: 20,
      ),
      isSelected: false,
    ),
    IsSelectedModel(
      Text: 'Work',
      Icon: SvgPicture.asset(
        ImageAsset.work,
        height: 20,
      ),
      isSelected: false,
    ),
    IsSelectedModel(
      Text: 'Parents',
      Icon: SvgPicture.asset(
        ImageAsset.parents,
        height: 20,
      ),
      isSelected: false,
    ),
    IsSelectedModel(
      Text: 'Custom',
      Icon: Icon(Icons.shuffle_outlined),
      isSelected: false,
    ),
  ];
  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nickname",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              controller: nickname,
              decoration: InputDecoration(
                hintText: 'write your custom nickname',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(204, 204, 204, 0.5), width: 2.0),
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    autofillHints: [AutofillHints.name],
                    controller: title,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 13.0),
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    controller: decription,
                    decoration: InputDecoration(
                      hintText: 'Decription',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 13.0),
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    autofillHints: [AutofillHints.name],
                    controller: street,
                    decoration: InputDecoration(
                      hintText: 'Street',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 13.0),
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    controller: building,
                    decoration: InputDecoration(
                      hintText: 'Building name',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 13.0),
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
                    height: 50,
                  ),


                  CustomButton(
                    buttonTab: () {
                      if (_formKey.currentState!.validate()) {
                        screenState.CreateAddress(CreateAddressRequest(
                          FloorNumber: 4,
                          Latitude: "",
                          Longitude: "",
                          id: 0,
                          Cityid: 1,
                          BuildingName: building.text,
                          Description: decription.text,
                          Title: title.text,
                          Street: street.text,
                        ));
                      }
                    },
                    loading: screenState.loadingSnapshotLogin.connectionState ==
                        ConnectionState.waiting,
                    text: 'Confirm',
                    bgColor: redColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
