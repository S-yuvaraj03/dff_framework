class VideoEntity {
  final String id;
  final String url;
  final String title;
  final Duration duration;

  const VideoEntity({
    required this.id,
    required this.url,
    required this.title,
    required this.duration,
  });
}
