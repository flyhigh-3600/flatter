import 'dart:collection';

import 'package:flatter/home/queue_screen/queue_screen_ViewModel.dart';
import 'package:flatter/home/queue_screen/queue_widget/queue_widget.dart';
import 'package:flatter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {

  Widget buildQueue(WidgetRef ref, BuildContext context, List<List<dynamic>> queue) {
    return ReorderableListView.builder(

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Queue"),
      ),
      body: Consumer(builder: (context, ref, child) {
        final queue = ref.watch(riverpodManager.queueProvider);
        return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: switch (queue) {
              AsyncValue(:final value?) => buildQueue(ref,context,value),
              AsyncValue(error: != null) => const Text("error"),
              AsyncValue() => CircularProgressIndicator(),
            },
          ),
          Divider(),
          Container(
            color: Theme.of(context).colorScheme.surfaceContainer,//farbe auswählen (generell halt wenn du dich um die farben kümmerst
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,//ig besser als space around
              children: [
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.playlist_add),
                ),
                IconButton(
                  onPressed: () {
                    playerControl.shuffleQueue();
                  },
                  icon: Icon(Icons.shuffle),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.loop),//hier halt single und ganze queue
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.search),//search und evt animation selbst bauen qwq
                ),
              ],
            ),
          ),
        ],
      ); },),
    );
  }
}