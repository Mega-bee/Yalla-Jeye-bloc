import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled1/auth/ui/widget/custom_button.dart';
import 'package:untitled1/module_addresses/request/create_address_request.dart';
import 'package:untitled1/module_addresses/response/address_response.dart';
import 'package:untitled1/module_addresses/ui/widget/choose_location_wedgit.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:untitled1/utils/images/images.dart';

class CreateAddressSheet extends StatefulWidget {
  final Function(CreateAddressRequest) createAddress;
  final AddressResponse? response;
  final bool isUpdated;
  const CreateAddressSheet(
      {required this.createAddress, this.response, required this.isUpdated});

  @override
  State<CreateAddressSheet> createState() => _CreateOccasionCardState();
}

class _CreateOccasionCardState extends State<CreateAddressSheet> {
  var titleController = TextEditingController();

  var buldingNameController = TextEditingController();
  var floorController = TextEditingController();
  var desController = TextEditingController();
  var streetController = TextEditingController();

  LatLng? addressLoca;
   CameraPosition ca = CameraPosition(target: LatLng(0, 0));
  final GlobalKey<FormState> _addAddressKey = GlobalKey<FormState>();
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    if (widget.isUpdated) {
      titleController.text = widget.response?.title ?? '';
      buldingNameController.text = widget.response?.buildingName ?? '';
      floorController.text = widget.response?.floorNumber.toString() ?? '';
      desController.text = widget.response?.description ?? '';
      streetController.text = widget.response?.street ?? '';
      if (widget.response!.latitude!.isEmpty ||
          widget.response!.longitude!.isEmpty) {
      } else {
        addressLoca = LatLng(double.parse(widget.response?.latitude ?? '0.0'),
            double.parse(widget.response?.longitude ?? '0.0'));
        ca = CameraPosition(target: addressLoca!, zoom: 15);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 1.0,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: SingleChildScrollView(
          controller: scrollController,
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
                  controller: titleController,
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
                  key: _addAddressKey,
                  child: Column(
                    children: [

                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        controller: desController,
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
                        controller: streetController,
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
                        controller: buldingNameController,
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
                        height: 17,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        controller: floorController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Floor number',
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

                      SizedBox(height: 15,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).secondaryHeaderColor
                        ),
                        child: widget.isUpdated
                            ? TextButton.icon(icon: Icon(Icons.location_on),label: Text('Update location',),onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseLocationWidget(
                                    previousLocation: addressLoca,
                                  ))).then((value) {
                            if (value != null) {
                              addressLoca = value as LatLng;
                              ca = CameraPosition(
                                  target: addressLoca!, zoom: 15);
                              mapController?.animateCamera(CameraUpdate.newCameraPosition(ca));
                              setState(() {});
                            }
                          });
                        },)
                            :TextButton.icon(icon: Icon(Icons.location_on),label: Text('Mark your location on map',),onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseLocationWidget(
                                    previousLocation: addressLoca,
                                  ))).then((value) {
                            if (value != null) {
                              addressLoca = value as LatLng;
                              ca = CameraPosition(
                                  target: addressLoca!, zoom: 15);
                              mapController?.animateCamera(CameraUpdate.newCameraPosition(ca));
                              setState(() {});
                            }
                          });
                        },),
                      ),
                      addressLoca != null
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 150,
                          child: GoogleMap(
                            onMapCreated: (controller){
                              setState(() {
                                mapController = controller;
                              });
                            },
                            markers: {
                              Marker(
                                  markerId: MarkerId(
                                      Random().nextInt(100).toString()),
                                  position: addressLoca!)
                            }, initialCameraPosition: ca,),
                        ),
                      )
                          : Container(),
                      SizedBox(
                        height: 50,
                      ),


                      CustomButton(
                        buttonTab: () {
                          if (_addAddressKey.currentState!.validate() && addressLoca != null) {
                            widget.createAddress(CreateAddressRequest(
                                buildingName: buldingNameController.text,
                                city: 1,
                                description: desController.text,
                                floorNumber:int.parse(floorController.text) ,
                                street: streetController.text,
                                title: titleController.text,
                              latitude: addressLoca?.latitude.toString(),
                              longitude: addressLoca?.longitude.toString(),
                            ));
                          }else{
                            Fluttertoast.showToast(msg: 'Select location please');
                          }
                        },
                        loading: false,
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
        ),
      ),

    );
  }
}
