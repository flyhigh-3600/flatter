class QueueRepository {
  final List<List<dynamic>> _queue = [];//[path,[metadata],current]

  void insertItem(List<dynamic> item,int position) {
    _queue.insert(position, item);
  }

  void addItem(List<dynamic> item) {
    _queue.add(item);
  }

  void removeItem(int position) {
    _queue.removeAt(position);
  }

  List<dynamic> getItemAtPos(int position) {
    return _queue[position];
  }

  List<List<dynamic>> getQueue() {
    return _queue;
  }

  int getQueueLength() {
    return _queue.length;
  }

  void makeCurrent(int index) {
    for (List<dynamic> item in _queue) {
      item[2] = false;
    }
    _queue[index][2] = true;
  }
}