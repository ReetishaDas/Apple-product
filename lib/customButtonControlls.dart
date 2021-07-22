import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:video_player/video_player.dart';

class CustomControlsWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final List<Duration> timestamps;

  const CustomControlsWidget({
    Key key,
    @required this.controller,
    @required this.timestamps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(
              Icon(
                Icons.fast_rewind,
                color: primaryTextColor,
              ),
              rewindToPosition),
          SizedBox(width: 12),
          buildButton(
              Icon(
                Icons.replay_5,
                color: primaryTextColor,
              ),
              rewind5Seconds),
          SizedBox(width: 12),
          buildButton(
              Icon(
                Icons.forward_5,
                color: primaryTextColor,
              ),
              forward5Seconds),
          SizedBox(width: 12),
          buildButton(
              Icon(
                Icons.fast_forward,
                color: primaryTextColor,
              ),
              forwardToPosition),
        ],
      ),
    );
  }

  Widget buildButton(Widget child, Function onPressed) => Container(
        height: 50,
        width: 50,
        child: ElevatedButton(
          child: child,
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color(0xffDDE6EE).withOpacity(0.8),
            ),
          ),
        ),
      );

  Future rewindToPosition() async {
    if (timestamps.isEmpty) return;
    Duration rewind(Duration currentPosition) => timestamps.lastWhere(
          (element) => currentPosition > element + Duration(seconds: 2),
          orElse: () => Duration.zero,
        );
    await goToPosition(rewind);
  }

  Future forwardToPosition() async {
    if (timestamps.isEmpty) return;
    Duration forward(Duration currentPosition) => timestamps.firstWhere(
          (position) => currentPosition < position,
          orElse: () => Duration(days: 1),
        );

    await goToPosition(forward);
  }

  Future forward5Seconds() async {
    goToPosition((currentPosition) => currentPosition + Duration(seconds: 5));
  }

  Future rewind5Seconds() async {
    goToPosition((currentPosition) => currentPosition - Duration(seconds: 5));
  }

  Future goToPosition(
      Duration Function(Duration currentPosition) builder) async {
    final currentPosition = await controller.position;
    final newPosition = builder(currentPosition);
    await controller.seekTo(newPosition);
  }
}
