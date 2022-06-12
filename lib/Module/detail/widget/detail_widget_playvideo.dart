import 'package:do_an_flutter/Config/theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//https://www.youtube.com/watch?v=GQyWIur03aw
class PlayVideoWidget extends StatefulWidget {
  const PlayVideoWidget(this.videoUrl, {Key? key}) : super(key: key);
  final String videoUrl;

  @override
  State<PlayVideoWidget> createState() => _PlayVideoWidgetState();
}

class _PlayVideoWidgetState extends State<PlayVideoWidget> {
  late YoutubePlayerController _ytbController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ytbController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!, flags: const YoutubePlayerFlags(mute: true, loop: false, autoPlay: false));
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _ytbController.pause();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ytbController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(ThemeConfig.defaultPaddingAll),
        child: YoutubePlayerBuilder(player: YoutubePlayer(controller: _ytbController), builder: (context, player) => player));
  }
}
