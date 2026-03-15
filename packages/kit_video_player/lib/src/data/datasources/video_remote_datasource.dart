import 'package:dio/dio.dart';
import '../models/video_models.dart';

abstract class VideoRemoteDataSource {
  Future<VideoModel> fetchVideo(String videoId);
}

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final Dio _dio;
  const VideoRemoteDataSourceImpl(this._dio);

  @override
  Future<VideoModel> fetchVideo(String videoId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/videos/$videoId',
    );
    return VideoModel.fromJson(response.data!);
  }
}
