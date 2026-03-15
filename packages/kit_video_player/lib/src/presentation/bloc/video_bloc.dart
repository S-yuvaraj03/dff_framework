import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kit_core/kit_core.dart';
import 'package:kit_video_player/src/domain/entities/video_entity.dart';
import 'package:kit_video_player/src/domain/usecases/fetch_usecase.dart';
import 'package:equatable/equatable.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final FetchVideoUseCase _fetchVideo;
  VideoBloc(this._fetchVideo) : super(VideoInitial()) {
    on<VideoLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
    VideoLoadRequested event,
    Emitter<VideoState> emit,
  ) async {
    emit(const VideoLoading());
    await _load(event.videoId, emit);
  }

  Future<void> _load(String videoId, Emitter<VideoState> emit) async {
    try {
      final video = await _fetchVideo(videoId);
      emit(VideoReady(video));
    } on Failure catch (f) {
      emit(VideoError(message: f.message, videoId: videoId));
    } catch (e) {
      emit(VideoError(message: 'Unexpected Error', videoId: videoId));
    }
  }
}
