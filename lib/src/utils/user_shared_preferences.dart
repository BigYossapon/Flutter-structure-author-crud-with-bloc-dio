// @dart=2.9
//ใช้คำสั่งด้านบนเพิื่อยกเลิก nuul safty
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);
  static String getUsername() => _preferences.getString(_keyUsername);
}
