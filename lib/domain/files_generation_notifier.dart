import 'package:flutter_arhitect/data/repositories/bricks_repository.dart';
import 'package:flutter_arhitect/domain/common/request_notifier/request_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filesGenerationNotifier =
    StateNotifierProvider<FilesGenerationNotifier, void>((ref) {
  return FilesGenerationNotifier(
    ref.read(bricksRepositoryProvider),
  );
});

class FilesGenerationNotifier extends RequestNotifier<void> {
  final BricksRepository _bricksRepository;
  FilesGenerationNotifier(this._bricksRepository) : super();

  void generate() => executeRequest(
        requestBuilder: () async {
          await _bricksRepository.generateBrickFrom(bundlePath: '');
        },
      );
}
