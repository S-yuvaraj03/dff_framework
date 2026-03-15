import '../domain/entities/video_entity.dart';

abstract class VideoRepository {
  Future<VideoEntity> fetchVideo(String videoId);
}
