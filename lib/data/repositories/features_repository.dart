import 'package:flutter_arhitect/data/database_models/feature_storage.dart';
import 'package:flutter_arhitect/data/managers/database_manager.dart';
import 'package:flutter_arhitect/domain/all_arhitecture_elements_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final featuresRepositoryProvider = Provider<FeaturesRepository>(
  (ref) => FeaturesRepositoryImpl(
    ref.watch(databaseFeaturesManagerProvider),
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
  final DatabaseManager<FeatureStorage> _databaseFeaturesManager;

  FeaturesRepositoryImpl(this._databaseFeaturesManager);

  @override
  Future<List<String>> getFeatrues() {
    return _databaseFeaturesManager.getAllFromCache(
      boxName: FeatureStorage.boxName,
    );
  }

  @override
  Future<void> addFeature({required String featureName}) {
    return _databaseFeaturesManager.addToCache(
      key: featureName,
      cachedObject: FeatureStorage(elements: [], addedAt: DateTime.now()),
      boxName: FeatureStorage.boxName,
    );
  }

  @override
  Future<void> deleteFeature({required String featureName}) {
    return _databaseFeaturesManager.deleteCache(
      key: featureName,
      boxName: FeatureStorage.boxName,
    );
  }

  @override
  Future<void> updateFeature(
      {required AllArhitectureElements arhitectureElements}) {
    // TODO: implement updateFeature
    throw UnimplementedError();
  }
}
