import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<File> fileFromImageUrl(String url) async {
  Dio dio = Dio();
  final response =
      await dio.get(url, options: Options(responseType: ResponseType.bytes));

  final Directory documentDirectory = await getApplicationDocumentsDirectory();
  final String now = DateTime.now().millisecondsSinceEpoch.toString();
  final File file = File(join(documentDirectory.path, 'image_$now.jpg'));
 
  file.writeAsBytesSync(response.data);

  return file;
}
 