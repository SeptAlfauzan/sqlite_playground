import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sql_playground/common/presentation/providers/sqlite.dart';
import 'package:sql_playground/constanta.dart';
import 'package:sql_playground/helper/sqlite.dart';
import 'package:sql_playground/modules/erd/domain/dto/database_schema.dart';
import 'package:sql_playground/modules/erd/domain/dto/erd_line_position.dart';
import 'package:sql_playground/modules/erd/domain/dto/erd_visualizator_dto.dart';
import 'package:sql_playground/modules/erd/domain/dto/position.dart';
import 'package:sql_playground/modules/erd/presentation/providers/erd_line_connector.dart';

part 'erd_visualizator.g.dart';

@Riverpod()
class ErdVisualizator extends _$ErdVisualizator {
  @override
  ErdVisualizatorDto build() => const ErdVisualizatorDto.initial();

  Future<void> getTablesInfo() async {
    try {
      state = const ErdVisualizatorDto.loading();

      final SQLite sqlite = ref.read(sqLiteProvider);
      final result = await sqlite.getTablesInfo();

      final databaseSchema = DatabaseSchema.fromMap(result);
      state = ErdVisualizatorDto.success(result: databaseSchema);

      final nestedFks =
          databaseSchema.tables.map((table) => table.foreignKeys).toList();
      final fks = nestedFks.expand((fk) => fk).toList();

      final tableNames = await sqlite.getTablesName();

      final initialErdLinePositions = fks.map((fk) {
        final firstEntityXPos =
            tableNames.indexOf(fk.fromTable) * defaultDistanceErdEntity;
        final firstEntityYPos = databaseSchema.tables
                .where((table) => table.tableName == fk.fromTable)
                .first
                .columns
                .length *
            defaultRowHeightErdEntity;
        final secondEntityXPos =
            tableNames.indexOf(fk.table) * defaultDistanceErdEntity;
        final secondEntityYPos = databaseSchema.tables
                .where((table) => table.tableName == fk.table)
                .first
                .columns
                .length *
            defaultRowHeightErdEntity;

        return ErdLinePosition(
          firstEntityName: fk.fromTable,
          secondEntityName: fk.table,
          firstEntityPos: Position(x: firstEntityXPos, y: firstEntityYPos / 2),
          secondEntityPos:
              Position(x: secondEntityXPos, y: secondEntityYPos / 2),
        );
      }).toList();
      ref
          .read(erdLineConnectorProvider.notifier)
          .initialize(values: initialErdLinePositions);
    } catch (e) {
      state = ErdVisualizatorDto.fail(error: e.toString());
    }
  }
}
