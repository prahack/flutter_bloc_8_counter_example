import 'package:flutter/material.dart';

@immutable
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class JumpToEvent extends CounterEvent {
  final int num;

  JumpToEvent(this.num);
}
