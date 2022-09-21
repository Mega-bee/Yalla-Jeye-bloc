import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../addresses/address_module_route.dart';
import '../../../utils/images/images.dart';

class ProfileSuccess extends StatelessWidget {
  const ProfileSuccess({Key? key}) : super(key: key);
  final double height = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
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
                    Row(
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
                          onTap: (){
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
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
