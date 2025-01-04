import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sql_playground/common/presentation/providers/sqlite.dart';
import 'package:sql_playground/helper/sqlite.dart';
import 'package:sql_playground/modules/erd/domain/dto/database_schema.dart';
import 'package:sql_playground/modules/erd/domain/dto/erd_visualizator_dto.dart';

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
      state =
          ErdVisualizatorDto.success(result: DatabaseSchema.fromMap(result));
    } catch (e) {
      state = ErdVisualizatorDto.fail(error: e.toString());
    }
  }
}
