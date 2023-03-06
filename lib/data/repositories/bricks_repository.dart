import 'package:flutter_arhitect/data/bricks_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bricksRepositoryProvider = Provider<BricksRepository>(
  (ref) => BricksRepositoryImpl(
    ref.read(bricksServiceProvider),
  ),
);

abstract class BricksRepository {
  Future<void> generateBrickFrom({required String bundlePath});
}

class BricksRepositoryImpl extends BricksRepository {
  final BricksGeneratorService _bricksGeneratorService;

  BricksRepositoryImpl(this._bricksGeneratorService);

  @override
  Future<void> generateBrickFrom({required String bundlePath}) async {
    await _bricksGeneratorService.generateBrickFrom(bundlePath: bundlePath);
  }
}
