import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flutter/material.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit(AudioCache cache)
      : player = AudioPlayer()..audioCache = cache,
        bgm = Bgm(audioCache: cache),
        super(const AudioState());

  final AudioPlayer player;
  final Bgm bgm;

  Future<void> _changeVolume(double volume) async {
    await player.setVolume(volume);
    await bgm.audioPlayer.setVolume(volume);
    if (isClosed) return;
    emit(state.copyWith(volume: volume));
  }

  Future<void> toggleVolume() async {
    if (state.volume == 0) {
      await _changeVolume(1);
    } else {
      await _changeVolume(0);
    }
  }

  @override
  Future<void> close() {
    player.dispose();
    bgm.dispose();
    return super.close();
  }
}
