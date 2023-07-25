import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:new_bloc/counter_page/counter_bloc.dart';
import 'package:new_bloc/counter_page/counter_event.dart';
import 'package:new_bloc/counter_page/counter_state.dart';

void main() {
  group('MockBloc', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('is compatible with when', () {
      when(() => counterBloc.state);
      expect(counterBloc.state, CounterState.initialState);
    });

    test('is compatible with add', () {
      counterBloc.add(IncrementEvent());
    });

    test('is compatible with add', () {
      counterBloc.add(DecrementEvent());
    });

    test('is compatible with add', () {
      counterBloc.add(JumpToEvent(0));
    });

    blocTest<CounterBloc, CounterState>(
      'supports matchers (contains)',
      build: () => counterBloc,
      act: (bloc) => bloc.add(DecrementEvent()),
      expect: () => [CounterState.initialState.clone(counter: CounterState.initialState.counter - 1)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [11] when CounterEvent.increment is added and emitted 10',
      build: () => CounterBloc(),
      seed: () => CounterState.initialState.clone(counter: 10),
      act: (bloc) => bloc.add(IncrementEvent()),
      expect: () => [const CounterState(counter: 0, text: 'Jump to ZERO from 10',)],
    );
  });
}
