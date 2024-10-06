import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIProvider extends ChangeNotifier{
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

//dark theme
  final darkTheme = ThemeData(
    primaryColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
  );

//light theme
  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
  );

  //save the last theme used or set


//Dark mode toggle action
  changeTheme(){
    _isDark = !_isDark;

    //save the theme value that is set by the user to secure the storage 
    storage.setBool('isDark', _isDark);

    notifyListeners();
  }

  //init method of provider
  init() async {
    //after we re run the app
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool('isDark')??false;
    notifyListeners();
  }
}