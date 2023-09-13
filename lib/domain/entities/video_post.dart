class VideoPost {
  final String caption;
  final String user;
  final String videoUrl;
  final int likes;
  final int views;
  final int coments;
  final String sound;

  VideoPost(
      {required this.caption,
      required this.user,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0,
      this.coments = 0,
      required this.sound});
}
