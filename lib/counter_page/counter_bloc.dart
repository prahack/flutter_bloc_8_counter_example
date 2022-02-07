import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_bloc/counter_page/counter_event.dart';
import 'package:new_bloc/counter_page/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(BuildContext buildContext) : super(CounterState.initialState) {
    on<IncrementEvent>((event, emit) {
      if (state.counter == 10) {
        emit(const CounterState(counter: 0));
      } else {
        emit(CounterState(counter: state.counter + 1));
      }
    });
    on<DecrementEvent>((event, emit) {
      if (state.counter == -10) {
        emit(const CounterState(counter: 0));
      } else {
        emit(CounterState(counter: state.counter - 1));
      }
    });
  }
}
