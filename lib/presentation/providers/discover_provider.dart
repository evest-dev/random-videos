import 'package:flutter/material.dart';
import 'package:randomvideos/domain/entities/video_post.dart';
import 'package:randomvideos/infrastructure/models/local_video_model.dart';
import 'package:randomvideos/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
//TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 1));

    //Crea un nuevo listado convertido de datos del Local_Video_Posts, estos ya pueden ser utilizables
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();

    //Añade todo el listado convertido al array videos
    videos.addAll(newVideos);
    initialLoading = false;

    //Todo: Cargar Videos

    notifyListeners();
  }
}
