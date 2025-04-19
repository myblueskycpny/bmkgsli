import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioManager extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isMusicOn = true;

  bool get isMusicOn => _isMusicOn;

  Future<void> initialize() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    if (_isMusicOn) {
      await playMusic();
    }
  }

  Future<void> playMusic() async {
    await _audioPlayer.play(AssetSource('music.mp3'));
    _isMusicOn = true;
    notifyListeners();
  }

  Future<void> stopMusic() async {
    await _audioPlayer.stop();
    _isMusicOn = false;
    notifyListeners();
  }

  Future<void> toggleMusic() async {
    if (_isMusicOn) {
      await stopMusic();
    } else {
      await playMusic();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
