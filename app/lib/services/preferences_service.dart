import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late final SharedPreferences _prefs;

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  SharedPreferencesService();

  SharedPreferencesService._internal() {
    SharedPreferences.getInstance().then((prefs) => _prefs = prefs);
  }

  factory SharedPreferencesService.getInstance() {
    return _instance;
  }
}

class SharedPreferencesHelper extends SharedPreferencesService {
  Future<void> setPreference<T>(String key, T value) async {
    
    switch (T) {
      case int:
        await _prefs.setInt(key, value as int);
        break;
      case double:
        await _prefs.setDouble(key, value as double);
        break;
      case String:
        await _prefs.setString(key, value as String);
        break;
      case bool:
        await _prefs.setBool(key, value as bool);
        break;
      default:
        throw ArgumentError('Unsupported value type');
    }
  }

  Future<T?> getPreference<T>(String key) async {
    switch (_prefs.get(key)) {
      case int:
        return _prefs.getInt(key) as T?;
      case double:
        return _prefs.getDouble(key) as T?;
      case String:
        return _prefs.getString(key) as T?;
      case bool:
        return _prefs.getBool(key) as T?;
      default:
        throw ArgumentError('Unsupported value type');
    }
  }
}
