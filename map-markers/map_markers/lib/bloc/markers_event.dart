part of 'markers_bloc.dart';

@immutable
sealed class MarkersEvent {}

class AddMarker extends MarkersEvent {
  final MarkerWrapper m;

  AddMarker({required this.m});
}

class DeleteMarker extends MarkersEvent {
  final MarkerWrapper m;

  DeleteMarker({required this.m});
}

class UpdateMarker extends MarkersEvent {
  final MarkerWrapper m;

  UpdateMarker({required this.m});
}