import 'package:get/get.dart';

abstract class Routes {
  ///welcomer
  static const INITIAL = '/splash';
  static const ONBOARDING = '/onboarding';
  static const INDEX = '/index';

  //
  static const HOME = '/home';
  static const REGISTERANDLOGIN = '/registerandlogin';
}

class AppRouter {
  List<GetPage<dynamic>>? getPages() {
    return [
      GetPage(name: Routes.INITIAL, page: () => SplashPage()),
      GetPage(name: Routes.ONBOARDING, page: () => OnePage()),
      GetPage(name: Routes.INDEX, page: () => IndexPage()),

      //
    ];
  }
}
