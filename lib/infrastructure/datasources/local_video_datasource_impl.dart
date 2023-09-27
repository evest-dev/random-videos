import 'package:randomvideos/domain/datasources/video_posts_datasource.dart';
import 'package:randomvideos/domain/entities/video_post.dart';
import 'package:randomvideos/infrastructure/models/local_video_model.dart';
import 'package:randomvideos/shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
