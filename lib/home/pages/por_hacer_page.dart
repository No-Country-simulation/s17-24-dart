import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_nocountry/home/structures/controllers/home_controller.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:to_do_list_nocountry/home/structures/controllers/theme_controller.dart';

class PorHacerPage extends StatefulWidget {
  @override
  _PorHacerPageState createState() => _PorHacerPageState();
}

class _PorHacerPageState extends State<PorHacerPage> {
  final HomeController homeController = Get.put(HomeController());
  final ThemeController themeController = Get.put(ThemeController());
  final TextEditingController _textController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('onStatus: $status'),
        onError: (error) => print('onError: $error'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (result) {
            setState(() {
              _textController.text = result.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Por hacer', style: TextStyle(fontSize: 25)),
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
                        color: theme.cardColor,
                        child: ListTile(
                          title: Text(
                            note.text,
                            style: theme.textTheme.bodyMedium,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _textController.text = note.text;
                                  Get.defaultDialog(
                                    title: 'Editar nota',
                                    titleStyle: theme.textTheme.bodyMedium,
                                    backgroundColor: theme.cardColor,
                                    radius: 20,
                                    contentPadding: const EdgeInsets.all(16.0),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          controller: _textController,
                                          style: theme.textTheme.bodyMedium,
                                          decoration: InputDecoration(
                                            hintText: 'Editar nota',
                                            hintStyle: theme
                                                .inputDecorationTheme.hintStyle,
                                            filled: true,
                                            fillColor: theme.cardColor,
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
                                              Get.back();
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
                                icon: Icon(Icons.delete),
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
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: 'Agregar nota',
                      hintStyle: theme.inputDecorationTheme.hintStyle,
                      filled: true,
                      fillColor: theme.cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(
                    _isListening ? Icons.mic : Icons.mic_none,
                  ),
                  onPressed: _listen,
                ),
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
