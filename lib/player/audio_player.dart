import 'package:audioplayers/audioplayers.dart';

class MyPlayer {
  final _player = AudioPlayer();

  Future<void> setSource(String source) async {
    await _player.setSource(DeviceFileSource(source));
  }

  Future<void> play() async {
    await _player.resume();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  playerState() {
    return _player.state;
  }
}