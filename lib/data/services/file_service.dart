import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final fileServiceProvider = Provider<FileService>((ref) {
  return FileServiceImpl();
});

abstract class FileService {
  Future<File> writeData(String fileName, Map<String, dynamic> data);
  Future<Map<String, dynamic>> readData(String fileName);
  Future<void> deleteData(String fileName);
  Future<List<String>> listFiles();
}

class FileServiceImpl extends FileService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/flutter_arhitect/database/';
  }

  @override
  Future<File> writeData(String fileName, Map<String, dynamic> data) async {
    final file = await _localFile(fileName);
    return file.writeAsString(jsonEncode(data), mode: FileMode.write);
  }

  @override
  Future<Map<String, dynamic>> readData(String fileName) async {
    try {
      final file = await _localFile(fileName);
      final contents = await file.readAsString();
      return jsonDecode(contents);
    } catch (e) {
      log('Error reading file: $e');
      return <String, dynamic>{};
    }
  }

  @override
  Future<void> deleteData(String fileName) async {
    final file = await _localFile(fileName);
    await file.delete();
  }

  @override
  Future<List<String>> listFiles() async {
    final path = await _localPath;
    final directory = Directory(path);
    final files = directory.listSync();
    return files
        .map((file) => file.path.split('/').last.split('.').first)
        .toList();
  }

  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName.txt');
  }
}
