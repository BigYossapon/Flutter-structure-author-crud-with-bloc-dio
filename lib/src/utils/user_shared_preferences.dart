// @dart=2.9
//ใช้คำสั่งด้านบนเพิื่อยกเลิก nuul safty
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static const _keyEmail = 'email';
  static const _keyAddress = 'address';
  static const _keyCountry = 'country';
  static const _keyAvartar = 'avartar';
  static const _keyId = 'id';
  static const _keyRoles = 'roles';

  static const _keyList = 'lists';
  static const _keydate = 'date';
  static const _keyloggedin = 'loggedin';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);
  static String getUsername() => _preferences.getString(_keyUsername);

  static Future setEmail(String email) async =>
      await _preferences.setString(_keyEmail, email);
  static String getEmail() => _preferences.getString(_keyEmail);

  static Future setAddress(String address) async =>
      await _preferences.setString(_keyAddress, address);
  static String getAddress() => _preferences.getString(_keyAddress);

  static Future setCountry(String country) async =>
      await _preferences.setString(_keyCountry, country);
  static String getCountry() => _preferences.getString(_keyCountry);

  static Future setAvartar(String avartar) async =>
      await _preferences.setString(_keyAvartar, avartar);
  static String getAvartar() => _preferences.getString(_keyAvartar);

  static Future setId(int id) async => await _preferences.setInt(_keyId, id);
  static int getId() => _preferences.getInt(_keyId);

  static Future setLoggedin(bool loggedin) async =>
      await _preferences.setBool(_keyloggedin, loggedin);
  static bool getLoggedin() => _preferences.getBool(_keyloggedin);

  static Future setRoles(List<String> roles) async {
    await _preferences.setStringList(_keyRoles, roles);
  }

  static List<String> getRoles() => _preferences.getStringList(_keyRoles);

  static Future setdate(DateTime date) async {
    final dates = date.toIso8601String();

    return await _preferences.setString(_keydate, dates);
  }

  static DateTime getdate() {
    final dates = _preferences.getString(_keydate);
    return dates == null ? null : DateTime.tryParse(dates);
  }
}
