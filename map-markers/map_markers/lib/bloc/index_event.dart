part of 'index_bloc.dart';

@immutable
sealed class IndexEvent {}

class UpdateIndex extends IndexEvent {
  final int i;

  UpdateIndex({required this.i});
}