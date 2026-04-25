import 'package:flatter/home/library_screen/library_screen_ViewModel.dart';
import 'package:flatter/home/player_screen/player_screen.dart';
import 'package:flatter/home/player_screen/player_screen_ViewModel.dart';
import 'package:flatter/home/queue_screen/queue_screen.dart';
import 'package:flatter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../settings/settings_screen.dart';
import '../settings/settings_screen_ViewModel.dart';
import 'library_screen/library_screen.dart';

class HomeNavigationRail extends StatefulWidget {
  const HomeNavigationRail({super.key});

  @override
  State<HomeNavigationRail> createState() => _HomeNavigationRailState();
}

class _HomeNavigationRailState extends State<HomeNavigationRail> {
  int currentPageIndex = settingsControl.loadSetting('startTab');
  final PlayerScreenViewModel playerScreenViewModel = PlayerScreenViewModel();
  final LibraryScreenViewModel libraryScreenViewModel = LibraryScreenViewModel();

  @override
  Widget build(BuildContext context) {
    if (currentPageIndex == -1) {
      currentPageIndex = settingsControl.loadSetting('lastTab');
    }
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
                settingsControl.changeSetting('lastTab', index);
              });
            },
            selectedIndex: currentPageIndex,
            destinations: [
              NavigationRailDestination(icon: Icon(Icons.library_music), label: Text('Library')),
              NavigationRailDestination(icon: Icon(Icons.music_note), label: Text('Player')),
              NavigationRailDestination(icon: Icon(Icons.queue_music), label: Text('Queue')),
            ],
            groupAlignment: -1,//in den einstellungen festlegen
            labelType: NavigationRailLabelType.all,
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen(viewModel: SettingsScreenViewmodel())));
              },
              icon: Icon(Icons.settings)
            ),
            //extended: true,das ding extendable machen (dazu musst du noch was anderes umstellen, sonst gibt es einen fehler
          ),
          const VerticalDivider(),
          Expanded(child: [
            LibraryScreen(viewModel: libraryScreenViewModel),
            PlayerScreen(viewModel: playerScreenViewModel),
            QueueScreen(),
          ][currentPageIndex]),
        ],
      ),
    );
  }
}