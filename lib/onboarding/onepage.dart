import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_nocountry/config/consts/consts.dart';
import 'package:to_do_list_nocountry/config/router/app_router.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¡Bienvenido!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Const.colorTextWhite,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Aqui encontraras tus notas favoritas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Const.colorTextBlack,
                ),
              ),
              //const SizedBox(height: 22),
              Image.asset(
                'assets/images/notas.jpg', // Ensure this path matches your asset
                height: 400,
              ),
              //const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  await Const.getStorage
                      .write(key: "onboarding", value: "true");
                  Get.toNamed(Routes.HOME);
                },
                icon: const Icon(Icons.pets),
                label: const Text('Continuar'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
