part of 'video_bloc.dart';

sealed class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object?> get props => [];
}

final class VideoLoadRequested extends VideoEvent {
  final String videoId;
  const VideoLoadRequested(this.videoId);

  @override
  List<Object?> get props => [videoId];
}

final class VideoBufferingStarted extends VideoEvent {}

final class VideoBufferingStopped extends VideoEvent {}

final class VideoRetryRequested extends VideoEvent {}
