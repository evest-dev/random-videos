import 'package:flutter/material.dart';
import 'package:randomvideos/presentation/widgets/shared/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  final String user;
  final String sound;

  const FullScreenPlayer(
      {super.key,
      required this.videoUrl,
      required this.caption,
      required this.user,
      required this.sound});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(10)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }

        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),

                // Gradiente
                VideoBackground(
                  stops: const [0.8, 1.0],
                ),

                // Texto
                Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(
                        caption: widget.caption, user: widget.user, sound: widget.sound)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  final String user;
  final String sound;
  const _VideoCaption({
    super.key,
    required this.caption,
    required this.user, 
    required this.sound
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userStyle = Theme.of(context).textTheme.titleMedium;
    final titleStyle = Theme.of(context).textTheme.bodyMedium;
    return SizedBox(
        width: size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(user, style: userStyle, maxLines: 2),
            const SizedBox(height: 6),
            Text(caption, maxLines: 2, style: titleStyle),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.music_note_rounded),
                const SizedBox(width: 5),
                Text(sound, style: titleStyle)
            ]),
            const SizedBox(height: 5),
        ]));
  }
}
