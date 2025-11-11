// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

class SoundEffect {
  // static var audioPlayer = AudioPlayer();
  static final soloud = SoLoud.instance;
  static AudioSource? clickSound;

  static Future<void> init() async {
    await soloud.init();
    clickSound = await soloud.loadAsset('assets/sounds/click-sound_3.wav');
  }

  static void playClickSound() {
    var sound = clickSound;
    if (sound == null) {
      return;
    }
    soloud.play(sound);
    // audioPlayer.play(AssetSource('sounds/click-sound_2.wav'));
  }
}
