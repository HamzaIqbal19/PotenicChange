import 'package:http/http.dart' as http;

class Videothumbnail {
  // String thumbnailUrl = '';
  String extractThumbnailUrl(String videoUrl) {
    String thumbnailUrl;

    final RegExp youtubeRegExp = RegExp(
        r'(?:https?://)?(?:www\.)?(?:youtube\.com/(?:[^/]+/.*|(?:v|e(?:mbed)?)|.*[?&]v=)|youtu\.be/)([^&?/]{11})');
    final RegExp vimeoRegExp =
        RegExp(r'(?:https?://)?(?:www\.)?vimeo\.com/([0-9]+)');
    final RegExp dailymotionRegExp =
        RegExp(r'(?:https?://)?(?:www\.)?dailymotion\.com/video/([^_]+)');
    final RegExp metacafeRegExp =
        RegExp(r'(?:https?://)?(?:www\.)?metacafe\.com/watch/([^/]+)');
    final RegExp tiktokVideoRegExp = RegExp(
      r'(?:https?:\/\/)?(?:www\.)?(?:tiktok\.com\/(?:@[^\/]+\/)?video\/|vm\.tiktok\.com\/)(\d+)',
    );

    // final match = videoUrlRegExp.firstMatch(videoUrl);
    // Example for YouTube

    if (youtubeRegExp.hasMatch(videoUrl)) {
      final videoId = youtubeRegExp.firstMatch(videoUrl)?.group(1);
      thumbnailUrl = 'https://img.youtube.com/vi/$videoId/0.jpg';
    } else if (vimeoRegExp.hasMatch(videoUrl)) {
      final videoId = vimeoRegExp.firstMatch(videoUrl)?.group(1);
      thumbnailUrl = 'https://vumbnail.com/$videoId.jpg';
    } else if (dailymotionRegExp.hasMatch(videoUrl)) {
      final videoId = dailymotionRegExp.firstMatch(videoUrl)?.group(1);
      thumbnailUrl = 'https://www.dailymotion.com/thumbnail/video/$videoId';
    } else if (metacafeRegExp.hasMatch(videoUrl)) {
      final videoId = metacafeRegExp.firstMatch(videoUrl)?.group(1);
      thumbnailUrl = 'http://www.metacafe.com/thumb/$videoId.jpg';
    } else {
      thumbnailUrl = '';
    }
    print("thumbnail urll $thumbnailUrl");

    return thumbnailUrl;
  }
}
