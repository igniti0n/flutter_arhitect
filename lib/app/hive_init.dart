import 'package:flutter_arhitect/data/database_models/architecture_layer_storage.dart';
import 'package:flutter_arhitect/data/database_models/base_architecture_element_storage.dart';
import 'package:flutter_arhitect/data/database_models/brick_storage.dart';
import 'package:flutter_arhitect/data/database_models/feature_storage.dart';
import 'package:flutter_arhitect/data/database_models/method_storage.dart';
import 'package:flutter_arhitect/data/database_models/offset_storage.dart';
import 'package:flutter_arhitect/data/database_models/parameter_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FeatureStorageAdapter());
  Hive.registerAdapter(BaseArchitectureElementStorageAdapter());
  Hive.registerAdapter(BrickStorageAdapter());
  Hive.registerAdapter(MethodStorageAdapter());
  Hive.registerAdapter(ParameterStorageAdapter());
  Hive.registerAdapter(ArchitectureLayerStorageAdapter());
  Hive.registerAdapter(OffsetStorageAdapter());
  Hive.registerAdapter(GitPathStorageAdapter());
  await Hive.openBox<FeatureStorage>(FeatureStorage.boxName);
}
