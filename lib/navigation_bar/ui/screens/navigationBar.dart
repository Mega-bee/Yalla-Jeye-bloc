
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import '../../../di/di_config.dart';
import '../../../home_page/ui/screens/home_page_list.dart';
import '../../../notification/ui/screens/Notification_list.dart';
import '../../../restaurants/ui/screens/restaurant_list.dart';

@injectable
class Navigationbar extends StatefulWidget {
  @override
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  DateTime currentBackPressTime = DateTime.now();
  var _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  void _selectPage(int selectedPageIndex) {
    setState(() {
      _selectedPageIndex = selectedPageIndex;
      _pageController.jumpToPage(selectedPageIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = [
      getIt<HomePage>(),
      getIt<RestaurantPage>(),
      getIt<NotificationPage>(),
      getIt<HomePage>(),
    ];
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<bool> _onWillPop() {
    if (_selectedPageIndex == 0) {
      DateTime now = DateTime.now();
      if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: 'tap again to exit');
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    } else {
      _selectPage(0);
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<SingleNotification> items = not;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(18, 108, 242, 1),
          selectedItemColor: Colors.black45,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedPageIndex,
          items: const[
             BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: "",
            ),
             BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: "",
            ),
             BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: "",
            ),
             BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: "",
            ),
          ],
          onTap: (selectedItem) => _selectPage(selectedItem),
        ),
      ),
    );
  }
}
