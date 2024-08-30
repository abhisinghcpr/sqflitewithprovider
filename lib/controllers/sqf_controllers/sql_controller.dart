import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/sqf_models/sqf_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDataBase();
    return _db;
  }

  Future<Database> initDataBase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentDirectory.path} / notes.db";

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
     await db.execute('''
  CREATE TABLE Music (
    id INTEGER PRIMARY KEY,
    title TEXT,
    artists TEXT,
    producer TEXT,
    releaseTime TEXT,
    companyDetails TEXT
  )'''
     );

  }

  Future<List<MusicDataModel>> getNoteList() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> queryResult = await dbClient!.query('Music');

    return queryResult.map((e) => MusicDataModel.fromJson(e)).toList();
  }

  Future<void> delete(int id) async {
    var dbClient = await db;
    await dbClient!.delete(
      'Music',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertData(MusicDataModel dataModel) async {
    var dbClient = await db;
    await dbClient!.insert('Music', dataModel.toJson());
  }


  Future<int> updateData(MusicDataModel updatedData) async {
    var dbClient = await db;
    return await dbClient!.update(
      'music',
      updatedData.toJson(),
      where: 'id =?',
      whereArgs: [updatedData.id],
    );
  }
}
