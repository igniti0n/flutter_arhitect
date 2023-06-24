import 'package:flutter_arhitect/data/repositories/features_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featuresProvider = StateNotifierProvider<FeaturesNotifier, List<String>>(
  (ref) => FeaturesNotifier(
    ref.watch(featuresRepositoryProvider),
  ),
);

class FeaturesNotifier extends StateNotifier<List<String>> {
  final FeaturesRepository featuresRepository;

  FeaturesNotifier(
    this.featuresRepository,
  ) : super([]) {
    getFeatures();
  }

  Future<void> getFeatures() async {
    state = await featuresRepository.getFeatrues();
  }

  Future<void> addFeature({
    required String featureName,
  }) async {
    await featuresRepository.addFeature(
      featureName: featureName,
    );
    await getFeatures();
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
