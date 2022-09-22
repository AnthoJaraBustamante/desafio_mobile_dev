import 'package:hive/hive.dart';

part 'photo_model.g.dart';

@HiveType(typeId: 0)
class PhotoModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String url;

  PhotoModel({
    required this.id,
    required this.url,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      url: json['url'],
    );
  }
}
//build_runner build --delete-conflicting-outputs