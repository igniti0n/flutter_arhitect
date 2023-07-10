import 'dart:developer';
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

    final variables = baseArhitectureElement.toBrickModel().toMap()
      ..addAll({
        'project_name': projectName,
        'feature_name': featureName,
      });
    // log('Running pre gen...');
    // await generator.hooks.preGen(vars: variables);
    // log('Done!');
    log('Variables: $variables');
    final directory = Directory.fromUri(Uri.parse(savePath));
    await generator.generate(
      DirectoryGeneratorTarget(directory),
      vars: variables,
      fileConflictResolution: FileConflictResolution.skip,
    );
    // final example =
    // {
    //   'feature_name': 'featureName',
    //   'project_name': 'projectName',
    //   'description': 'description',
    //   'name': 'ime_neko',
    //   'dependencies': [
    //     {
    //       'dependencyName': 'someDependency',
    //     },
    //     {
    //       'dependencyName': 'anotherDependency',
    //     },
    //   ],
    //   'methods': [
    //     {
    //       'methodName': 'methodName',
    //       'type': 'String',
    //       'parameters': [
    //         {
    //           'parameterName': 'parameterName',
    //           'type': 'int',
    //         },
    //       ],
    //     },
    //   ],
    // };
  }
}
