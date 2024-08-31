import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_nocountry/home/structures/controllers/home_controller.dart';

class PorHacerPage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Por hacer',
            style: TextStyle(color: Colors.white, fontSize: 25)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: homeController.porHacerList.length,
                  itemBuilder: (context, index) {
                    final note = homeController.porHacerList[index];
                    return GestureDetector(
                      onTap: () => _mostrarMenu(context, index, 'PorHacer'),
                      child: Card(
                        color: Colors.grey[800],
                        child: ListTile(
                          title: Text(
                            note.text,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.white),
                                onPressed: () {
                                  _textController.text =
                                      note.text; // Set initial value
                                  Get.defaultDialog(
                                    title: 'Editar nota',
                                    titleStyle: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    backgroundColor: Colors.grey[900],
                                    radius: 20,
                                    contentPadding: const EdgeInsets.all(16.0),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          controller: _textController,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: InputDecoration(
                                            hintText: 'Editar nota',
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.grey[900],
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_textController
                                                .text.isNotEmpty) {
                                              homeController.editarTarea(
                                                  index, _textController.text);
                                              Get.back(); // Close dialog
                                            }
                                          },
                                          child: const Text('Guardar'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.white),
                                onPressed: () {
                                  homeController.eliminarTarea(
                                      index, 'PorHacer');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Agregar nota',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      homeController.agregarTarea(_textController.text);
                      _textController.clear();
                    }
                  },
                  child: const Text('Agregar'),
                ),
              ],
            ),
          ],
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
