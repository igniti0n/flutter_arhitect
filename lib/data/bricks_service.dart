import 'dart:developer';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mason/mason.dart';

final bricksServiceProvider = Provider<BricksGeneratorService>(
  (_) => BricksGeneratorServiceImpl(),
);

abstract class BricksGeneratorService {
  Future<void> generateBrickFrom({required String bundlePath});
}

/// Current idea is to have gather brics information locally from a bundled brick
///
/// Also probably possible is to gather th ebrick from url (git, or brickhub)
///
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
    const String fileName = 'suggested_name.txt';
    const String path =
        '/Users/istajcer/Desktop/testsmth/test/'; // await getSavePath(suggestedName: fileName);
    // if (path == null) {
    //   // Operation was canceled by the user.
    //   return;
    // }

    log('Generating....!');

    ByteData bytes = await rootBundle.load(
        'assets/bundled_bricks/clean_repository.bundle'); //load sound from assets
    Uint8List bundleBytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    // File('assets/bundled_bricks/clean_repository.bundle').readAsBytesSync();
    final masonBundle = await MasonBundle.fromUniversalBundle(bundleBytes);
    final generator = await MasonGenerator.fromBundle(masonBundle);
    final directory = Directory.fromUri(Uri.parse('smth/'));
    // Generate code based on the bundled brick.
    final generatedFiles = await generator.generate(
      DirectoryGeneratorTarget(
        directory,
      ),
    );

    log('Generated files length is ${generatedFiles.length}');
    for (var file in generatedFiles) {
      final filePath = path + file.path;
      log('Filepath: full $filePath');

      final Uint8List fileData = Uint8List.fromList('Hello World!'.codeUnits);
      const String mimeType = 'text/plain';
      final XFile textFile =
          XFile.fromData(fileData, mimeType: mimeType, name: fileName);
      await textFile.saveTo(path);
    }

    // log('Generated files!');
    // log('Generated file status ${generatedFiles[1].status}');
    // log('Generated file path ${generatedFiles[1].path}');
  }

  Future<void> saveFile() async {
    const String fileName = 'suggested_name.txt';
    const String path =
        '/Users/istajcer/Desktop/test/'; //await getSavePath(suggestedName: fileName);
    if (path == null) {
      // Operation was canceled by the user.
      return;
    }

    final Uint8List fileData = Uint8List.fromList('Hello World!'.codeUnits);
    const String mimeType = 'text/plain';
    final XFile textFile =
        XFile.fromData(fileData, mimeType: mimeType, name: fileName);
    await textFile.saveTo(path);
  }
}
