import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flatter/home/library_screen/itemMenus.dart';

import '../../main.dart';
import 'album_screen/album_screen.dart';
import 'artist_screen/artist_screen.dart';

class SongList extends StatelessWidget {
  const SongList({super.key,required this.songListNullable,required this.listView});
  final List<MediaItem>? songListNullable;
  final bool listView;

  @override
  Widget build(BuildContext context) {
    List<MediaItem> songList = [];
    if (songListNullable != null && songListNullable?.isEmpty == false) {
      print(songListNullable);
      songList.addAll(songListNullable!);
    } else {
      return Center(child: Text("No songs"));
    }
    void goToAlbum(BuildContext context, String id) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumScreen(albumID: id,)));
    }
    void goToArtist(BuildContext context, String id) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArtistScreen(artistID: id)));
    }
    if (listView == true) {
      return ListView.builder(
        itemCount: songList.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) => (playerControl.customAction('addNext',{'addNext':[songList[index]]})),//
                  icon: Icons.list,
                  label: "Play next",
                ),
                SlidableAction(
                  onPressed: (_) => print("add to playlist"),
                  icon: Icons.playlist_add,
                  label: "Add to playlist",
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) => (goToAlbum(context, songList[index].extras!['albumId'])),
                  icon: Icons.album,
                  label: 'Album',
                ),
                SlidableAction(
                  onPressed: (_) => (goToArtist(context, songList[index].extras!['artistId'])),
                  icon: Icons.person,
                  label: 'Artist',
                ),
              ],
            ),
            child: ListTile(//evt noch cover hinzufügen oder so idk
              leading: Text(songList[index].duration.toString()),//hier cover image
              title: Row(
                spacing: 8,
                children: [
                  if (songList[index].extras!['starred'] != null) Icon(Icons.favorite),
                  Text(songList[index].title),
                ],
              ),
              subtitle: Text(songList[index].artist!),
              trailing: ItemMenus(context).songMenu(songList[index].id, songList[index].extras!['artistId'], songList[index].extras!['albumId']),//artist und playlist geben leider namen und keine ids zurück...👩‍🦲
              onTap: () {
                playerControl.addQueueItem(songList[index]);
              },
            ),
          );
        },
      );
    } else {
      List<Widget> widgetList = [];
      for (MediaItem song in songList) {
        widgetList.add(
          Slidable(
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) => (playerControl.customAction('addNext',{'addNext':[song]})),
                  icon: Icons.list,
                  label: "Play next",
                ),
                SlidableAction(
                  onPressed: (_) => print("add to playlist"),
                  icon: Icons.playlist_add,
                  label: "Add to playlist",
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) => (goToAlbum(context, song.extras!['albumId'])),
                  icon: Icons.album,
                  label: 'Album',
                ),
                SlidableAction(
                  onPressed: (_) => (goToArtist(context, song.extras!['artistId'])),
                  icon: Icons.person,
                  label: 'Artist',
                ),
              ],
            ),
            child: ListTile(//evt noch cover hinzufügen oder so idk
              leading: Text(song.duration.toString()),//hier cover image
              title: Row(
                spacing: 8,
                children: [
                  if (song.extras!['starred'] != null) Icon(Icons.favorite),
                  Text(song.title),
                ],
              ),
              subtitle: Text(song.artist!),
              trailing: ItemMenus(context).songMenu(song.id, song.extras!['artistId'], song.extras!['albumId']),//artist und playlist geben leider namen und keine ids zurück...👩‍🦲
              onTap: () {
                playerControl.addQueueItem(song);
              },
            ),
          )
        );
      }
      return Column(children: widgetList,);
    }

  }
}