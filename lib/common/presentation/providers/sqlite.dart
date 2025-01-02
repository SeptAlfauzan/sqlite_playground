import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sql_playground/helper/sqlite.dart';

part 'sqlite.g.dart';

@Riverpod(keepAlive: true)
SQLite sqLite(ref) {
  return SQLite();
}
