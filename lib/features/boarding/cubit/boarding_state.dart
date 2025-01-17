class BoardingState {}

final class BoardingInitial extends BoardingState {}

final class BoardingCompleted extends BoardingState {}

final class BoardingIndexUpdated extends BoardingState {
  final int index;
  BoardingIndexUpdated(this.index);
}
