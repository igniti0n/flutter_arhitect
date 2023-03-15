import "dart:developer";
import "dart:io";

import "package:flutter/services.dart";
import "package:flutter_arhitect/common/models/arhitecture_elements/brick_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mason/mason.dart";

final bricksServiceProvider = Provider<BricksGeneratorService>(
  (_) => BricksGeneratorServiceImpl(),
);

abstract class BricksGeneratorService {
  Future<void> generateBrickLocalyFrom({
    required String bundlePath,
    required BrickModel brickModel,
    required String savePath,
  });
}

/// Current idea is to have gather brics information locally from a bundled brick
///
/// Also probably possible is to gather th ebrick from url (git, or brickhub)
///
class BricksGeneratorServiceImpl extends BricksGeneratorService {
  @override
  Future<void> generateBrickLocalyFrom({
    required String bundlePath,
    required BrickModel brickModel,
    required String savePath,
  }) async {
    // Create a MasonGenerator from the existing bundle.
    // final generator = await MasonGenerator.fromBrick(
    //   Brick.git(
    //     const GitPath(
    //         "https://github.com/igniti0n/bricks/tree/main/clean_repository"),
    //   ),
    // );

    log("Generating....!");
    ByteData bytes = await rootBundle.load(bundlePath); //load sound from assets
    Uint8List bundleBytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    // File("assets/bundled_bricks/clean_repository.bundle").readAsBytesSync();
    final masonBundle = await MasonBundle.fromUniversalBundle(bundleBytes);

    final generator = await MasonGenerator.fromBundle(masonBundle);
    // generator.hooks.preGen(workingDirectory: path);

    final directory = Directory.fromUri(Uri.parse(savePath));
    // Generate code based on the bundled brick.
    final generatedFiles = await generator.generate(
      DirectoryGeneratorTarget(
        directory,
      ),
      // fileConflictResolution: FileConflictResolution.,
      vars: brickModel.toMap(),

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
