import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/addresses/address_module_route.dart';
import 'package:untitled1/di/di_config.dart';
import '../../../abstracts/states/state.dart';
import '../../../addresses/response/address_Response.dart';
import '../../../hive/hive.dart';
import '../../../navigation_bar/navigator_routes.dart';
import '../../../utils/images/images.dart';
import '../../profile_module_route.dart';
import '../screen/get_profile.dart';
import '../screen/profile.dart';

class ProfileSuccess extends States {
  ProfilePageState state;

  DateTime datetime = DateTime.now();

  ProfileSuccess({required this.state}) : super(false);

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          maximumYear: DateTime.now().year,
          minimumYear: DateTime.now().year,
          initialDateTime: datetime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) {
            dateTime = dateTime;
            // customPageState.refresh();
          },
        ),
      );

  String yourAddress = 'l';
  AddressModel model = AddressModel();
  AddressModel model2 = AddressModel();

  TextEditingController custom = TextEditingController();
  final double height = 20;

  @override
  Widget getUI(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Account info",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProfileRoutes.Getprofile,
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAsset.profileSetting,
                            height: height,
                          ),
                          SizedBox(
                            height: 40,
                            width: 8,
                          ),
                          Text("Profile"),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAsset.addressesSetting,
                          height: height,
                        ),
                        SizedBox(
                          height: 40,
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AddressRoutes.address,
                            );
                          },
                          child: Text(
                            "Addresses",
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAsset.redeem,
                          height: height,
                        ),
                        SizedBox(
                          height: 40,
                          width: 8,
                        ),
                        Text("Redeem promo code"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Support system",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAsset.customerSupport,
                          height: height,
                        ),
                        SizedBox(
                          height: 40,
                          width: 8,
                        ),
                        Text("Customer support"),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAsset.emergencyNumber,
                          height: 30,
                        ),
                        SizedBox(
                          height: 40,
                          width: 1,
                        ),
                        Text("Emergency number"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: InkWell(
                onTap: () {
                  getIt<AuthPrefsHelper>().clearToken().then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, NavRoutes.nav_rout, (route) => false);
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImageAsset.signOut,
                          height: height,
                        ),
                        SizedBox(
                          height: 40,
                          width: 8,
                        ),
                        Text("Sign out"),
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
