import 'package:get/get.dart';
import 'package:to_do_list_nocountry/home/pages/home_page.dart';
import 'package:to_do_list_nocountry/onboarding/onepage.dart';
import 'package:to_do_list_nocountry/splash/splash_page.dart';

abstract class Routes {
  ///welcomer
  static const INITIAL = '/splash';
  static const ONBOARDING = '/onboarding';
  //
  static const HOME = '/home';
}

class AppRouter {
  List<GetPage<dynamic>>? getPages() {
    return [
      GetPage(name: Routes.INITIAL, page: () => SplashPage()),
      GetPage(name: Routes.ONBOARDING, page: () => OnePage()),
      GetPage(name: Routes.HOME, page: () => HomePage()),

      //
    ];
  }
}
