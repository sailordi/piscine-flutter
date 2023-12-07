part of 'markers_bloc.dart';

@immutable
sealed class MarkersState {
  List<MarkerWrapper> markers;

  MarkersState({required this.markers});
}

final class MarkersInitial extends MarkersState {
  MarkersInitial({required List<MarkerWrapper> markers}): super(markers: markers);
}

final class MarkersUpdated extends MarkersState {
  MarkersUpdated({required List<MarkerWrapper> markers}): super(markers: markers);
}
