import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexInitial(index: 0) ) {
    on<UpdateIndex>(_updateIndex);
  }

  void _updateIndex(UpdateIndex event,Emitter<IndexState> emit) {
    emit(IndexUpdated(index: event.i) );
  }


}