import 'package:cached_network_image/cached_network_image.dart';
import 'package:flatter/home/library_screen/album_screen/album_screen.dart';
import 'package:flatter/home/library_screen/library_tab_bar/albums_tab/albums_tab_ViewModel.dart';
import 'package:flatter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'artists_tab_ViewModel.dart';

class ArtistsTab extends StatelessWidget {
  const ArtistsTab({super.key,required this.viewModel});
  final ArtistsTabViewModel viewModel;

  Widget buildListView(List<dynamic> items,BuildContext context) {
    List<Widget> widgetList = [];
    for (Map item in items) {
      widgetList.add(
        Row(
          children: [
            Text(item['name']),
            //hier halt noch so eine linie
          ],
        ),
      );
      int index = 0;
      while (index < item['artist'].length) {
        Map artistOne = item['artist'][index];
        Map artistTwo = {};
        if (index + 1 < item['artist'].length) {
          artistTwo = item['artist'][index + 1];
        }
        if (artistTwo.isEmpty == true) {
          widgetList.add(
            Row(
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumScreen(albumID: artistOne['id'])));
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "${subsonicService.getURL(null, null, null)[0]}getCoverArt${subsonicService.getURL(null, null, null)[1]}&id=${artistOne['coverArt']}&size=100",
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => IconButton(
                            onPressed: () {
                              //hier retry
                            },
                            icon: Icon(Icons.error),
                          ),
                        ),
                        Text(artistOne['name']),
                        Text(artistOne['id'])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          widgetList.add(
            Row(
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumScreen(albumID: artistOne['id'])));
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "${subsonicService.getURL(null, null, null)[0]}getCoverArt${subsonicService.getURL(null, null, null)[1]}&id=${artistOne['coverArt']}&size=100",
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => IconButton(
                            onPressed: () {
                              //hier retry
                            },
                            icon: Icon(Icons.error),
                          ),
                        ),
                        Text(artistOne['name']),
                        Text(artistOne['id'])
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumScreen(albumID: artistTwo['id'])));
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "${subsonicService.getURL(null, null, null)[0]}getCoverArt${subsonicService.getURL(null, null, null)[1]}&id=${artistTwo['coverArt']}&size=100",
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => IconButton(
                            onPressed: () {
                              //hier retry
                            },
                            icon: Icon(Icons.error),
                          ),
                        ),
                        Text(artistTwo['name']),
                        Text(artistTwo['id']),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        index = index + 2;
      }
    }
    return Flexible(fit: FlexFit.loose, child: ListView(shrinkWrap: true,children: widgetList,));
  }
  //hier irgendwie ein filtering einfügen
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListTile(
            title: Text("uh"),
            subtitle: Text("hier sorting stuff und so, probably nd im listtile"),
          ),
          Consumer(
            builder: (context,ref,child) {
              final artistList = ref.watch(riverpodManager.artistListProvider);
              return Expanded(
                child: switch (artistList) {
                  AsyncValue(:final value?) => Column(
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