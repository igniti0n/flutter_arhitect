import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mason/mason.dart';

final bricksServiceProvider = Provider<BricksGeneratorService>(
  (_) => BricksGeneratorServiceImpl(),
);

abstract class BricksGeneratorService {
  Future<void> generateBrickFrom({required String bundlePath});
}

class BricksGeneratorServiceImpl extends BricksGeneratorService {
  @override
  Future<void> generateBrickFrom({required String bundlePath}) async {
    // Create a MasonGenerator from the existing bundle.
    // final generator = await MasonGenerator.fromBrick(
    //   Brick.git(
    //     const GitPath(
    //         'https://github.com/igniti0n/bricks/tree/main/clean_repository'),
    //   ),
    // );
    log('Generating....!');

    ByteData bytes = await rootBundle.load(
        'assets/bundled_bricks/clean_repository.bundle'); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    // File('assets/bundled_bricks/clean_repository.bundle').readAsBytesSync();
    final masonBundle = await MasonBundle.fromUniversalBundle(soundbytes);
    final generator = await MasonGenerator.fromBundle(masonBundle);
    final directory =
        Directory.fromUri(Uri.parse('../../../../Documents/smth'));
// Generate code based on the bundled brick.
    final generatedFiles = await generator.generate(
      DirectoryGeneratorTarget(
        directory,
      ),
    );

    log('Generated files!');
    log('Generated file status ${generatedFiles[1].status}');
    log('Generated file path ${generatedFiles[1].path}');
  }
}
