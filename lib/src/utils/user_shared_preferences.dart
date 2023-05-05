// @dart=2.9
//ใช้คำสั่งด้านบนเพิื่อยกเลิก nuul safty
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static const _keyList = 'lists';
  static const _keydate = 'date';
  static const _keyloggedin = 'loggedin';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setToken(String username) async =>
      await _preferences.setString(_keyUsername, username);
  static String getToken() => _preferences.getString(_keyUsername);

  static Future setLoggedin(bool loggedin) async =>
      await _preferences.setBool(_keyloggedin, loggedin);
  static bool getLoggedin() => _preferences.getBool(_keyloggedin);

  static Future setLists(List<String> lists) async {
    await _preferences.setStringList(_keyList, lists);
  }

  static List<String> getLists() => _preferences.getStringList(_keyList);

  static Future setdate(DateTime date) async {
    final dates = date.toIso8601String();

    return await _preferences.setString(_keydate, dates);
  }

  static DateTime getdate() {
    final dates = _preferences.getString(_keydate);
    return dates == null ? null : DateTime.tryParse(dates);
  }
}
