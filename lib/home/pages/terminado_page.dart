import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_nocountry/home/structures/controllers/home_controller.dart';
import 'package:to_do_list_nocountry/home/structures/controllers/theme_controller.dart';

class TerminadoPage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context); // Obtener el tema actual

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terminado', style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              themeController.switchTheme();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => ListView.builder(
            itemCount: homeController.terminadoList.length,
            itemBuilder: (context, index) {
              final note = homeController.terminadoList[index];
              return GestureDetector(
                onTap: () => _mostrarMenu(context, index, 'Terminado'),
                child: Card(
                  color: theme.cardColor,
                  child: ListTile(
                    title: Text(
                      note.text,
                      style: theme.textTheme.bodyMedium,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        homeController.eliminarTarea(index, 'Terminado');
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _mostrarMenu(BuildContext context, int index, String listaOrigen) {
    final ThemeData theme = Theme.of(context);

    Get.defaultDialog(
      title: 'Mover nota a:',
      titleStyle: theme.textTheme.bodyMedium,
      backgroundColor: theme.cardColor,
      radius: 20,
      contentPadding: const EdgeInsets.all(16.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              homeController.moverTarea(index, listaOrigen, 'PorHacer');
              Get.back();
            },
            child: const Text('Por hacer'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              homeController.moverTarea(index, listaOrigen, 'Haciendo');
              Get.back();
            },
            child: const Text('Haciendo'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              homeController.moverTarea(index, listaOrigen, 'Terminado');
              Get.back();
            },
            child: const Text('Terminado'),
          ),
        ],
      ),
    );
  }
}
