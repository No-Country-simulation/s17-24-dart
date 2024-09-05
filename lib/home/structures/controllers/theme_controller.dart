import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // Obtiene el tema actual almacenado o establece por defecto el modo claro
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  // Carga la preferencia de tema desde GetStorage
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  // Guarda la preferencia de tema en GetStorage
  void _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  // Cambia entre el modo oscuro y claro
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
