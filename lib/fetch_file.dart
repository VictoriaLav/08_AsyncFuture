import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) async {

  // return rootBundle.loadString(assetsPath).then((file) => file.toString());

  String data = '';
  if (assetsPath.isNotEmpty) {
    try {
      data = await rootBundle.loadString(assetsPath);
    } catch (e) {
      data = 'Файл не найден!';
    }
  }
  return data;
}
