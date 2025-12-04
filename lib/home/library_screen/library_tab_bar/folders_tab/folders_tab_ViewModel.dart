import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class FoldersTabViewModel extends ChangeNotifier {
  String title = "Folders";
  String directoryString = "no directory selected";
  List<String> directories = [];//mwegen berechtigungen soll man einfach mehrere ordner hinzufügen, auf alle unterordner hat die app dann zugriff; man hat also eine liste mit den hinzugefügten ordnern.
  Future<void> addFolder() async {
    title = "yoo it changed";
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      directories.add(selectedDirectory);
    }
    notifyListeners();
  }
}