class QueueRepository {
  List queue = [];
  int currentIndex = 0;
  Future<void> addItem(String file,int position) async {
    if (position == -1) {
      queue.add(file);
      print(queue);
      return;
    }
    queue.insert(position, file);
    print(queue);
  }

  String getItemAtPos(int position) {
    return queue[position];
  }

  String getCurrentItem() {
    return queue[currentIndex];
  }
}