import 'package:flatter/home/player_screen/play_button.dart';
import 'package:flatter/home/player_screen/player_screen_ViewModel.dart';
import 'package:flatter/main.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key,required this.viewModel});
  final PlayerScreenViewModel viewModel;

  void togglePlayPause(bool playing) {
    if (playing == true) {
      viewModel.pause();
    } else {
      viewModel.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                IconButton.filledTonal(onPressed: viewModel.rewind, icon: Icon(Icons.fast_rewind)),
                PlayButton(onChanged: togglePlayPause),
                IconButton.filledTonal(onPressed: viewModel.skip, icon: Icon(Icons.fast_forward_rounded)),
              ],
            )
            /*
            ElevatedButton(onPressed: viewModel.setSource, child: Text("set source")),
            ElevatedButton(onPressed: viewModel.play, child: Text("play")),
            ElevatedButton(onPressed: viewModel.pause, child: Text("pause")),
            ElevatedButton(onPressed: viewModel.rewind, child: Text("rewind")),
            ElevatedButton(onPressed: viewModel.skip, child: Text("skip")),
            
             */
          ],
        ),
      ),
    );
  }
}