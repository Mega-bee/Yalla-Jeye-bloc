import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/auth_module_route.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/hive/hive.dart';
import 'package:untitled1/module_addresses/address_route.dart';
import 'package:untitled1/my_notification/Notification_module_route.dart';
import 'package:untitled1/navigation_bar/navigator_routes.dart';
import 'package:untitled1/profile/profile_module_route.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:untitled1/utils/components/custom_alert_dialog.dart';
import 'package:untitled1/utils/images/images.dart';
import '../../../custom/model/OrderModel.dart';
import '../../../utils/custom_alert_dialog/CustomDeleteDialog.dart';
import '../../state_manager/profile.dart';

@injectable
class SettingProfilePage extends StatefulWidget {
  final ProfileCubit cubit;
  final AuthService _authService;

  const SettingProfilePage(this.cubit, this._authService);

  @override
  State<SettingProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<SettingProfilePage> {
  bool flag = true;
  final double height = 20;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
                                  ImageAsset.new_profle,
                                   height: 17,
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
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AddressRoutes.VIEW_ADDRESS,
                              );
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  ImageAsset.new_addresses,
                                  height: 17,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 8,
                                ),
                                Text(
                                  "Addresses",
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                NotificationRoutes.Notifications,
                              );
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  ImageAsset.new_notification,
                                  height: 17,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 8,
                                ),
                                Text(
                                  "Notifications",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  widget._authService.isLoggedIn
                      ? Container()
                      : InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => const CustomDialogBox(
                                  title: 'Login in first'),
                            );
                          },
                          child: Center(
                            child: Container(
                              width: double.infinity,
                              color: Colors.grey.shade100.withOpacity(0.6),
                              height: 205,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(ImageAsset.PASSWORD),
                                ],
                              ),
                            ),
                          ),
                        )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(13),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 8.0),
              //           child: Text(
              //             "Support system",
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15,
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         Row(
              //           children: [
              //             SvgPicture.asset(
              //               ImageAsset.new_customer_support,
              //               height: 17,
              //             ),
              //             SizedBox(
              //               height: 40,
              //               width: 8,
              //             ),
              //             Text("Customer support"),
              //           ],
              //         ),
              //         Divider(
              //           thickness: 1,
              //         ),
              //         Row(
              //           children: [
              //             SvgPicture.asset(
              //               ImageAsset.new_emergency_number,
              //               height: 24,
              //             ),
              //             SizedBox(
              //               height: 40,
              //               width: 8,
              //             ),
              //             Text("Emergency number"),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: InkWell(
                  onTap: () {
                    widget._authService.isLoggedIn
                        ? showDialog(
                            context: context,
                            builder: (context) => CustomDeleteDialog(
                                  title: 'Sign out',
                                  content: 'Are you sure you want to sign out?',
                                  yesBtn: () {
                                    orderModelList.clear();
                                    SelectedDateHive().clearDate();
                                    AcceptSmoke().clearSmoke();
                                    getIt<AuthPrefsHelper>()
                                        .clearToken()
                                        .then((value) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          NavRoutes.nav_rout, (route) => false);
                                    });
                                  },
                                  noBtn: () {
                                    Navigator.pop(context);
                                  },
                                ))
                        : Navigator.pushNamed(
                            context,
                            AuthRoutes.login,
                          );
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAsset.new_sign_out,
                            height: 17,
                          ),
                          SizedBox(
                            height: 40,
                            width: 8,
                          ),
                          getIt<AuthPrefsHelper>().isSignedIn()
                              ? Text(
                                  "Sign out",
                                )
                              : InkWell(
                                  child: Text(
                                    "Sign in",
                                  ),
                                ),
                        ],
                      )),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     SelectedDateHive().clearDate();
              //     AcceptSmoke().clearSmoke();
              //   },
              //   child: Text("Clear hive"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
