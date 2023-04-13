import 'dart:io';

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mason/mason.dart';

final bricksServiceProvider = Provider<BricksGeneratorService>(
  (_) => BricksGeneratorServiceImpl(),
);

abstract class BricksGeneratorService {
  Future<void> generateBrickLocallyFrom({
    required BaseArhitectureElement baseArhitectureElement,
    required String savePath,
    required String projectName,
    required String featureName,
  });
}

class BricksGeneratorServiceImpl extends BricksGeneratorService {
  @override
  Future<void> generateBrickLocallyFrom({
    required BaseArhitectureElement baseArhitectureElement,
    required String savePath,
    required String projectName,
    required String featureName,
  }) async {
    final generator =
        await MasonGenerator.fromBrick(baseArhitectureElement.brick);
    // generator.hooks.preGen(workingDirectory: path);

    final directory = Directory.fromUri(Uri.parse(savePath));
    await generator.generate(
      DirectoryGeneratorTarget(directory),
      vars: baseArhitectureElement.toBrickModel().toMap()
        ..addAll({
          'project_name': projectName,
          'feature_name': featureName,
        }),
      //  {
      //   "name": "ime_neko",
      //   "dependencies": [
      //     {
      //       "dependencyName": "someDependency",
      //     },
      //     {
      //       "dependencyName": "anotherDependency",
      //     },
      //   ],
      //   "methods": [
      //     {
      //       "methodName": "methodName",
      //       "type": "String",
      //       "parameters": [
      //         {
      //           "parameterName": "parameterName",
      //           "type": "int",
      //         }
      //       ],
      //     },
      //   ]
      // },
    );
  }
}
