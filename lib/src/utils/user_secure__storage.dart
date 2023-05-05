import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyToken = 'token';
  static const _keyList = 'lists';
  static const _dateex = 'dates';
  static Future setToken(String token) async =>
      await _storage.write(key: _keyToken, value: token);

  static Future<String?> getToken() async =>
      await _storage.read(key: _keyToken);

  static Future setLists(List<String> lists) async {
    final value = json.encode(lists);

    await _storage.write(key: _keyList, value: value);
  }

  static Future<List<String>?> getLists() async {
    final value = await _storage.read(key: _keyList);

    return value == null ? null : List<String>.from(json.decode(value));
  }

  static Future<DateTime?> setDates(DateTime date) async {
    final dates = date.toIso8601String();
    await _storage.write(key: _dateex, value: dates);

    return dates == null ? null : DateTime.tryParse(dates);
  }

  static Future<DateTime?> getDates() async {
    final dates = await _storage.read(key: _dateex);

    return dates == null ? null : DateTime.tryParse(dates);
  }
}
