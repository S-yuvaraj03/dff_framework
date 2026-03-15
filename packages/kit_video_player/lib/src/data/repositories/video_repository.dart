import 'package:dio/dio.dart';
import 'package:kit_core/kit_core.dart';
import 'package:kit_video_player/src/domain/entities/video_entity.dart';
import '../../domain/repositories/video_repository.dart';
import '../datasources/video_remote_datasource.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource _remote;
  const VideoRepositoryImpl(this._remote);

  @override
  Future<VideoEntity> fetchVideo(String videoId) async {
    try {
      final model = await _remote.fetchVideo(videoId);
      return model.toEntity();
    } on DioException catch (e) {
      throw NetworkFailure(
        message: e.response?.statusMessage ?? 'Network error',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }
}
