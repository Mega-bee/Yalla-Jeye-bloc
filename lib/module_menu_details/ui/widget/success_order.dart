import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/home_page/state_manager/homepage.dart';
import 'package:untitled1/home_page/ui/screens/home_page.dart';
import 'package:untitled1/navigation_bar/navigator_routes.dart';
import 'package:untitled1/navigation_bar/ui/screens/navigationBar.dart';

class SuccessRateAlter extends StatelessWidget {
  const SuccessRateAlter({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      // backgroundColor: Colors.transparent,
      backgroundColor: Theme.of(context).cardColor,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return  Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Lottie.asset('assets/images/successful.json'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
            'Your order created successfully,\n thank your for using YALA-JEYE',
              style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 18),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                NavigationbarrState? stateObject =  context.findAncestorStateOfType<NavigationbarrState>();
                stateObject?.currentIndex = 2;
                stateObject?.setState(() {});
                orderModelList.clear();
                // getIt<HomePageCubit>().cartSubject.add('removeCart');
                Navigator.pushNamedAndRemoveUntil(context, NavRoutes.nav_rout, (route) => false);
              },
              child: Text('ok'),
            ),
          )
        ],
      ),
    );
  }
}