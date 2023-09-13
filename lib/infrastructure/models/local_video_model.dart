import 'package:randomvideos/domain/entities/video_post.dart';

class LocalVideoModel {
  final String user;
  final String videoUrl;
  final String title;
  final int likes;
  final int views;
  final int coments;
  final String sound;

  LocalVideoModel(
      {required this.user,
      required this.title,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0,
      this.coments = 0,
      required this.sound});

  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) =>
      LocalVideoModel(
          user: json["user"] ?? 'No user',
          title: json["title"] ?? 'No name',
          videoUrl: json["videoUrl"],
          likes: json["likes"] ?? 0,
          views: json["views"] ?? 0,
          coments: json["coments"] ?? 0,
          sound: json["sound"] ?? 'Not Sound'
          );

  Map<String, dynamic> toJson() => {};

  VideoPost toVideoPostEntity() => VideoPost(
      user: user,
      caption: title,
      videoUrl: videoUrl,
      likes: likes,
      views: views,
      coments: coments,
      sound: sound);
}
