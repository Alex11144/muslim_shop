import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitab_class/kitab_class_api.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitablar_api/ayeler_api.dart';

class SliderAndPlayer extends StatefulWidget {
  final Kitablar product1;

  const SliderAndPlayer({Key? key, required this.product1}) : super(key: key);

  @override
  State<SliderAndPlayer> createState() => _SliderAndPlayerState();
}

class _SliderAndPlayerState extends State<SliderAndPlayer> {
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final player = AudioCache();
  final audioPlayer = AudioPlayer();

  void setAudio()  {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    // String url = 'assets/audio/ochen-krasivyy-azan-mishari-rashid-azan.mp3';
    // await audioPlayer.play(UrlSource(url));
  }

  @override
  void initState() {
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
    super.initState();
  }

  String formatTime(Duration duration) {
    String TwoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = TwoDigits(duration.inHours);
    final minutes = TwoDigits(duration.inMinutes.remainder(60));
    final seconds = TwoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final details = widget.product1;
    return Center(
      child: SizedBox(
        height: 840,
        width: 390,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.arrow_back)),
                        ),
                      ],
                    ),
                    Text(
                      details.description,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      details.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/ApiHicab1.jpg',
                    ),
                    Slider(
                        activeColor: Colors.red,
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                          await audioPlayer.seek(position);
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(position)),
                        Text(formatTime(duration - position)),
                      ],
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.play(UrlSource(
                                'assets/audio/ochen-krasivyy-azan-mishari-rashid-azan.mp3'));
                          }
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        iconSize: 50,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
