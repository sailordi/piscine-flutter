import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseAdapter {
  late Database _db;

  DatabaseAdapter();

  Future create(String name,List<String> createStmts,{int version = 1}) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dbPath = join(dir.path,name);

    _db = await openDatabase(
      dbPath,
      version: version,
      onCreate: (Database db, int version) async {
        for(String createStmt in createStmts) {
          await db.execute(createStmt);
        }
      },
    );

  }

  Future<List<Map<String,dynamic> > > select(String query) async {
    return await _db.rawQuery(query);
  }

  Future insert(String table,Map<String,dynamic> values) async {
    await _db.insert(table,values);
  }

  Future update(String table,Map<String,dynamic> values,String where,List<dynamic> args) async {
    await _db.update(table, values,where: where,whereArgs: args);
  }

  Future remove(String table,String where,List<dynamic> args) async {
    await _db.delete(table,where: where,whereArgs: args);
  }

  Future close() async {
    await _db.close();
  }

}