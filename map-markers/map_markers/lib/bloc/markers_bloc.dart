import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:map_markers/model/marker_Wrapper.dart';

part 'markers_event.dart';
part 'markers_state.dart';

class MarkersBloc extends Bloc<MarkersEvent, MarkersState> {
  MarkersBloc() : super(MarkersInitial(markers: const []) ) {
    on<AddMarker>(_addMarker);
    on<DeleteMarker>(_removeMarker);
    on<UpdateMarker>(_updateMarker);
  }

  void _addMarker(AddMarker event,Emitter<MarkersState> emit) {
    state.markers.add(event.m);
    emit(MarkersUpdated(markers: state.markers) );
  }

  void _removeMarker(DeleteMarker event,Emitter<MarkersState> emit) {
    state.markers.remove(event.m);
    emit(MarkersUpdated(markers: state.markers) );
  }

  void _updateMarker(UpdateMarker event,Emitter<MarkersState> emit) {
    for(int i = 0; i < state.markers.length; i++) {
      if(event.m.id == state.markers[i].id) {
        state.markers[i] = event.m;
      }
    }
    emit(MarkersUpdated(markers: state.markers) );
  }

}
