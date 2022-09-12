import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/custom/response/custom_Response.dart';

import '../../../abstracts/states/state.dart';
import '../../../home_page/response/homepage_response.dart';
import '../../../home_page/ui/widget/menu_details.dart';
import '../../../utils/cupertino/cupertino_show_sheet.dart';
import '../screens/custom_list.dart';
import '../widget/custom_address_page.dart';

class CustomSuccess extends States {
  CustomPageState customPageState;

  DateTime datetime = DateTime.now();

  CustomSuccess({required this.customPageState}) : super(false);

  Widget buildDatePicker() => CupertinoDatePicker(
        maximumYear: DateTime.now().year,
        minimumYear: 2015,
        initialDateTime: datetime,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (dateTime) {
          dateTime = dateTime;
          customPageState.refresh();
        },
      );

  @override
  Widget getUI(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                showSheet(context, child: buildDatePicker(),
                                    onClicked: () {
                                  Navigator.pop(context);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 6,
                                  bottom: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Color(0xffFFD400),
                                ),
                              ),
                              child: Text(
                                'Change',
                                style: TextStyle(
                                  color: Color(0xffFFD400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text("In 30-45 mins"),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Deliver From",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => CustomAddress(),
                                //   ),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 6,
                                  bottom: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Color(0xffFFD400),
                                ),
                              ),
                              child: Text(
                                'Select',
                                style: TextStyle(
                                  color: Color(0xffFFD400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Zahle",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "street, building, floor",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Deliver To",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 6,
                                  bottom: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Color(0xffFFD400),
                                ),
                              ),
                              child: Text(
                                'Select',
                                style: TextStyle(
                                  color: Color(0xffFFD400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Zahle",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "street, building, floor",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your order",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            hintText: 'What do you want to order?',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(204, 204, 204, 0.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 13.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(204, 204, 204, 0.5),
                                  width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "LBP 100,000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.white,
            child: TextButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                  left: 150,
                  right: 150,
                  top: 13,
                  bottom: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(width: 1.0, color: Color(0xffFFD400)),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 18, color: Color(0xffFFD400)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
