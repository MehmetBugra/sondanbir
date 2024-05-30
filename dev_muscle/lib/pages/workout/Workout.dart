import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutPage extends StatefulWidget {
  final Map exercise;
  WorkoutPage({super.key, required this.exercise});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.exercise["url"] ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 375,
              child: Image.asset(
                "assets/images/WorkoutPlans/WorkoutPlanDetails.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 300),
              decoration: const BoxDecoration(
                color: Color(0xff1C1C1E),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.exercise["name"] ?? "",
                      style: TextStyles.WorkoutTitleTextStyle(),
                    ),

                    const SizedBox(height: 8),
                    // Text(
                    //   exercise["description"] ?? "",
                    //   style: TextStyles.WorkoutSubtitleTextStyle(),
                    // ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        WorkoutInfo(
                          text: "${widget.exercise["time"]} min ",
                          icon: Icons.play_circle,
                        ),
                        const SizedBox(width: 17.5),
                        WorkoutInfo(
                          text: "${widget.exercise["calories"]} cal ",
                          icon: Icons.fireplace,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      widget.exercise["description"],
                      style: TextStyles.WorkoutDescribeTextStyle(),
                    ),
                    const SizedBox(height: 32),
                    YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.amber,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                      onReady: () {
                        _controller.addListener(listener);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 56,
              left: 24,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.turn_left_sharp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => high_green),
        ),
        child: const Text("Finish and Save"),
      ),
    );
  }

  void listener() {
    if (_controller.value.isReady) {
      // The player is ready
      print('Player is ready');
    }

    if (_controller.value.isPlaying) {
      // The player is playing
      print('Player is playing');
    }

    // Handle other player states
    switch (_controller.value.playerState) {
      case PlayerState.unknown:
        print('Player state: unknown');
        break;
      case PlayerState.unStarted:
        print('Player state: unStarted');
        break;
      case PlayerState.ended:
        print('Player state: ended');
        break;
      case PlayerState.playing:
        print('Player state: playing');
        break;
      case PlayerState.paused:
        print('Player state: paused');
        break;
      case PlayerState.buffering:
        print('Player state: buffering');
        break;
      case PlayerState.cued:
        print('Player state');
        break;
    }
  }
}

class WorkoutInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  WorkoutInfo({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xff2C2C2E),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 6),
          Text(text, style: TextStyles.WorkoutInfoTextStyle()),
        ],
      ),
    );
  }
}
