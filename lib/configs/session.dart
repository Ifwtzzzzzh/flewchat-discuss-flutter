import 'dart:convert';

import 'package:discuss_app_v3/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  // Fetches and deserializes user data from shared preferences, returning it as a User object.
  static Future<User?> getUser() async {
    // Retrieve stored user data from preferences if available.
    User? currentUser;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');

    // If user data is available, create a User object from its JSON representation.
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      currentUser = User.fromJson(mapUser);
    }
    // Retrurn value of currentUser
    return currentUser;
  }

  // Persists a User object to SharedPreferences for later retrieval.
  static Future<bool> setUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    return await pref.setString('user', stringUser);
  }

  // Wipes user data from shared preferences, indicating a logout or fresh start.
  static Future<bool> clearUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove('user');
  }
}
