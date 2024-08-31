import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_nocountry/home/structures/controllers/home_controller.dart';

class TerminadoPage extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terminado',
            style: TextStyle(color: Colors.white, fontSize: 25)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => ListView.builder(
            itemCount: homeController.terminadoList.length,
            itemBuilder: (context, index) {
              final note = homeController.terminadoList[index];
              return GestureDetector(
                onTap: () => _mostrarMenu(context, index, 'Terminado'),
                child: Card(
                  color: Colors.grey[800],
                  child: ListTile(
                    title: Text(
                      note.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
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
    Get.defaultDialog(
      title: 'Mover nota a:',
      titleStyle: const TextStyle(color: Colors.white, fontSize: 18),
      backgroundColor: Colors.grey[900],
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
