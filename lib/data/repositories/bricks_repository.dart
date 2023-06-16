import 'package:file_selector/file_selector.dart';
import 'package:flutter_arhitect/app/main.dart';
import 'package:flutter_arhitect/data/services/bricks_generator_service.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final savePath = await getDirectoryPath();
    if (savePath == null) return;
    for (final element in arhitectureElements) {
      await _bricksGeneratorService.generateBrickLocallyFrom(
        baseArhitectureElement: element,
        savePath: savePath,
        projectName: projectName,
        featureName: featureName,
      );
    }
  }
}
