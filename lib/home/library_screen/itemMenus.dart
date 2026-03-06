import 'package:flatter/main.dart';
import 'package:flutter/material.dart';

class ItemMenus {

  PopupMenuEntry addNext(List<String> ids) {
    return PopupMenuItem(
      onTap: () {
        for (String id in ids.reversed) {
          playerControl.addNext(id);
        }
      },
      child: Text("Add next"),
    );
  }

  PopupMenuEntry Enqueue(List<String> ids) {
    return PopupMenuItem(
      onTap: () {
        for (String id in ids) {
          playerControl.addItem(id);
        }
      },
      child: Text("Add next"),
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
        //nothing here yet
      },
      child: Text("Artist"),
    );
  }

  Widget Song(String id,String artistID, String albumID) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [
        addNext([id]),
        Enqueue([id]),
        PopupMenuDivider(),
        goToAlbum(albumID),
        goToArtist(artistID),
      ],
    );
  }

  Widget Album(String id,String albumArtistID, List<String> songIDs) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [
        addNext(songIDs),
        Enqueue(songIDs),
        PopupMenuDivider(),
        goToArtist(albumArtistID),
      ],
    );
  }

  Widget Artist(String id,List<String> songIDs) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [
        addNext(songIDs),
        Enqueue(songIDs),
      ],
    );
  }
}