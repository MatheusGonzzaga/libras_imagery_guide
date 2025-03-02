// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:libras_imagery_guide/application/ui/theme_config.dart';
// import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class PlayPauseWidget extends StatelessWidget {
//   final PlayerState player;
//   const PlayPauseWidget({
//     Key? key,
//     required this.player,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final listPlay = [
//       PlayerState.unStarted,
//       PlayerState.playing,
//       PlayerState.ended,
//       PlayerState.cued
//     ];
//     log(player.toString());
//     return player != PlayerState.buffering
//         ? Icon(
//             listPlay.contains(player) ? Icons.pause : Icons.play_arrow,
//             size: UiScale.s64,
//             color: ThemeConfig.offWhite.withOpacity(.7),
//           )
//         : CircularProgressIndicator(
//             color: ThemeConfig.blue,
//           );
//   }
// }
