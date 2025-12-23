import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({super.key,required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool playing = false;

  void togglePlayPause() {
    widget.onChanged(playing);
    if (playing == true) {
      setState(() {
        playing = false;
      });
    } else {
      setState(() {
        playing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      icon: (playing
        ? Icon(Icons.pause)
        : Icon(Icons.play_arrow)),
      onPressed: togglePlayPause,
    );
  }
}