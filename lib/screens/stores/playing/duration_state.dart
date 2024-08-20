class DurationState {
  final Duration progress;
  final Duration total;
  final Duration buffered;

  DurationState({
    required this.progress,
    required this.total,
    required this.buffered,
  });
}
