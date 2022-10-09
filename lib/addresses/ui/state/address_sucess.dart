import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled1/utils/components/custom_red_button.dart';
import 'package:untitled1/utils/images/images.dart';

import '../../../abstracts/states/state.dart';

import '../../../profile/ui/state/profile_success.dart';
import '../../../utils/Colors/colors.dart';
import '../../address_module_route.dart';
import '../../response/address_Response.dart';
import '../screens/addresses_list.dart';

class AddressPageSuccess extends States {
  final List<AddressModel> addressmodel;
  AddressPageState addressPageState;

  AddressPageSuccess(
      {required this.addressmodel, required this.addressPageState});

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
      color: redColor,
      onRefresh: () async {
        addressPageState.getAddresses();
      },
      child: addressmodel.isNotEmpty
          ? ListView.builder(
              itemCount: addressmodel.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context, addressmodel[index]);
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
                                      Navigator.pushNamed(context,
                                          AddressRoutes.Editaddress,
                                          arguments:
                                          addressmodel[index])
                                          .then((value) {
                                        if (value != null &&
                                            value == true) {
                                          addressPageState
                                              .getAddresses();
                                        }
                                      });
                                    },
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      addressPageState.deleteAddress(
                                          addressmodel[index]
                                              .id
                                              .toString());
                                      addressPageState.refresh();
                                      addressmodel.removeAt(index);
                                    },
                                    child: Icon(Icons.delete , color: Colors.red.shade900,),
                                  ),
                                ],
                              )
                            ],
                          ),
                          subtitle: Text(
                              "${addressmodel[index].description},"
                                  "${addressmodel[index].buildingName}, "
                                  "${addressmodel[index].floorNumber}, "
                                  "${addressmodel[index].street}"),
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageAsset.NO_ADDREESS),
                  SizedBox(height: 15,),
                   Text(
                     'You dont add any address yet',
                     style: TextStyle(color: Colors.black, fontSize: 18 , fontWeight: FontWeight.bold),
                   ),

                ],
              ),
          ),
    );
  }
}
