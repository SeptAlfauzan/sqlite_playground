import 'package:flutter/material.dart';
import 'package:sql_playground/helper/sqlite.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/datatable.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/organism/editor.dart';
import 'package:sql_playground/ui/window_screen.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

class PlaygroundView extends StatefulWidget {
  const PlaygroundView({
    super.key,
  });
  @override
  State<PlaygroundView> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends State<PlaygroundView> {
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
    final screenHeightSize = WindowScreen().calculateScreenHeight(context);

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Playground"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(
            child: Editor(
              height: 200,
            ),
          ),
          SizedBox(
            height: screenHeightSize == ScreenHeightSize.COMPACT ? 120 : 240,
            child: Datatable(
              records: _userRecord,
            ),
          )
        ],
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
      ),
    );
  }
}
