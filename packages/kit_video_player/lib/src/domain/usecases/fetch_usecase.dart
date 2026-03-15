import 'package:kit_core/kit_core.dart';
import '../entities/video_entity.dart';
import '../repositories/video_repository.dart';

class FetchVideoUseCase extends Usecase<VideoEntity, String> {
  final VideoRepository _repository;
  const FetchVideoUseCase(this._repository);

  @override
  Future<VideoEntity> call(String videoId) => 
      _repository.fetchVideo(videoId);
}
