import 'package:imgedit/models/edited_image.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('images.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      ''''''
    );

  }

  Future<void> insertImage(EditedImage image) async {
    final db = await instance.database;
    await db.insert('images', image.toMap());
  }

  Future<List<EditedImage>> getImages() async {
    final db = await instance.database;
    final result = await db.query('images');
    return result.map((json) => EditedImage.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
