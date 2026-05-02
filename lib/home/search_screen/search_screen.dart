import 'package:flatter/Riverpod/riverpod_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final riverpodManager = RiverpodManager();

    void search(String value) {
      print(value);
    }

    TextEditingController searchFieldController = TextEditingController();
    return Scaffold(//eine zweite version so machen mit dem zurück knopf
      appBar: AppBar(
        title: TextField(
          controller: searchFieldController,
          decoration: const InputDecoration(
            hintText: "Search"
          ),
          onChanged: (String value) {
            search(value);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.backspace),
            onPressed: () {
              searchFieldController.clear();
            },
          )
        ],
      ),
      body: Consumer(
        builder: (context,ref,child) {
          final searchResults = ref.watch(riverpodManager);
          return Container(
            child: switch (searchResults) {
              AsyncValue(:final value?) =>
              AsyncValue(error: != null) => const Text("error"),
              AsyncValue() => LoadingAnimationWidget.fourRotatingDots(color: Colors.purple, size: 25),
            },
          )
        },
      )
    );
  }
}