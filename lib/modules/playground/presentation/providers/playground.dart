import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sql_playground/common/presentation/providers/sqlite.dart';
import 'package:sql_playground/helper/sqlite.dart';
import 'package:sql_playground/modules/playground/domain/dto/editor_dto.dart';

part 'playground.g.dart';

@Riverpod()
class PlaygroundEditor extends _$PlaygroundEditor {
  @override
  EditorDto build() => const EditorDto.initial();

  Future<void> executeQuery({required String sql}) async {
    try {
      state = const EditorDto.loading();

      final SQLite sqlite = ref.read(sqLiteProvider);
      final result = await sqlite.executeRawQuery(sql);
      state = EditorDto.success(result: result.toString());
    } catch (e) {
      state = EditorDto.fail(error: e.toString());
    }
  }
}
