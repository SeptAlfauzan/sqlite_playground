import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_playground/helper/sqlite.dart';
import 'package:sql_playground/modules/playground/presentation/playground_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Playground',
      theme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Flutter SQLite Playground Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SQLite? sqlite;
  List<Map<String, dynamic>> _userRecord = [];
  List<String> _tablesName = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        sqlite = SQLite();

        await getUsers();
      },
    );
  }

  Future<int> insertUser() async {
    final record = {'name': 'test', 'email': 'test@email.com'};
    return await (await sqlite?.database)?.insert('users', record) ?? 0;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    const sql = 'SELECT * FROM users';
    final result = await (await sqlite?.database)?.rawQuery(sql);
    return result ?? [];
  }

  Future<List<Map<String, dynamic>>> getDbTables() async {
    final tables = await sqlite?.getTables() ?? [];
    return tables;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SingleChildScrollView(child: PlaygroundView(records: _userRecord)
          //Column(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.center,
          //  children: <Widget>[
          //    Text('table Users records length ${_userRecord.length}'),
          //    const Text(
          //      'Table name,
          //    ),
          //    ..._tablesName.map((tbName) => Text(tbName))
          //  ],
          //),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await insertUser();
          final userRecords = await getUsers();
          await getDbTables();

          final tableName = await sqlite?.getTablesName();

          setState(() {
            _userRecord = userRecords;
            _tablesName = tableName ?? [];
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
