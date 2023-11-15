import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

mixin sound {
  static Soundpool audio = Soundpool.fromOptions();
  static late int soundId;

  static List <String> soundData = [
    "assets/audio/mixkit-cool-interface-click-tone-2568.wav",
    "assets/audio/mixkit-funny-game-over-2878.wav",
    "assets/audio/mixkit-instant-win-2021.wav",
    "assets/audio/mixkit-hard-pop-click-2364.wav",
  ];
}

void playClickSound() async {
  await sound.audio.release();
  sound.soundId = await rootBundle.load(sound.soundData.elementAt(0)).then((ByteData soundData) {
    return sound.audio.load(soundData);
  });
  await sound.audio.play(sound.soundId);
}

void playWinningSound() async {
  await sound.audio.release();
  sound.soundId = await rootBundle.load(sound.soundData.elementAt(2)).then((ByteData soundData) {
    return sound.audio.load(soundData);
  });
  await sound.audio.play(sound.soundId);
}

void playLosingSound() async {
  await sound.audio.release();
  sound.soundId = await rootBundle.load(sound.soundData.elementAt(1)).then((ByteData soundData) {
    return sound.audio.load(soundData);
  });
  await sound.audio.play(sound.soundId);
}

void playDrawSound() async {
  await sound.audio.release();
  sound.soundId = await rootBundle.load(sound.soundData.elementAt(3)).then((ByteData soundData) {
    return sound.audio.load(soundData);
  });
  await sound.audio.play(sound.soundId);
}