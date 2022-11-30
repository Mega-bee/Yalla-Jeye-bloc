import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/orders/ui/screens/order_page_list.dart';
import 'package:untitled1/utils/images/images.dart';

import '../../../custom/ui/screens/custom_list.dart';
import '../../../home_page/ui/screens/home_page.dart';
import '../../../profile/ui/screen/setting_screen.dart';
import '../../../utils/Colors/colors.dart';

@injectable
class Navigationbar extends StatefulWidget {
  @override
  State<Navigationbar> createState() => NavigationbarrState();
}

class NavigationbarrState extends State<Navigationbar> {
    int currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    _pages = [
      getIt<HomePage>(),
      getIt<CustomPage>(),
      getIt<Order>(),
      getIt<SettingProfilePage>(),
    ];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        ///remove animation
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        selectedItemColor: redColor,
        selectedLabelStyle: TextStyle(
          color: redColor,

        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
        // selectedFontSize: 20,
        // iconSize: 20,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 35,
              child: SvgPicture.asset(
                ImageAsset.scooterr,height: 28,
                color: currentIndex == 0 ? redColor: Colors.black,

              ),
            ),
            label: 'Delivery',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 35,
              child: SvgPicture.asset(
                ImageAsset.custom,height: 30,
                color: currentIndex == 1 ? redColor : Colors.black,
              ),
            ),
            label: 'Custom',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height:35,
              child: SvgPicture.asset(
                ImageAsset.orders,height: 15,
                color: currentIndex == 2 ? redColor : Colors.black,
              ),
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 35,
              child: SvgPicture.asset(
                ImageAsset.profile,height: 15,
                color: currentIndex == 3 ? redColor : Colors.black,
              ),
            ),
            label: 'Profile',
          ),
        ],
        elevation: 2,
      ),
    );
  }
}
