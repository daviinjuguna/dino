part of 'preload_cubit.dart';

@immutable
class PreloadState {
  final int totalCount;
  final int loadedCount;
  final String currentLabel;

  const PreloadState._(this.totalCount, this.loadedCount, this.currentLabel);

  const PreloadState.initial()
      : totalCount = 0,
        loadedCount = 0,
        currentLabel = '';

  double get progress => totalCount == 0 ? 0 : loadedCount / totalCount;
  bool get isComplete => progress == 1.0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PreloadState &&
        other.totalCount == totalCount &&
        other.loadedCount == loadedCount &&
        other.currentLabel == currentLabel;
  }

  @override
  int get hashCode =>
      totalCount.hashCode ^ loadedCount.hashCode ^ currentLabel.hashCode;

  PreloadState copyWith({
    int? totalCount,
    int? loadedCount,
    String? currentLabel,
  }) {
    return PreloadState._(
      totalCount ?? this.totalCount,
      loadedCount ?? this.loadedCount,
      currentLabel ?? this.currentLabel,
    );
  }
}
