import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import '../custom/model/OrderModel.dart';

class HiveSetUp {
  static Future<void> init() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(HiveCityAdapter());
    // Hive.registerAdapter(HiveMainCategoryAdapter());
    // Hive.registerAdapter(HiveSubCategoryAdapter());
    // Hive.registerAdapter(HiveServiceAdapter());
    await publicBoxes();
  }

  static Future<void> publicBoxes() async {
    await Hive.openBox('Authorization');
    await Hive.openBox('modelList');
    // await Hive.openBox('themeColor');
    // await Hive.openBox('GeneralData');
  }
}

@injectable
class AuthPrefsHelper {
  var box = Hive.box('Authorization');

  void setToken(String username) {
    box.put('token', username);
  }

  String? getToken() {
    return box.get('token');
  }

  Future<void> clearToken() async {
    await box.clear();
  }

  bool isSignedIn() {
    try {
      String? uid = getToken();
      return uid != null;
    } catch (e) {
      return false;
    }
  }

  void setLocation(String cityName) {
    box.put('cityname', cityName);
  }

  String? getLocation() {
    return box.get('cityname') ?? "Zahlee";
  }
}

@injectable
class ListCart {
  List<CartOrderModel> currentPlaceCart = [];
  List<CartOrderModel> PlaceCart = [];

  var box = Hive.box('modelList');

  void setModel(List<CartOrderModel> cart) {
    box.put('modelList', cart);
  }

  List<CartOrderModel>? getModel() {
    return box.get('modelList');
  }


  insertNewCardOrder(List<CartOrderModel> listOfOrder){
    box.clear();

    for (var element in listOfOrder) {
      box.put('modelList', element);
    }

  }

  List<CartOrderModel>? updatedCart(String? placeCategory, String? placeName) {
    // currentPlaceCartObject =  CartOrderModel();
    CartOrderModel? currentPlaceCartObject = CartOrderModel();
    if (box.isOpen) {
      if (box.get('modelList') != null) {
        currentPlaceCart = getModel()!
            .where((element) =>
                element.CategoryName == placeCategory &&
                element.PlaceName == placeName)
            .toList();

        PlaceCart == getModel();
      }

      if (currentPlaceCart.isEmpty) {
        currentPlaceCartObject.CategoryName = placeCategory ?? "";
        currentPlaceCartObject.PlaceName = placeName ?? "";
        currentPlaceCartObject.Description = "";
        currentPlaceCartObject.isPay = true;
        currentPlaceCartObject.isCall = true;
        PlaceCart.add(currentPlaceCartObject);
      } else {
        PlaceCart.remove(currentPlaceCartObject);
        PlaceCart.add(currentPlaceCartObject);
      }
    } else {
      currentPlaceCartObject.CategoryName = placeCategory;
      currentPlaceCartObject.PlaceName = placeName;
      currentPlaceCartObject.Description = "";
      currentPlaceCartObject.isPay = true;
      currentPlaceCartObject.isCall = true;
      PlaceCart.add(currentPlaceCartObject);
    }

    return PlaceCart;
  }
}

class LanguageHelper {
  var box = Hive.box('language');

  void setLanguage(String username) {
    box.put('lang', username);
  }

  String? getLanguage() {
    return box.get('lang');
  }
}

class ThemeHelper {
  var box = Hive.box('themeColor');

  void setTheme(bool isDark) {
    box.put('theme', isDark);
  }

  bool getisDark() {
    if (box.get('theme') == null) {
      return true;
    }
    return box.get('theme');
  }
}

//   }
// }
