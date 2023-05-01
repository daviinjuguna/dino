part of 'audio_cubit.dart';

@immutable
class AudioState {
  final double volume;
  const AudioState({
    this.volume = 1,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AudioState && other.volume == volume;
  }

  @override
  int get hashCode => volume.hashCode;

  AudioState copyWith({
    double? volume,
  }) {
    return AudioState(
      volume: volume ?? this.volume,
    );
  }
}
