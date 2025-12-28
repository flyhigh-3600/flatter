class QueueRepository {
  final List<List<String>> _queue = [];
  Future<void> addItem(List<String> file,int position) async {
    if (position == -1) {
      _queue.add(file);
      print(_queue);
      return;
    }
    _queue.insert(position, file);
    print(_queue);
  }

  Future<void> removeItem(int position) async {
    _queue.removeAt(position);
  }

  List<String> getItemAtPos(int position) {
    return _queue[position];
  }

  List<List<String>> getQueue() {
    return _queue;
  }
  int getQueueLength() {
    return _queue.length;
  }
}