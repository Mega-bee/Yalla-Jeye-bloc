import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';
import '../custom/model/OrderModel.dart';

class HiveSetUp {
  static Future<void> init() async {
    await Hive.initFlutter();
    // await Hive.registerAdapter();
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
    // List<CartOrderModel>? items = [];
    dynamic hiveItems = box.get('modelList');
    List<CartOrderModel> fol = [];
    if (hiveItems == null) {
      return fol;
    }
    for (var item in hiveItems) {
      fol.add(CartOrderModel.fromJson(item),
      );
    }

    return fol;
  }


  Future<void> clearOrderModel() async {
    await box.clear();
  }

  insertNewCardOrder(List<CartOrderModel> listOfOrder) {
    for (var element in listOfOrder) {
      if (element.Description!.isEmpty) {
        listOfOrder.remove(element);
      }
    }

    List jsonList = [];
    listOfOrder.map((e) => jsonList.add(e.toJson())).toList();


// var ss = (listOfOrder);
    box.put('modelList', jsonList);
  }

  List<CartOrderModel>? updatedCart(
      {String? placeCategory, String? placeName}) {
    PlaceCart.clear();
    if (placeCategory == placeName) {
      placeName = '';
    }
    currentPlaceCart = getModel()!
        .where((element) =>
    element.CategoryName == placeCategory &&
        element.PlaceName == placeName)
        .toList();


    CartOrderModel? currentPlaceCartObject = CartOrderModel();
    List<CartOrderModel> _TempPlaceCart = getModel()!;
    if (currentPlaceCart.isEmpty) {
      currentPlaceCartObject.CategoryName = placeCategory ?? "";
      currentPlaceCartObject.PlaceName = placeName ?? "";
      currentPlaceCartObject.Description = "";
      currentPlaceCartObject.isPay = true;
      currentPlaceCartObject.isCall = true;
      PlaceCart.add(currentPlaceCartObject);
    } else {
      PlaceCart.add(currentPlaceCart.first);
    }


    _TempPlaceCart.where((element) =>
    !(element.CategoryName == placeCategory &&
        element.PlaceName == placeName),).forEach((element) {
      PlaceCart.add(element);
    });

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


