part of 'index_bloc.dart';

@immutable
sealed class IndexState {
  int index;

  IndexState({required this.index});
}

final class IndexInitial extends IndexState {
  IndexInitial({required int index}): super(index: index);
}

final class IndexUpdated extends IndexState {
  IndexUpdated({required int index}): super(index: index);
}
