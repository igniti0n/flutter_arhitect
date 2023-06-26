import 'package:flutter_arhitect/data/services/file_service.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final featuresRepositoryProvider = Provider<FeaturesRepository>(
  (ref) => FeaturesRepositoryImpl(
    ref.watch(fileServiceProvider),
    // ref.watch(databaseFeaturesManagerProvider),
  ),
);

abstract class FeaturesRepository {
  Future<List<String>> getFeatrues();
  Future<void> addFeature({
    required String featureName,
  });
  Future<void> deleteFeature({
    required String featureName,
  });
  Future<void> updateFeature({
    required AllArhitectureElements arhitectureElements,
  });
}

class FeaturesRepositoryImpl extends FeaturesRepository {
  // final DatabaseManager<FeatureStorage> _databaseFeaturesManager;
  final FileService _fileService;

  FeaturesRepositoryImpl(this._fileService);

  @override
  Future<List<String>> getFeatrues() {
    return _fileService.listFiles();
  }

  @override
  Future<void> addFeature({required String featureName}) {
    return _fileService.writeData(featureName, {});
  }

  @override
  Future<void> deleteFeature({required String featureName}) {
    return _fileService.deleteData(featureName);
  }

  @override
  Future<void> updateFeature(
      {required AllArhitectureElements arhitectureElements}) {
    // TODO: implement updateFeature
    throw UnimplementedError();
  }
}
