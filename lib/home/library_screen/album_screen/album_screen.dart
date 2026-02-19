import 'package:flatter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key,required this.albumID});
  final String albumID;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,child) {
        final albumDetails = ref.watch(riverpodManager.albumDetailsProvider(albumID));
        return Scaffold(
          appBar: AppBar(
            title: switch (albumDetails) {
              AsyncValue(:final value?) => Text(value['name']),
              AsynValue(error: != null) => Text("Error"),
              AsyncValue() => Shimmerdingens
            },
          ),
        )
      },
    )
  }
}