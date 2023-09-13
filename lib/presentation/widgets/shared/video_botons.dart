import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../config/theme/helpers/human_formats.dart';
import '../../../domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
              _CustomIconButton(
                  value: video.likes, iconData: Icons.favorite, iconColor: Colors.white70),
              _CustomIconButton(
                  value: video.views, iconData: Icons.remove_red_eye_outlined),
              _CustomIconButton(
                        value: video.coments, iconData: Icons.comment_outlined),
              SpinPerfect(
                  infinite: true,
                  duration: const Duration(seconds: 3),
                  child: const _CustomIconButton(
                      value: 0, iconData: Icons.play_circle_outline, size: 40)),
              
    
    ]);
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;
  final double size;

  const _CustomIconButton(
      {super.key, required this.value, required this.iconData, this.size=28, iconColor, })
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
          iconSize: 30, onPressed: () {}, 
          icon: Icon(iconData, color: color, size: size)),
      if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble())),
     
    ]);
  }
}
