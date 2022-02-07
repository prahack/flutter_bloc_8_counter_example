import 'package:flutter/material.dart';

@immutable
class CounterState {
  final int counter;

  const CounterState({
    required this.counter,
  });

  static CounterState get initialState => const CounterState(counter: 0);

  CounterState clone({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
