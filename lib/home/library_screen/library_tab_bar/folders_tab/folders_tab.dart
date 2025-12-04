import 'package:flatter/home/library_screen/library_tab_bar/folders_tab/folders_tab_ViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoldersTab extends StatelessWidget {
  const FoldersTab({super.key,required this.viewModel});
  final FoldersTabViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: viewModel.addFolder, icon: Icon(Icons.folder))
        ],
        title: ListenableBuilder(
          listenable: viewModel,
          builder: (context,_) {
            return Text(viewModel.title);
          },
        )
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context,_) {
          return ListView.builder(
            itemCount: viewModel.directories.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Text(viewModel.directories[index]),
              );
            },
          );
        },
      )
    );
  }
}