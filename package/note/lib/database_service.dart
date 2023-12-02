library database_service;

import 'dart:developer';
import 'dart:io';
import 'package:flutter/rendering.dart';
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
            ${columns[ColumnNames.date]} TEXT NOT NULL
            )''',
        );
      },
      version: 1,
    );
  }

  Future create(Note note) async {
    final Database db = await initialize();

    Map<String,dynamic> data = note.toMap();
    data["date"] = DateTime.now().toIso8601String();

    final id = await db.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Note>> get() async {
    final Database db = await initialize();
    final List<Map<String, Object?>> queryResult =
        await db.query(tableName, orderBy: 'DATETIME(${columns[ColumnNames.date]})');

    return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  Future update(Note n) async {
    Database db = await initialize();

    await db.update(
      tableName,
      {
        if(n.title != "") "title":n.title,
        if(n.body != "") "body":n.body,
        "date" : DateTime.now().toIso8601String()
      },
      where: 'id = ?',
      whereArgs: [n.id],
      conflictAlgorithm: ConflictAlgorithm.rollback
    );

  }

  Future delete(int id) async {
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