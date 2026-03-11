import 'package:audio_service/audio_service.dart';
import 'package:flatter/main.dart';
import 'package:flatter/player/player_controls.dart';

class MyAudioHandler extends  BaseAudioHandler with QueueHandler, SeekHandler {
  final PlayerControls _player = playerControl;

  @override
  Future<void> play() => _player.play();
  @override
  Future<void> pause() => _player.pause();
  //stop methode erstellen/implementieren
  @override
  Future<void> seek(Duration position) => _player.seek(position);
  //skiptoqueueitem noch implementieren
}