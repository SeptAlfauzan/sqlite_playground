import 'package:flutter/material.dart';
import 'package:sql_playground/helper/sqlite.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/datatable.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/zah_custom_path.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/zah_custom_path_reverse.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/organism/editor.dart';
import 'package:sql_playground/ui/colors.dart';
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
  String _query = '';

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

  Future<void> onPressRun() async {
    await insertUser();
    final userRecords = await getUsers();
    await getDbTables();

    final tableName = await sqlite?.getTablesName();

    setState(() {
      _userRecord = userRecords;
      _tablesName = tableName ?? [];
    });

    try {
      await sqlite?.executeRawQuery(_query);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeightSize = WindowScreen().calculateScreenHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Playground"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              children: [
                //Expanded(
                //  child:
                Editor(
                  height: double.infinity,
                  onUpdate: (query) {
                    setState(
                      () {
                        _query = query;
                      },
                    );
                  },
                  //),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () async {
                      await onPressRun();
                    },
                    child: const Text("Run"),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 0.4,
            endIndent: 0,
            color: Colors.grey,
          ),
          Container(
              height: screenHeightSize == ScreenHeightSize.COMPACT ? 120 : 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipPath(
                        clipper: ZahCustomPath(),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFFA89984),
                          ),
                          width: 100,
                          child: Text(
                            "Output",
                            style: TextStyle(color: Color(0xFF282828)),
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: ZahCustomPathRevese(),
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: AppColors.darkGreen,
                            ),
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.hourglass_top_outlined),
                                Text(
                                  "12:12",
                                  style: TextStyle(color: Color(0xFF282828)),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Datatable(
                      records: _userRecord,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
