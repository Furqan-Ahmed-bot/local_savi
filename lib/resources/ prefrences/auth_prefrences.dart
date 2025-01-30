// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, unused_field

import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static const String _authTokenKey = 'authToken';
  static const String _userRoleKey = 'userRole';
  static const String _refreshTokenKey = 'refreshToken';

  static Future<void> saveAuthTokenAndRole(String token, String role, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, token);
    await prefs.setString(_userRoleKey, role);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    print('p_auth ${_authTokenKey}');
    return prefs.getString(_authTokenKey);
  }

  static Future<String?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    print('p_role ${_userRoleKey}');
    return prefs.getString(_userRoleKey);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    print('p_role ${_refreshTokenKey}');
    return prefs.getString(_refreshTokenKey);
  }

  static Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
    await prefs.remove(_userRoleKey);
    await prefs.remove(_refreshTokenKey);
  }
}
