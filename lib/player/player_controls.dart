import 'package:flatter/Repositories/queue_repository.dart';
import 'package:flatter/player/audio_player.dart';

class PlayerControls {
  final player = MyPlayer();
  final QueueRepository queueRepository = QueueRepository();

  bool playing = false;

  //player controls
  void setSource(String source) {
    player.setSource(source);
  }
  void togglePlayPause() {
    if (player.playerState().toString() == "PlayerState.playing") {
      pause();
    } else if (player.playerState().toString() == "PlayerState.paused") {
      play();
    } else if (player.playerState().toString() == "PlayerState.stopped") {
      player.setSource(queueRepository.getItemAtPos(getCurrentIndex()));
      play();
    }
  }

  String checkPlayerState() {
    if (player.playerState().toString() == "PlayerState.playing") {
      return "playing";
    } else if (player.playerState().toString() == "PlayerState.paused") {
      return "paused";
    } else if (player.playerState().toString() == "PlayerState.stopped") {
      player.setSource(queueRepository.getItemAtPos(getCurrentIndex()));
      return "stopped";
    } else {
      return "";
    }
  }

  void play() {
    if (queueRepository.getQueueLength() == 0) {
      return;
    }
    if (checkPlayerState() == "stopped") {
      player.setSource(queueRepository.getItemAtPos(getCurrentIndex()));
    }
    player.play();
  }

  void pause() {
    player.pause();
  }

  void seek(Duration position) async {
    player.seek(position);
  }

  //playlist controls
  void playSpecificFromQueue(int index) {
    player.setSource(queueRepository.getItemAtPos(index));
  }

  void addItemAt(int position, String item) {
    queueRepository.addItem(item, position);
  }

  int getCurrentIndex() {
    return queueRepository.getCurrentIndex();
  }
}