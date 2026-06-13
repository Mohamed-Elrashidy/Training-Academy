import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  SharedPrefrenceHelper._internal(this._sharedPreferences);

  static SharedPrefrenceHelper? _instance;

  final SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _instance ??= SharedPrefrenceHelper._internal(
      await SharedPreferences.getInstance(),
    );
  }

  void setValue<T>(String key, T value) {
    if (T == String) {
      _sharedPreferences.setString(key, value as String);
    } else if (T == int) {
      _sharedPreferences.setInt(key, value as int);
    } else if (T == bool) {
      _sharedPreferences.setBool(key, value as bool);
    } else if (T == double) {
      _sharedPreferences.setDouble(key, value as double);
    } else if (T == List<String>) {
      _sharedPreferences.setStringList(key, value as List<String>);
    } else {
      throw Exception('Unsupported type');
    }
  }

  T? getValue<T>(String key) {
    if (T == String) {
      return _sharedPreferences.getString(key) as T?;
    } else if (T == int) {
      return _sharedPreferences.getInt(key) as T?;
    } else if (T == bool) {
      return _sharedPreferences.getBool(key) as T?;
    } else if (T == double) {
      return _sharedPreferences.getDouble(key) as T?;
    } else if (T == List<String>) {
      return _sharedPreferences.getStringList(key) as T?;
    } else {
      throw Exception('Unsupported type');
    }
  }

  static SharedPrefrenceHelper get instance {
    final instance = _instance;
    if (instance == null) {
      throw StateError(
        'SharedPrefrenceHelper is not initialized. Call SharedPrefrenceHelper.init() first.',
      );
    }
    return instance;
  }
}
