import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_nocountry/config/router/app_router.dart';
import 'package:to_do_list_nocountry/config/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'ToDoListNoCountry',
        debugShowCheckedModeBanner: false,
        getPages: AppRouter().getPages(),
        //themeMode: ThemeMode.system,
        theme: AppTheme().lightTheme,
        //darkTheme: AppTheme().darkTheme,
        initialRoute: Routes.INITIAL,
        initialBinding: BindingsBuilder(
          () {
            //Get.put<AuthController>(AuthController());
          },
        ));
  }
}
