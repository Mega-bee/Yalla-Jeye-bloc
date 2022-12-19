import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import '../custom/model/OrderModel.dart';

class HiveSetUp {
  static Future<void> init() async {
    await Hive.initFlutter();
    await publicBoxes();
  }

  static Future<void> publicBoxes() async {
    await Hive.openBox('Authorization');
    await Hive.openBox('modelList');
    await Hive.openBox('createAddressData');
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
  void setRoleId(int id) {
    box.put('role', id);
  }
  int? getRoleId() {
    return box.get('role');
  }

  bool isDriver() {
    try {
      int? uid = getRoleId();
      return uid == 4;
    } catch (e) {
      return false;
    }
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



class NewAddressData {
  var box = Hive.box('createAddressData');

  void setStreet(String street) {
    box.put('street', street);
  }

  void setBuildingName(String buildingName) {
    box.put('buildingName', buildingName);
  }

  void setFloorNumber(String floorNumber) {
    box.put('floorNumber', floorNumber);
  }

  void setDescription(String description) {
    box.put('description', description);
  }


  String? getStreet() {
    return box.get('street');
  }

  String? getBuildingName() {
    return box.get('buildingName');
  }

  String? getFloorNumber() {
    return box.get('floorNumber');
  }

  String? getDescription() {
    return box.get('description');
  }

}



