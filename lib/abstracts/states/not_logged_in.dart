import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/utils/components/custom_red_button.dart';
import 'package:untitled1/utils/images/images.dart';

import '../../auth/auth_module_route.dart';

class NotLoggedIn extends States {
  @override
  Widget getUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageAsset.LOGIN_FIRST),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'You should sign in first',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: CustomRedButton(
              title: 'Sign in',
              oPres: () {
                Navigator.pushNamed(
                  context,
                  AuthRoutes.login,
                );
              }),
        )
      ],
    );
  }
}
