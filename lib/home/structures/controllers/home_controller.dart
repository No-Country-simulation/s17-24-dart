import 'package:get/get.dart';
import 'package:to_do_list_nocountry/home/models/note_model.dart';
import 'package:to_do_list_nocountry/home/services/sqlite_note_db_services.dart';

class HomeController extends GetxController {
  // Instancia de la base de datos
  final Sqlite_Note_DB_Services dbHelper = Sqlite_Note_DB_Services();

  // Las listas reactivas para las tareas
  var porHacerList = <NoteModel>[].obs;
  var haciendoList = <NoteModel>[].obs;
  var terminadoList = <NoteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  // Método para obtener todas las notas y clasificarlas
  void fetchNotes() async {
    final notes = await dbHelper.notes();
    porHacerList.value =
        notes.where((note) => note.status == 'PorHacer').toList();
    haciendoList.value =
        notes.where((note) => note.status == 'Haciendo').toList();
    terminadoList.value =
        notes.where((note) => note.status == 'Terminado').toList();
  }

  // Método para agregar una tarea
  void agregarTarea(String tarea) async {
    final newNote = NoteModel(text: tarea, status: 'PorHacer');
    await dbHelper.insert(newNote);
    fetchNotes(); // Refresca la lista de notas
  }

  // Método para eliminar una tarea
  void eliminarTarea(int index, String lista) async {
    NoteModel noteToDelete;
    switch (lista) {
      case 'PorHacer':
        noteToDelete = porHacerList[index];
        break;
      case 'Haciendo':
        noteToDelete = haciendoList[index];
        break;
      case 'Terminado':
        noteToDelete = terminadoList[index];
        break;
      default:
        return;
    }
    await dbHelper.delete(noteToDelete.id!);
    fetchNotes(); // Refresca la lista de notas
  }

  // Método para mover una tarea de una lista a otra
  void moverTarea(int index, String listaOrigen, String listaDestino) async {
    NoteModel tarea;
    switch (listaOrigen) {
      case 'PorHacer':
        tarea = porHacerList[index];
        break;
      case 'Haciendo':
        tarea = haciendoList[index];
        break;
      case 'Terminado':
        tarea = terminadoList[index];
        break;
      default:
        return;
    }

    // Actualiza el estado de la tarea
    tarea.status = listaDestino;
    await dbHelper.update(tarea);
    fetchNotes(); // Refresca la lista de notas
  }

  void editarTarea(int index, String nuevoTexto) async {
    NoteModel noteToUpdate = porHacerList[index];
    noteToUpdate.text = nuevoTexto;
    await dbHelper.update(noteToUpdate);
    fetchNotes(); // Refresca la lista de notas
  }
}
