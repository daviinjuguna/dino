import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:dino/gen/assets.gen.dart';
import 'package:flame/cache.dart';
import 'package:flutter/material.dart';

part 'preload_state.dart';

class PreloadCubit extends Cubit<PreloadState> {
  PreloadCubit(this.images, this.audio) : super(const PreloadState.initial());
  final Images images;
  final AudioCache audio;

  // final

  Future<void> loadSeqeuntially() async {
    // images.f
    final phases = [
      PreloadPhase(
        "audio",
        () => audio.loadAll(Assets.audio.values.map((e) => e).toList()),
      ),
      PreloadPhase(
        "images",
        () => images.loadAll([
          ...Assets.images.values.map((e) => e.path).toList(),
          ...Assets.images.parallax.values.map((e) => e.path).toList(),
          ...Assets.enemies.bat.values.map((e) => e.path).toList(),
          ...Assets.enemies.rino.values.map((e) => e.path).toList(),
          ...Assets.enemies.pig.values.map((e) => e.path).toList(),
          ...Assets.enemies.bird.values.map((e) => e.path).toList(),
          ...Assets.enemies.ghost.values.map((e) => e.path).toList(),
        ]),
      ),
    ];

    emit(state.copyWith(totalCount: phases.length));
    for (final phase in phases) {
      emit(state.copyWith(currentLabel: phase.label));

      await Future.wait([
        Future.delayed(Duration.zero, phase.start),
        Future.delayed(const Duration(milliseconds: 200))
      ]);

      emit(state.copyWith(loadedCount: state.loadedCount + 1));
    }
  }
}

@immutable
class PreloadPhase {
  final String label;
  final ValueGetter<Future<void>> start;

  const PreloadPhase(this.label, this.start);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PreloadPhase &&
        other.label == label &&
        other.start == start;
  }

  @override
  int get hashCode => label.hashCode ^ start.hashCode;
}
