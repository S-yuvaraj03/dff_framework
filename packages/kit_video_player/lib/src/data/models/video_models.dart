import '../../domain/entities/video_entity.dart';

class VideoModel {
  final String id;
  final String url;
  final String title;
  final int durationSeconds;

  const VideoModel(
      {required this.id,
      required this.url,
      required this.title,
      required this.durationSeconds});

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json['id'],
        url: json['url'],
        title: json['title'],
        durationSeconds: json['durationSeconds'] as int,
      );

  VideoEntity toEntity() => VideoEntity(
      id: id,
      url: url,
      title: title,
      duration: Duration(seconds: durationSeconds));
}
