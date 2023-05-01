import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';
import 'package:untitled1/module_menu_details/ui/widget/custom_action_botton.dart';
import 'package:untitled1/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:untitled1/utils/global/global_state_manager.dart';
import '../../../hive/hive.dart';
import '../../../utils/images/images.dart';
import '../../homepage_route.dart';
import '../../state_manager/homepage.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomePageCubit cubit;
  final AuthPrefsHelper locationHelper;
  final AuthService _authService;
  final FireNotificationService fireNotificationService;

  HomePage(this.cubit, this.locationHelper, this._authService,
      this.fireNotificationService);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {





  StreamSubscription? _globalStateManager;

  Position? _currentPosition;
  String? _currentAddress;

  // String? cityName;

  @override
  void initState() {
    super.initState();

    widget.cubit.getHomePage(this);
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 500);
    _globalStateManager =
        getIt<GlobalStateManager>().stateStream.listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
    widget.fireNotificationService.refreshToken();
    _getCurrentLocation();
    getPosition();
    widget.cubit.initConnectFirstTime();


  }

  _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    setState(() {
      _currentPosition = position;
    });
    final placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _currentAddress = placemark[0].locality!;
    });
  }

  Future getPosition() async {
    bool services;
    LocationPermission per;

    services = await Geolocator.isLocationServiceEnabled();
    print(services);

    per = await Geolocator.checkPermission();
    print(per);

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        _getCurrentLocation();
      }
    }
  }

  // void getCurrentLocation() async {
  //   LocationData locationData = await Location().getLocation();
  //   final coordinates = new Coordinates(locationData.latitude, locationData.longitude);
  //   var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   var first = addresses.first;
  //   setState(() {
  //     cityName = first.locality;
  //   });
  // }

  getHome() {
    widget.cubit.getHomePage(this);
  }



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void refresh() {
    print('reffesss hommee');
    if (mounted) {
      setState(() {});
    }
  }

  // String dropdownValue = 'One';
  GlobalKey<FormState> _scaffoldKey = GlobalKey<FormState>();

  late AnimationController controller;

  // TextEditingController textFieldController = TextEditingController();

  // final DestinationWithPlaces homepage = DestinationWithPlaces();
  // final Destinations dest = Destinations();

  @override
  Widget build(BuildContext context) {
    print('----------------');
    print(_currentAddress);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageAsset.RedAndYellowLogo,
          height: 43,
        ),
        leadingWidth: 150,
        leading: _currentAddress != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$_currentAddress',
                    style: TextStyle(fontSize: 12, color: redColor),
                  ),
                ],
              )
            : Text("Processing..."),
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePageRoutes.searchTerms);
              },
              icon: Icon(
                CupertinoIcons.search,
                color: redColor,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<HomePageCubit, HomeStates>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: orderModelList.isNotEmpty
          ? CustomActionButton(
        formKeyCustom: _scaffoldKey,
              model: null,
              isLoginUser: widget._authService.isLoggedIn,
              claPrice: (request) {
                widget.cubit.calculateTotalPrice(request, this);
              })
          : Container(),
    );
  }
}
