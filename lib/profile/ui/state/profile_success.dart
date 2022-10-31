import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/auth/auth_module_route.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/module_addresses/address_route.dart';
import 'package:untitled1/utils/components/custom_alert_dialog.dart';
import '../../../abstracts/states/state.dart';
import '../../../hive/hive.dart';
import '../../../navigation_bar/navigator_routes.dart';
import '../../../utils/images/images.dart';
import '../../profile_module_route.dart';
import '../screen/profile.dart';

class ProfileSuccess extends States {
  ProfilePageState state;
  ProfileSuccess({required this.state});
  final double height = 20;

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),

            Stack(
              children: [
                Card(
                  color: Colors.white,
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
                                  AddressRoutes.VIEW_ADDRESS,
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
             state.isLogInUser() ? Container():   InkWell(
              onTap: (){
                showDialog(context: context, builder: (context) => CustomDialogBox(title: 'Login in first'),);
              },
               child: Center(
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey.shade100.withOpacity(0.6) ,
                      height: 205,
                      child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image.asset(ImageAsset.PASSWORD),
                    ],),),
                  ),
             )
              ],
            ),

            SizedBox(
              height: 30,
            ),
            Card(
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
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: InkWell(
                onTap: () {
                  state.isLogInUser() ?
                  getIt<AuthPrefsHelper>().clearToken().then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, NavRoutes.nav_rout, (route) => false);
                  }) :  Navigator.pushNamedAndRemoveUntil(
                      context, AuthRoutes.login, (route) => false);
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
                        getIt<AuthPrefsHelper>().isSignedIn()  ?  Text("Sign out") : Text("Sign in"),
                      ],
                    )),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
