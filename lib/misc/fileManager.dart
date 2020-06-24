// PrevenTech
// fileManager.dart
// Utility used to easily interact with JSON files
//
// Copyright (c) 2020 Jacobo Soffer.
import 'dart:io';
import 'dart:convert';
import 'package:preven_tech/location/libLocation.dart';
import 'package:preven_tech/misc/user.dart';
import 'package:path_provider/path_provider.dart';

// Paths to the files used to store data
const LOCATION_REGISTRY = 'locationRegitry.json';
const USER_DATA = 'userData.json';

class FileManager {
  static Future<String> _getDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  static Future<File> _getFile(String f) async {
    final path = await FileManager._getDirectoryPath();
    return File('$path/$f');
  }

  static dynamic readFile(String  path) async {
    try {
      final file = await _getFile(path);
      if (!file.existsSync()) {
        await file.create();
        if (path == USER_DATA) {
          await file.writeAsString(jsonEncode(User.toMap()));
        }
        if (path == LOCATION_REGISTRY) {
          await file.writeAsString(jsonEncode(LocationRegistry.locations));
        }
      }
      var contents = await file.readAsString();
      return jsonDecode(contents);
    } catch(e) {
      return <Map<dynamic, dynamic>>[];
    }
  }
  static Future<File> writeFile(dynamic data, String path) async {
    final file = await _getFile(path);
    return file.writeAsString(jsonEncode(data));
  }
     
}