import 'package:flutter/material.dart';
import 'package:randomvideos/domain/entities/video_post.dart';
import 'package:randomvideos/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 1));

    //Crea un nuevo listado convertido de datos del Local_Video_Posts, estos ya pueden ser utilizables
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
    //     .toList();
    final newVideos = await videosRepository.getTrendingVideosByPage(1);
    //Añade todo el listado convertido al array videos
    videos.addAll(newVideos);
    initialLoading = false;

    //Todo: Cargar Videos

    notifyListeners();
  }
}
