import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled1/abstracts/states/state.dart';

import '../../auth/auth_module_route.dart';

class NotLoggedIn extends States{
  NotLoggedIn(): super(false);

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: (){
          Navigator.pushNamed(
            context,
            AuthRoutes.login,
          );
        },
        child: Text("Sign in"),
      ),
    );
  }





}