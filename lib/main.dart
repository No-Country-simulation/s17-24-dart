import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.config(
        //enableLog: true,
        defaultPopGesture: true,
        defaultTransition: Transition.cupertino);

    return GetMaterialApp(
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      title: 'Telemedicina',
      debugShowCheckedModeBanner: false,
      initialRoute:
          INITIAL, // Asegúrate de definir las rutas inicialmente en una clase de rutas
      initialBinding: BindingsBuilder(
        () {
          Get.put<AuthController>(AuthController());
        },
      ), // Utiliza AuthBinding que se crea para manejar dependencias
      getPages: Routes
          .routes, // Asegúrate de que las rutas estén bien definidas y asignadas en una clase estática
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
