import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do_list_nocountry/home/models/note_model.dart';

class Sqlite_Note_DB_Services {
  static final Sqlite_Note_DB_Services _instance =
      Sqlite_Note_DB_Services._internal();
  factory Sqlite_Note_DB_Services() => _instance;
  Sqlite_Note_DB_Services._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, status TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insert(NoteModel note) async {
    final db = await database;
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<NoteModel>> notes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return NoteModel.fromMap(maps[i]);
    });
  }

  Future<void> update(NoteModel note) async {
    final db = await database;
    await db.update(
      'notes',
      note.toMap(),
      where: "id = ?",
      whereArgs: [note.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db.delete(
      'notes',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
