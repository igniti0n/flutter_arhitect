import 'package:flutter_riverpod/flutter_riverpod.dart';

final featuresProvider = Provider<List<String>>(
  (ref) {
    return [
      'Authentication',
      'Database',
      'Storage',
      'Hosting',
      'Functions',
      'ML Kit',
      'Crashlytics',
      'Performance',
      'Test Lab',
    ];
  },
);
