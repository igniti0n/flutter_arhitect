import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedFeatureTabProviderProvider = StateProvider<String>((ref) {
  return 'Authentication';
});
