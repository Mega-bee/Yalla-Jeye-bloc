import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../abstracts/states/state.dart';

import '../../address_module_route.dart';
import '../../response/address_Response.dart';
import '../screens/addresses_list.dart';

class AddressPageSuccess extends States {
  final List<AddressModel> addressmodel;
  AddressPageState addressPageState;

  AddressPageSuccess(
      {required this.addressmodel, required this.addressPageState})
      : super(false);
  bool? checkBoxValue = false;

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
      color: Color(0xffFFD400),
      onRefresh: () async {
        addressPageState.getAddresses();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 630,
                  child: addressmodel.isNotEmpty
                      ? ListView.builder(
                          itemCount: addressmodel.length,
                          itemBuilder: (context, index) {
                            return RefreshIndicator(
                              color: Color(0xffFFD400),
                              onRefresh: () async {
                                addressPageState.getAddresses();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${addressmodel[index].title}"),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    AddressRoutes.Editaddress,
                                                    arguments: addressmodel[index]
                                                  ).then((value) {
                                                    if(value!=null && value==true){
                                                      addressPageState.getAddresses();
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                    color: Color(0xffFFD400),
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  addressPageState
                                                      .deleteAddress(
                                                          addressmodel[index]
                                                              .id
                                                              .toString());
                                                  addressPageState.refresh();
                                                  addressmodel.removeAt(index);
                                                },
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Color(
                                                    0xffe4e4e4,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      subtitle: Text(
                                          "${addressmodel[index].description}"),
                                      leading: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 13),
                                        child: Icon(Icons.home),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Text(
                            'No addresses',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 16, bottom: 16),
                  backgroundColor: Color(0xffFFD400),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  )),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AddressRoutes.Createaddress,
                ).then(
                  (value) {
                    if(value != null && value==true){
                      addressPageState.getAddresses();
                    }
                  },
                );
              },
              child: Text(
                "Add new address",
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
