import 'package:flatter/main.dart';
import 'package:flutter/material.dart';

class ItemMenus {
  final BuildContext context;
  ItemMenus(this.context);

  PopupMenuEntry addNext(List<dynamic> ids) {
    return PopupMenuItem(
      onTap: () {
        for (String id in ids.reversed) {
          playerControl.addNext(id);
        }
      },
      child: Text("Add next"),
    );
  }

  PopupMenuEntry enqueue(List<dynamic> ids) {
    return PopupMenuItem(
      onTap: () {
        for (String id in ids) {
          playerControl.addItem(id);
        }
      },
      child: Text("Enqueue"),
    );
  }

  PopupMenuEntry goToAlbum(String id) {
    return PopupMenuItem(
      onTap: () {
        //nothing here yet
      },
      child: Text("Album"),
    );
  }

  PopupMenuEntry goToArtist(String id) {
    return PopupMenuItem(
      onTap: () {
        //nothing here yet (und obvs context verwenden
      },
      child: Text("Artist"),
    );
  }

  Widget songMenu(String id,String artistID, String albumID) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [
        addNext([id]),
        enqueue([id]),
        PopupMenuDivider(),
        goToAlbum(albumID),
        goToArtist(artistID),
      ],
      child: Icon(Icons.more_vert),
    );
  }

  Widget albumMenu(String id,String albumArtistID, List<dynamic> songIDs) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [
        addNext(songIDs),
        enqueue(songIDs),
        PopupMenuDivider(),
        goToArtist(albumArtistID),
      ],
      child: Icon(Icons.more_vert),
    );
  }

  Widget artistMenu(String id,List<dynamic> songIDs) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [
        addNext(songIDs),
        enqueue(songIDs),
      ],
      child: Icon(Icons.more_vert),
    );
  }
}