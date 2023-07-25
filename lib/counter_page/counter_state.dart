import 'package:flutter/material.dart';

@immutable
class CounterState {
  final int counter;
  final String text;

  const CounterState({
    required this.counter,
    required this.text,
  });

  static CounterState get initialState => const CounterState(
        counter: 0,
        text: 'bloc 8',
      );

  CounterState clone({
    int? counter,
    String? text,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      text: text ?? this.text,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter &&
          text == other.text;

  @override
  int get hashCode => counter.hashCode ^ text.hashCode;
}
