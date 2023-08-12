import 'package:get/get.dart';

import '../../presentation/themes.dart';
import 'shared_prefrences.dart';
import 'shared_prefrences_impl.dart';

class SharedPrefrencesController extends GetxController {
  final SharedPrefrences _sharedPrefrences = SharedPrefrencesImpl();

  String? appTheme = 'light';

  _setDarkTheme() => Get.changeTheme(AppThemes.darkTheme);
  _setLightTheme() => Get.changeTheme(AppThemes.lightTheme);

  getTheme() async {
    appTheme = await _sharedPrefrences.getPrefrences('theme');
    if (appTheme == 'dark') {
      _setDarkTheme();
    } else if (appTheme == 'light') {
      _setLightTheme();
    } else {
      Get.changeTheme(
          Get.isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme);
    }
  }

  setDarkTheme() async {
    await _sharedPrefrences.savePrefrences('theme', 'dark');
    _setDarkTheme();
  }

  setLightTheme() async {
    await _sharedPrefrences.savePrefrences('theme', 'light');
    _setLightTheme();
  }
}
