import 'package:file_selector/file_selector.dart';
import 'package:flutter_arhitect/data/bricks_service.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bricksRepositoryProvider = Provider<BricksRepository>(
  (ref) => BricksRepositoryImpl(
    ref.read(bricksServiceProvider),
  ),
);

abstract class BricksRepository {
  Future<void> generateBricksFor({
    required AllArhitectureElements arhitectureElements,
  });
}

class BricksRepositoryImpl extends BricksRepository {
  final BricksGeneratorService _bricksGeneratorService;

  BricksRepositoryImpl(this._bricksGeneratorService);

  @override
  Future<void> generateBricksFor({
    required AllArhitectureElements arhitectureElements,
  }) async {
    final savePath = await getDirectoryPath() ?? "";
    for (var element in arhitectureElements) {
      await _bricksGeneratorService.generateBrickLocalyFrom(
        bundlePath: 'assets/bundled_bricks/${element.brickBundleName}.bundle',
        brickModel: element.toBrickModel(),
        savePath: savePath,
      );
    }
  }
}
