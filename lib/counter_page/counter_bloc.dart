import 'package:bloc/bloc.dart';
import 'package:new_bloc/counter_page/counter_event.dart';
import 'package:new_bloc/counter_page/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initialState) {
    on<IncrementEvent>((event, emit) {
      if (state.counter == 10) {
        emit(state.clone(counter: 0, text: 'Jump to ZERO from 10'));
      } else {
        emit(state.clone(counter: state.counter + 1));
      }
    });
    on<DecrementEvent>((event, emit) {
      if (state.counter == -10) {
        emit(state.clone(counter: 0, text: 'Jump to ZERO from -10'));
      } else {
        emit(state.clone(counter: state.counter - 1));
      }
    });
    on<JumpToEvent>(jumpToEventMethod);
  }

  void jumpToEventMethod(JumpToEvent event, Emitter emit) {
    emit(state.clone(counter: event.num));
  }
}
