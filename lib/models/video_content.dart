// video_content.dart
class VideoContent {
  final String id;
  final String title;
  final Map<String, String> videoUrls; // Bahasa -> URL

  VideoContent({
    required this.id,
    required this.title,
    required this.videoUrls,
  });
}
