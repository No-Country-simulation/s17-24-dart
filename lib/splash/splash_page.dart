import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:to_do_list_nocountry/config/consts/consts.dart';
import 'package:to_do_list_nocountry/config/router/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _MyAppState();
}

class _MyAppState extends State<SplashPage> {
  bool shouldSkipOnboarding = false;

  void load() async {
    if (await Const.getStorage.read(key: "onboarding") != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.ONBOARDING);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      _checkSkipOnboarding().then((value) {
        load();
      });
    });
  }

  Future<void> _checkSkipOnboarding() async {
    await Future.delayed(Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ZoomIn(
        duration: const Duration(seconds: 2),
        child: Center(
          child: Image.asset('assets/images/notas.jpg'),
        ),
      ),
    );
  }
}
