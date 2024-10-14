

String getYoutubeThumbnail(String videoUrl) {
  final Uri? uri = Uri.tryParse(videoUrl);
  if (uri == null) {
    return 'https://img.youtube.com/vi/Tz4s9GXolY8/0.jpg';
  }
  if(uri.queryParameters['v'] == null){
    return 'https://img.youtube.com/vi/Tz4s9GXolY8/0.jpg';
  }


  return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
}