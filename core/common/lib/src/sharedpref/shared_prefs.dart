import 'package:common/common.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  factory SharedPrefs() => _instance;
  SharedPrefs._internal();
  static final SharedPrefs _instance = SharedPrefs._internal();

  SharedPreferences? _prefs;

  /// Initialize Shared Preferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Ensure Shared Preferences is initialized
  void _ensureInit() {
    if (_prefs == null) {
      throw StateError('SharedPrefs not initialized. Call init() before using it.');    }
  }

  /// Get int value
  int getInt({required String key, int defaultValue = 0}) {
    _ensureInit();

    return _prefs?.getInt(key) ?? defaultValue;
  }

  /// Get double value
  double getDouble({required String key, double defaultValue = 0.0}) {
    _ensureInit();

    return _prefs?.getDouble(key) ?? defaultValue;
  }

  /// Get String value
  String getString({required String key, String defaultValue = ""}) {
    _ensureInit();

    return _prefs?.getString(key) ?? defaultValue;
  }

  /// Get bool value
  bool getBool({required String key, bool defaultValue = false}) {
    _ensureInit();

    return _prefs?.getBool(key) ?? defaultValue;
  }

  /// Generic getter for any type
  T get<T>({required String key, T? defaultValue}) {
    _ensureInit();
    if (T == dynamic) {
      throw ArgumentError('SharedPrefs.get<T>() called without a type argument.\n''You must write, for example: get<bool>(key: yourKey).');
    }

    return _prefs?.get(key) as T? ?? defaultValue ?? _getDefaultValue<T>();
  }

  T _getDefaultValue<T>() {
    T value;
    if (T == int) {
      value = 0 as T;
    } else if (T == double) {
      value = 0.0 as T;
    } else if (T == String) {
      value = "" as T;
    } else if (T == bool) {
      value = false as T;
    } else {
      throw Exception("SharedPref: Invalid type! Supported types are: int, double, String, bool.",);
    }

    return value;
  }

  /// Generic setter for any type
  Future<void> set<T>({required String key, required T value}) async {
    _ensureInit();
    if (T == dynamic) {
      throw ArgumentError('SharedPrefs.set<T>() called without a type argument.\n' 'You must write, for example: set<int>(key: yourKey, value: 42).');
    }
    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else {
      throw Exception("SharedPref: Invalid type! Supported types are: int, double, String, bool.");
    }
  }

  /// Clear all stored values
  Future<void> clearAll() async {
    _ensureInit();
    GetIt.I.get<SecureStorage>().set(key: SpKey.accessToken, value: "");
    await _prefs!.clear();
  }
}
