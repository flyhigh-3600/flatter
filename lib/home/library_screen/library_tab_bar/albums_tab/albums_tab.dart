import 'package:cached_network_image/cached_network_image.dart';
import 'package:flatter/home/library_screen/album_screen/album_screen.dart';
import 'package:flatter/home/library_screen/library_tab_bar/albums_tab/albums_tab_ViewModel.dart';
import 'package:flatter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumsTab extends StatefulWidget {
  const AlbumsTab({super.key,required this.viewModel});
  final AlbumsTabViewModel viewModel;



  static const List<String> filterSortList = ["random","10","0"];

  @override
  State<AlbumsTab> createState() => _AlbumsTabState();
}

class _AlbumsTabState extends State<AlbumsTab> {
  bool ascending = true;
  int elementCount = 10;
  int offset = 0;

  void reverseSort() {
    if (ascending == true) {
      setState(() {
        ascending = false;
      });
    } else {
      setState(() {
        ascending = true;
      });
    }
  }

  Widget buildListView(List<dynamic> items,BuildContext context) {
    List<Widget> widgetList = [];
    print(items.length);
    int index = 0;
    while (index < items.length) {
      Map albumOne = items[index];
      Map albumTwo = items[index + 1];
      widgetList.add(
        Row(
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumScreen(albumID: albumOne['id'])));
                },
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "${subsonicService.getURL(null, null, null)[0]}getCoverArt${subsonicService.getURL(null, null, null)[1]}&id=${albumOne['coverArt']}&size=100",
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => IconButton(
                        onPressed: () {
                          //hier retry
                        },
                        icon: Icon(Icons.error),
                      ),
                    ),
                    Text(albumOne['name']),
                    Text(albumOne['artist'])
                  ],
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumScreen(albumID: albumTwo['id'])));
                },
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "${subsonicService.getURL(null, null, null)[0]}getCoverArt${subsonicService.getURL(null, null, null)[1]}&id=${albumTwo['coverArt']}&size=100",
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => IconButton(
                        onPressed: () {
                          //hier retry
                        },
                        icon: Icon(Icons.error),
                      ),
                    ),
                    Text(albumTwo['name']),
                    Text(albumTwo['artist']),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      index = index + 2;
    }
    return Flexible(fit: FlexFit.loose, child: ListView(shrinkWrap: true,children: widgetList,));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListTile(
            title: Text("uh"),
            subtitle: Text("hier sorting stuff und so, probably nd im listtile"),
          ),
          Row(
            children: [
              Text("hier drop down menü"),
              IconButton(
                onPressed: reverseSort,
                icon: (ascending
                  ? Icon(Icons.arrow_upward)
                  : Icon(Icons.arrow_downward)),
              )
            ],
          ),
          Consumer(
            builder: (context,ref,child) {
              final albumList = ref.watch(riverpodManager.albumListProvider(AlbumsTab.filterSortList));
              return Expanded(
                child: switch (albumList) {
                  AsyncValue(:final value?) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(riverpodManager.albumListProvider);
                        },
                        child: Text("invalidate"),
                      ),
                      buildListView(value,context),
                    ],
                  ),
                  AsyncValue(error: != null) => Center(child: const Text("Error")),
                  AsyncValue() => Center(child: const CircularProgressIndicator()),
                },
              );
            },
          )
        ],
      ),
    );
  }
}