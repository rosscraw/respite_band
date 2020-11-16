import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseClient{
  Database _db;

  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, "tradecraft.db");

    _db = await openDatabase(dbPath, version: 1,
        onCreate: this._create);
  }

  Future _create(Database db, int version) async {
    await db.execute("""
            CREATE TABLE story (
              id INTEGER PRIMARY KEY, 
              user_id INTEGER NOT NULL,
              title TEXT NOT NULL,
              body TEXT NOT NULL,
              FOREIGN KEY (user_id) REFERENCES user (id) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )""");

    await db.execute("""
            CREATE TABLE bandmember (
              id INTEGER PRIMARY KEY,
              name TEXT NOT NULL UNIQUE,
              plays TEXT NOT NULL,
              
            )""");
  }
}