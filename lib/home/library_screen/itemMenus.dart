import 'package:audio_service/audio_service.dart';
import 'package:flatter/home/library_screen/album_screen/album_screen.dart';
import 'package:flatter/home/library_screen/artist_screen/artist_screen.dart';
import 'package:flatter/main.dart';
import 'package:flatter/useful_scripts.dart';
import 'package:flutter/material.dart';

class ItemMenus {//man muss hier halt später einstellen können, welche aktionen hier und welche im bottom sheet angezeigt werden sollen
  ItemMenus(this.context);
  final BuildContext context;
  final SubsonicJustAudioCompatibility usefulScripts = SubsonicJustAudioCompatibility();

  //Pop Up Menu Entry actions//TODO:noch die by id dinger hinzufügen, dafür gibt's ja was in den player controls
  //mal schauen, ob ich die anderen actions als bottom sheet behalte, oder als untermenü. bei einem untermenü könnte ich diesen code so wie er ist wiederverwenden. aber eig finde ich ein bottom sheet schöner dafür
  PopupMenuEntry playNow(List<MediaItem> items) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('clearQueue');
        playerControl.customAction('addMultiple',{'addMultiple':items});
      },
      child: Text("Play now"),
    );
  }
  PopupMenuEntry addNext(List<MediaItem> items) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('addNext',{'addNext':{'tracks':items}});
      },
      child: Text("Add next"),
    );
  }
  PopupMenuEntry enqueue(List<MediaItem> items) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('addMultiple',{'addMultiple':{'tracks':items}});
      },
      child: Text("Enqueue"),
    );
  }
  PopupMenuEntry playNowShuffled(List<MediaItem> items) {
    items.shuffle();
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('clearQueue');
        playerControl.customAction('addMultiple',{'addMultiple':{
          'tracks':items,
          'shuffled':true,
        }});
      },
      child: Text("Play now shuffled"),
    );
  }
  PopupMenuEntry addNextShuffled(List<MediaItem> items) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('addNext',{'addNext': {
          'tracks': items,
          'shuffled':true,
        }});
      },
      child: Text("Add next shuffled"),
    );
  }
  PopupMenuEntry enqueueShuffled(List<MediaItem> items) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('enqeue',{'enqueue':{
          'tracks':items,
          'shuffled':true,
        }});
      },
      child: Text("Enqueue shuffled"),
    );
  }
  PopupMenuEntry playNowByID(Map id) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('clearQueue');
        playerControl.customAction('addByID',{'addByID':id});
      },
      child: Text("Enqueue shuffled"),
    );
  }
  PopupMenuEntry addNextByID(Map id) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('addNextByID',{'addNextByID':id});
      },
      child: Text("Enqueue shuffled"),
    );
  }
  PopupMenuEntry enqueueByID(Map id) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('addByID',{'addByID':id});
      },
      child: Text("Enqueue shuffled"),
    );
  }
  PopupMenuEntry playNowShuffledByID(Map id) {
    return PopupMenuItem(
      onTap: () {
        playerControl.customAction('clearQueue');
        id['shuffled'] = true;
        playerControl.customAction('addByID',{'addByID':id});
      },
      child: Text("Enqueue shuffled"),
    );
  }
  PopupMenuEntry addNextShuffledByID(Map id) {
    return PopupMenuItem(
      onTap: () {
        id['shuffled'] = true;
        playerControl.customAction('addNextByID',{'addNextByID':id});
      },
      child: Text("Enqueue shuffled"),
    );
  }
  PopupMenuEntry enqueueShuffledByID(Map id) {
    return PopupMenuItem(
      onTap: () {
        id['shuffled'] = true;
        playerControl.customAction('addByID',{'addByID':id});
      },
      child: Text("Enqueue shuffled"),
    );
  }
  PopupMenuEntry album(String albumID) {
    return PopupMenuItem(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumScreen(albumID: albumID)));
      },
      child: Text("Album"),
    );
  }
  PopupMenuEntry artist(String artistID) {//TODO:später zu dem machen, dass du zwischen mehreren artists auswählen kannst
    return PopupMenuItem(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArtistScreen(artistID: artistID)));
      },
      child: Text("Artist"),
    );
  }
  //More Sheet Menu Entry Actions
  ListTile playNowMoreSheet(List<MediaItem> items) {
    return ListTile(
      onTap: () {
        playerControl.customAction('clearQueue');
        playerControl.customAction('addMultiple',{'addMultiple':items});
      },
      title: Text("Play now"),
    );
  }
  ListTile addNextMoreSheet(List<MediaItem> items) {
    return ListTile(
      onTap: () {
        playerControl.customAction('addNext',{'addNext':{'tracks':items}});
      },
      title: Text("Add next"),
    );
  }
  ListTile enqueueMoreSheet(List<MediaItem> items) {
    return ListTile(
      onTap: () {
        playerControl.customAction('addMultiple',{'addMultiple':{'tracks':items}});
      },
      title: Text("Enqueue"),
    );
  }
  ListTile playNowShuffledMoreSheet(List<MediaItem> items) {
    items.shuffle();
    return ListTile(
      onTap: () {
        playerControl.customAction('clearQueue');
        playerControl.customAction('addMultiple',{'addMultiple':{
          'tracks':items,
          'shuffled':true,
        }});
      },
      title: Text("Play now shuffled"),
    );
  }
  ListTile addNextShuffledMoreSheet(List<MediaItem> items) {
    return ListTile(
      onTap: () {
        playerControl.customAction('addNext',{'addNext': {
          'tracks': items,
          'shuffled':true,
        }});
      },
      title: Text("Add next shuffled"),
    );
  }
  ListTile enqueueShuffledMoreSheet(List<MediaItem> items) {
    return ListTile(
      onTap: () {
        playerControl.customAction('enqeue',{'enqueue':{
          'tracks':items,
          'shuffled':true,
        }});
      },
      title: Text("Enqueue shuffled"),
    );
  }
  ListTile playNowByIDMoreSheet(Map id) {
    return ListTile(
      onTap: () {
        playerControl.customAction('clearQueue');
        playerControl.customAction('addByID',{'addByID':id});
      },
      title: Text("Enqueue shuffled"),
    );
  }
  ListTile addNextByIDMoreSheet(Map id) {
    return ListTile(
      onTap: () {
        playerControl.customAction('addNextByID',{'addNextByID':id});
      },
      title: Text("Enqueue shuffled"),
    );
  }
  ListTile enqueueByIDMoreSheet(Map id) {
    return ListTile(
      onTap: () {
        playerControl.customAction('addByID',{'addByID':id});
      },
      title: Text("Enqueue shuffled"),
    );
  }
  ListTile playNowShuffledByIDMoreSheet(Map id) {
    return ListTile(
      onTap: () {
        playerControl.customAction('clearQueue');
        id['shuffled'] = true;
        playerControl.customAction('addByID',{'addByID':id});
      },
      title: Text("Enqueue shuffled"),
    );
  }
  ListTile addNextShuffledByIDMoreSheet(Map id) {
    return ListTile(
      onTap: () {
        id['shuffled'] = true;
        playerControl.customAction('addNextByID',{'addNextByID':id});
      },
      title: Text("Enqueue shuffled"),
    );
  }
  ListTile enqueueShuffledByIDMoreSheet(Map id) {
    return ListTile(
      onTap: () {
        id['shuffled'] = true;
        playerControl.customAction('addByID',{'addByID':id});
      },
      title: Text("Enqueue shuffled"),
    );
  }
  ListTile albumMoreSheet(String albumID) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumScreen(albumID: albumID)));
      },
      title: Text("Album"),
    );
  }
  ListTile artistMoreSheet(String artistID) {//TODO:später zu dem machen, dass du zwischen mehreren artists auswählen kannst
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArtistScreen(artistID: artistID)));
      },
      title: Text("Artist"),
    );
  }

  //song menus
  Widget songMenu(Map<dynamic,dynamic> song) {
    Map actionOrder = settingsControl.loadSetting('songMenuActionOrder');
    List<PopupMenuEntry> menuEntryList = [];
    List<ListTile> moreSheetEntryList = [];
    MediaItem songMediaItem = usefulScripts.subsonicSongToMediaItem(song);
    for (String action in actionOrder['mainMenu']) {
      switch (action) {
        case 'playNow':
          menuEntryList.add(playNow([songMediaItem]));
        case 'addNext':
          menuEntryList.add(addNext([songMediaItem]));
        case 'enqueue':
          menuEntryList.add(enqueue([songMediaItem]));
        case 'album':
          menuEntryList.add(album(songMediaItem.extras!['albumId']));
        case 'artist':
          menuEntryList.add(artist(songMediaItem.extras!['artistId']));
      }
    }
    for (String action in actionOrder['moreSheet']) {
      switch (action) {
        case 'playNow':
          moreSheetEntryList.add(playNowMoreSheet([songMediaItem]));
        case 'addNext':
          moreSheetEntryList.add(addNextMoreSheet([songMediaItem]));
        case 'enqueue':
          moreSheetEntryList.add(enqueueMoreSheet([songMediaItem]));
        case 'album':
          moreSheetEntryList.add(albumMoreSheet(songMediaItem.extras!['albumId']));
        case 'artist':
          moreSheetEntryList.add(artistMoreSheet(songMediaItem.extras!['artistId']));
      }
    }
    if (actionOrder['moreSheet'].isNotEmpty) {
      menuEntryList.add(PopupMenuItem(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(//mal schauen wie du das mit dem grid machst//die gridsize einstellung gibt es schon (also in der settingsmap)
                  child: Column(
                    children: moreSheetEntryList,
                  ),
                );
              }
          );
        },
        child: Text("More"),
      ));
    }
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => menuEntryList,
      child: Icon(Icons.more_vert),
    );
  }
  Widget songMenuQueue(MediaItem song) {
    Map actionOrder = settingsControl.loadSetting('songMenuActionOrder');
    List<PopupMenuEntry> menuEntryList = [];

    for (String action in actionOrder['mainMenu']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    for (String action in actionOrder['moreSheet']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [

      ],
    );
  }
  Widget albumMenu(Map<dynamic,dynamic> album) {
    Map actionOrder = settingsControl.loadSetting('albumMenuActionOrder');
    List<PopupMenuEntry> menuEntryList = [];

    for (String action in actionOrder['mainMenu']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    for (String action in actionOrder['moreSheet']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [

      ],
      child: Icon(Icons.more_vert),
    );
  }
  Widget albumMenuList(Map<dynamic,dynamic> albumID) {
    Map actionOrder = settingsControl.loadSetting('albumMenuActionOrder');
    List<PopupMenuEntry> menuEntryList = [];

    for (String action in actionOrder['mainMenu']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    for (String action in actionOrder['moreSheet']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [

      ],
      child: Icon(Icons.more_vert),
    );
  }
  Widget artistMenu(Map<dynamic,dynamic> artist) {
    Map actionOrder = settingsControl.loadSetting('artistMenuActionOrder');
    List<PopupMenuEntry> menuEntryList = [];

    for (String action in actionOrder['mainMenu']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    for (String action in actionOrder['moreSheet']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [

      ],
      child: Icon(Icons.more_vert),
    );
  }
  Widget playlistMenu(Map<dynamic,dynamic> playlist) {
    Map actionOrder = settingsControl.loadSetting('playlistMenuActionOrder');
    List<PopupMenuEntry> menuEntryList = [];

    for (String action in actionOrder['mainMenu']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    for (String action in actionOrder['moreSheet']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [

      ],
      child: Icon(Icons.more_vert),
    );
  }
  Widget playlistMenuList(Map<dynamic,dynamic> playistID) {
    Map actionOrder = settingsControl.loadSetting('playlistMenuActionOrder');
    List<PopupMenuEntry> menuEntryList = [];

    for (String action in actionOrder['mainMenu']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    for (String action in actionOrder['moreSheet']) {
      switch (action) {
        case 'playNow':

        case 'addNext':

        case 'enqueue':

        case 'album':

        case 'artist':
      }
    }
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry> [

      ],
      child: Icon(Icons.more_vert),
    );
  }
}