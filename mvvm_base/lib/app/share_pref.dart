import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static const TOKEN="token";


  static addStringToSF(String name,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, value);
  }

  static addBoolToSF(String name,bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(name, value);
  }

  static Future<String?> getStringFromSF(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    return prefs.getString(name);
  }

  static Future<bool?> getBoolFromSF(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(name);
  }

  static clearSharePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}
