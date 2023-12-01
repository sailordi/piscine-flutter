library database_service;

import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'note.dart';

enum ColumnNames{id,title,body,date}

const String tableName = "Notes";
const Map<ColumnNames,String> columns = {ColumnNames.id: "id",
  ColumnNames.title: "title",
  ColumnNames.body: "body",
  ColumnNames.date: "date"
};

class DatabaseService {
  Future<Database> initialize() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'note.db'),
      onCreate: (database, version) async {
        await database.execute(
            '''CREATE TABLE $tableName(
            ${columns[ColumnNames.id]} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${columns[ColumnNames.title]} TEXT NOT NULL,
            ${columns[ColumnNames.body]} TEXT NOT NULL,
            ${columns[ColumnNames.date]} TEXT NOT NULL,
            )''',
        );
      },
      version: 1,
    );
  }

  Future create(Note note) async {
    int result = 0;
    final Database db = await initialize();
    final id = await db.insert(tableName, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Note>> get() async {
    final Database db = await initialize();
    final List<Map<String, Object?>> queryResult =
        await db.query(tableName, orderBy: 'DATETIME(${columns[ColumnNames.date]})');

    return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  Future delete(String id) async {
    final Database db = await initialize();
    try {
      await db.delete(tableName, where: '${columns[ColumnNames.id]} = ?', whereArgs: [id]);
    } catch (err) {
      log("Something went wrong when deleting an item: $err");
    }

  }

  Future deleteAll() async {
    final Database db = await initialize();

    try {
      await db.delete(tableName);
    } catch (err) {
      log("Something went wrong when deleting all items");
    }

  }

}