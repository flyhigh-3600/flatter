import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

class FoldersDatabase {
  late Database db;

  FoldersDatabase() {
    openDatabase();
  }

  void openDatabase() async {
    Directory dataDirectory = await getApplicationSupportDirectory();
    print(dataDirectory.path);
    String path = dataDirectory.path;
    path = "${path}/flatter_library_folders.sqlite";
    print(path);
    db = sqlite3.open(path);
    createTables();
  }

  void closeDatabase() {
    db.close();
  }

  void createTables() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS folder (
        id INTEGER NOT NULL UNIQUE,
        path TEXT NOT NULL UNIQUE,
        name TEXT NOT NULL,
        isFavorited INTEGER NOT NULL,
        PRIMARY KEY (id AUTOINCREMENT)
      )
    ''');
  }

  void addFolder(String path, String name) {
    db.execute('''
      IF NOT EXISTS (SELECT * FROM folder WHERE path = '$path')
      BEGIN
        INSERT INTO folder (path,name,isFavorited)
        VALUES
        ('$path','$name',0)
      END
    ''');
  }

  ResultSet getFolders() {
    ResultSet resultSet = db.select(
      'SELECT * FROM folder'
    );
    return resultSet;
  }
}