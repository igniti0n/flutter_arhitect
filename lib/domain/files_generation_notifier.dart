import 'package:flutter_arhitect/data/repositories/bricks_repository.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:flutter_arhitect/domain/common/request_notifier/request_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filesGenerationNotifier =
    StateNotifierProvider<FilesGenerationNotifier, void>((ref) {
  return FilesGenerationNotifier(
    ref.read(bricksRepositoryProvider),
    ref,
  );
});

class FilesGenerationNotifier extends RequestNotifier<void> {
  final BricksRepository _bricksRepository;
  final Ref _ref;
  FilesGenerationNotifier(
    this._bricksRepository,
    this._ref,
  ) : super();

  void generate() => executeRequest(
        requestBuilder: () async {
          final allArhitectureElements = _ref.read(
            allArhitectureElementsNotifier,
          );
          await _bricksRepository.generateBricksFor(
              arhitectureElements: allArhitectureElements);
        },
      );
}
