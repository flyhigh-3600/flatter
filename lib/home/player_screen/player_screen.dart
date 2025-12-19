import 'package:flatter/home/player_screen/player_screen_ViewModel.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key,required this.viewModel});
  final PlayerScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: viewModel.setSource, child: Text("set source")),
          ElevatedButton(onPressed: viewModel.play, child: Text("play")),
          ElevatedButton(onPressed: viewModel.pause, child: Text("pause")),
          ElevatedButton(onPressed: viewModel.rewind, child: Text("rewind")),
          ElevatedButton(onPressed: viewModel.skip, child: Text("skip")),
        ],
      ),
    );
  }
}