import 'dart:developer';
import 'dart:io';

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mason/mason.dart';

final bricksServiceProvider = Provider<BricksGeneratorService>(
  (_) => BricksGeneratorServiceImpl(),
);

abstract class BricksGeneratorService {
  Future<void> generateBrickLocallyFrom({
    required BaseArhitectureElement baseArhitectureElement,
    required String savePath,
  });
}

class BricksGeneratorServiceImpl extends BricksGeneratorService {
  @override
  Future<void> generateBrickLocallyFrom({
    required BaseArhitectureElement baseArhitectureElement,
    required String savePath,
  }) async {
    // Create a MasonGenerator from the existing bundle.

    log('Generating....!');
    final generator =
        await MasonGenerator.fromBrick(baseArhitectureElement.brick);
    // generator.hooks.preGen(workingDirectory: path);

    final directory = Directory.fromUri(Uri.parse(savePath));
    final generatedFiles = await generator.generate(
      DirectoryGeneratorTarget(directory),
      vars: baseArhitectureElement.toBrickModel().toMap(),

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
    log('generatedFiles: $generatedFiles');
  }
}
