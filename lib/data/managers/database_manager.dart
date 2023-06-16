import 'dart:developer';

import 'package:flutter_arhitect/data/database_models/database_storage.dart';
import 'package:flutter_arhitect/data/database_models/feature_storage.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final databaseFeaturesManagerProvider =
    Provider<DatabaseManager<FeatureStorage>>((ref) {
  return DatabaseManagerImpl<FeatureStorage>();
});

abstract class DatabaseManager<T> {
  Future<void> addToCache({
    required dynamic key,
    required String boxName,
    required T cachedObject,
  });

  Future<T?> getFromCache({
    required dynamic key,
    required String boxName,
  });

  Future<void> deleteCache({
    required dynamic key,
    required String boxName,
  });
}

class DatabaseManagerImpl<T extends DatabaseStorage>
    extends DatabaseManager<T> {
  @override
  Future<void> addToCache({
    required dynamic key,
    required String boxName,
    required T cachedObject,
  }) async {
    final box = Hive.box<T>(boxName);
    await box.put(
      key,
      cachedObject,
    );
  }

  @override
  Future<T?> getFromCache({
    required dynamic key,
    required String boxName,
  }) async {
    final box = Hive.box<T>(boxName);
    final cachedObject = box.get(key);
    if (cachedObject != null) {
      log('Data found! Returing cached data: $cachedObject)');
      return cachedObject;
    }
    log('Cache empty or invalid, returning nothing...');

    return null;
  }

  @override
  Future<void> deleteCache({
    required dynamic key,
    required String boxName,
  }) async {
    final box = Hive.box<T>(boxName);
    await box.delete(key);
  }
}
