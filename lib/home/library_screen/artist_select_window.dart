import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_card/image_card.dart';

class ArtistSelectWindow {//TODO:joa das hier machen nh :P
  static void showArtistSelectWindow(BuildContext context,List<String> artistIDs) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context,setState) {
            Size screenSize = MediaQuery.sizeOf(context);
            return Consumer(
              builder: (context, ref, child) {
                return CarouselView.builder(
                  itemExtent: double.infinity,
                  itemBuilder: (BuildContext context, int index) {
                    return TransparentImageCard(
                      imageProvider: CachedNetworkImageProvider("https://pngimg.com/uploads/apple/apple_PNG12480.png"),
                    );
                  },
                );
              },
            );
          },
        );
      }
    );
  }
}