import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

Future<File?> writeToFile(String name, String text) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/$name');

  if(file.existsSync()){
    await file.delete();
  }

  return await file.writeAsString(text);
}

Future<String?> readAtFile(
  String name,
) async {
  String? text;
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/${name}');
    text = await file.readAsString();
  } catch (e) {
    if (kDebugMode) {
      print("Couldn't read file");
    }
  }
  return text;
}
