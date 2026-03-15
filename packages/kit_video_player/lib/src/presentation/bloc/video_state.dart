part of 'video_bloc.dart';

sealed class VideoState extends Equatable {
  const VideoState();
  @override
  List<Object?> get props => [];
}

final class VideoInitial extends VideoState {
  const VideoInitial();
}

final class VideoLoading extends VideoState {
  const VideoLoading();
}

final class VideoReady extends VideoState {
  final VideoEntity video;
  const VideoReady(this.video);
  @override
  List<Object?> get props => [video.id];
}

final class VideoBuffering extends VideoState {
  final VideoEntity video;
  const VideoBuffering(this.video);
  @override
  List<Object?> get props => [video.id];
}

final class VideoError extends VideoState {
  final String message;
  final String videoId;
  const VideoError({required this.message, required this.videoId});
  @override
  List<Object?> get props => [message, videoId];
}
