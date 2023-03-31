import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/auth/ui/widget/custom_button.dart';
import 'package:untitled1/module_addresses/request/create_address_request.dart';
import 'package:untitled1/module_addresses/response/address_response.dart';
import 'package:untitled1/module_addresses/response/regions_response.dart';
import 'package:untitled1/module_addresses/state_manager/create_address_state_manager.dart';
import 'package:untitled1/module_addresses/ui/widget/choose_location_wedgit.dart';
import 'package:untitled1/utils/Colors/colors.dart';

class CreateAddressSheet extends StatefulWidget {
  final Function(CreateAddressRequest) createAddress;
  final AddressResponse? response;
  final bool isUpdated;
  final RegionsCubit cubit;

  const CreateAddressSheet(
      {required this.createAddress,
      this.response,
      required this.isUpdated,
      required this.cubit});

  @override
  State<CreateAddressSheet> createState() => CreateAddressSheetState();
}

class CreateAddressSheetState extends State<CreateAddressSheet> {
  var titleController = TextEditingController();

  var buldingNameController = TextEditingController();
  var floorController = TextEditingController();
  var desController = TextEditingController();
  var streetController = TextEditingController();

  LatLng? addressLoca;
  CameraPosition ca = CameraPosition(target: LatLng(0, 0));
  final GlobalKey<FormState> _addAddressKey = GlobalKey<FormState>();
  GoogleMapController? mapController;
  RegionsResponse? selectedRegion;

  @override
  void initState() {
    super.initState();
    widget.cubit.getRegions(this);
    if (widget.isUpdated) {
      titleController.text = widget.response?.title ?? '';
      buldingNameController.text = widget.response?.buildingName ?? '';
      floorController.text = widget.response?.floorNumber.toString() ?? '';
      desController.text = widget.response?.description ?? '';
      streetController.text = widget.response?.street ?? '';
      selectedRegion = RegionsResponse(
          id: widget.response?.cityId, location: widget.response?.city);
      if (widget.response!.latitude!.isEmpty ||
          widget.response!.longitude!.isEmpty) {
      } else {
        addressLoca = LatLng(double.parse(widget.response?.latitude ?? '0.0'),
            double.parse(widget.response?.longitude ?? '0.0'));
        ca = CameraPosition(target: addressLoca!, zoom: 15);
      }
    }
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: StatefulBuilder(
        builder: (ctx, setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.9,
            //set this as you want
            maxChildSize: 1,
            //set this as you want
            minChildSize: 0.9,
            //set this as you want
            expand: true,
            // snap: true,

            builder: (context, scrollController) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 20, end: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 17,),

                    Text(
                      "Nickname",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'write your custom nickname',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 9.0),
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Address details",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<RegionsCubit, States>(
                      bloc: widget.cubit,
                      builder: (context, state) {
                        return state.getUI(context);
                      },
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
                            autofillHints: [AutofillHints.name],
                            controller: streetController,
                            decoration: InputDecoration(
                              hintText: 'Street',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 9.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(204, 204, 204, 0.5),
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
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
                                  vertical: 15.0, horizontal: 9.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(204, 204, 204, 0.5),
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
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
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly,
                            // ],
                            decoration: InputDecoration(
                              hintText: 'Floor number',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 9.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(204, 204, 204, 0.5),
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
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
                            controller: desController,
                            decoration: InputDecoration(
                              hintText: 'Description',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 9.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(204, 204, 204, 0.5),
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),

                          // locationn
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).secondaryHeaderColor),
                            child: widget.isUpdated
                                ? TextButton.icon(
                                    icon: Icon(Icons.location_on),
                                    label: Text(
                                      'Update location',
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChooseLocationWidget(
                                                    previousLocation:
                                                        addressLoca,
                                                  ))).then((value) {
                                        if (value != null) {
                                          addressLoca = value as LatLng;
                                          ca = CameraPosition(
                                              target: addressLoca!, zoom: 15);
                                          mapController?.animateCamera(
                                              CameraUpdate.newCameraPosition(
                                                  ca));
                                          setState(() {});
                                        }
                                      });
                                    },
                                  )
                                : TextButton.icon(
                                    icon: Icon(Icons.location_on),
                                    label: Text(
                                      'Pin location',
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChooseLocationWidget(
                                                    previousLocation:
                                                        addressLoca,
                                                  ))).then((value) {
                                        if (value != null) {
                                          addressLoca = value as LatLng;
                                          ca = CameraPosition(
                                              target: addressLoca!, zoom: 15);
                                          mapController?.animateCamera(
                                              CameraUpdate.newCameraPosition(
                                                  ca));
                                          setState(() {});
                                        }
                                      });
                                    },
                                  ),
                          ),
                          addressLoca != null
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 150,
                                    child: GoogleMap(
                                      onMapCreated: (controller) {
                                        setState(() {
                                          mapController = controller;
                                        });
                                      },
                                      markers: {
                                        Marker(
                                            markerId: MarkerId(Random()
                                                .nextInt(100)
                                                .toString()),
                                            position: addressLoca!)
                                      },
                                      initialCameraPosition: ca,
                                    ),
                                  ),
                                )
                              : Container(),

                          SizedBox(
                            height: 0,
                          ),
                          CustomButton(
                            buttonTab: () {
                              if (_addAddressKey.currentState!.validate() &&
                                  addressLoca != null &&
                                  selectedRegion != null) {
                                widget.createAddress(CreateAddressRequest(
                                  buildingName: buldingNameController.text,
                                  city: selectedRegion?.id,
                                  description: desController.text,
                                  floorNumber: int.parse(floorController.text),
                                  street: streetController.text,
                                  title: titleController.text,
                                  latitude: addressLoca?.latitude.toString(),
                                  longitude: addressLoca?.longitude.toString(),
                                ));
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Please fill all fields');
                              }
                              // buldingNameController.clear();
                              // desController.clear();
                              // floorController.clear();
                              // streetController.clear();
                              // titleController.clear();
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
          );
        },
      ),
    );
  }
}
