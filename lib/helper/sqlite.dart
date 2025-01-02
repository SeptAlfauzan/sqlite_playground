import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SQLite {
  static final SQLite _instance = SQLite._internal();
  static Database? _database;

  factory SQLite() {
    return _instance;
  }

  SQLite._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    const sqlUser = '''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL
        )
      ''';

    const sqlEducation = '''
        CREATE TABLE educations (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          address TEXT NOT NULL
        )
    ''';

    if (kIsWeb) {
      sqfliteFfiInit();
      final databaseFactory = databaseFactoryFfiWeb;
      final db = await databaseFactory.openDatabase(inMemoryDatabasePath);

      await db.execute(sqlUser);
      await db.execute(sqlEducation);

      return db;
    }

    return await openDatabase(':memory:', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(sqlUser);
      await db.execute(sqlEducation);
    });
  }

  Future<List<Map<String, dynamic>>> getTables() async {
    const sql = '''
      SELECT * FROM sqlite_master WHERE type='table'
      AND name NOT LIKE 'sqlite_%' AND name NOT LIKE 'android_%'
      ''';
    final List<Map<String, dynamic>> tables =
        await SQLite._database?.rawQuery(sql) ?? [];
    return tables;
  }

  Future<List<String>> getTablesName() async {
    final tables = await getTables();
    return tables
        .map((table) =>
            (table['name'] ?? table['tbl_name'] ?? 'no_name').toString())
        .toList();
  }

  Future<dynamic> executeRawQuery(String query) async {
    return await SQLite._database?.rawQuery(query);
  }
}
