import 'package:shared_preferences/shared_preferences.dart';

import 'shared_prefrences.dart';

class SharedPrefrencesImpl extends SharedPrefrences {
  late SharedPreferences _prefs;
  @override
  Future<void> openPrefrences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<String?> getPrefrences(String key) async {
    await openPrefrences();
    return _prefs.getString(key);
  }

  @override
  removePrefrences(String key) async {
    await openPrefrences();
    _prefs.remove(key);
  }

  @override
  savePrefrences(String key, String value) async {
    await openPrefrences();
    _prefs.setString(key, value);
  }
}
