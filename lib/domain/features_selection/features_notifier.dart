import 'package:flutter_arhitect/data/repositories/features_repository.dart';
import 'package:flutter_arhitect/domain/features_selection/selected_feature_tab_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featuresProvider = StateNotifierProvider<FeaturesNotifier, List<String>>(
  (ref) => FeaturesNotifier(
    ref.watch(featuresRepositoryProvider),
    ref,
  ),
);

class FeaturesNotifier extends StateNotifier<List<String>> {
  final FeaturesRepository featuresRepository;
  final Ref _ref;

  FeaturesNotifier(
    this.featuresRepository,
    this._ref,
  ) : super([]) {
    getFeatures();
  }

  Future<void> getFeatures() async {
    state = await featuresRepository.getFeatrues();
    if (state.isNotEmpty) {
      _ref.read(selectedFeatureTabProviderProvider.notifier).state =
          state.first;
    }
  }

  Future<void> addFeature({
    required String featureName,
  }) async {
    await featuresRepository.addFeature(
      featureName: featureName,
    );
    await getFeatures();
    _ref.read(selectedFeatureTabProviderProvider.notifier).state = featureName;
  }

  Future<void> deleteFeature({
    required String featureName,
  }) async {
    await featuresRepository.deleteFeature(
      featureName: featureName,
    );
    await getFeatures();
  }
}
