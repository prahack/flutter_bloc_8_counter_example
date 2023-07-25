import 'package:flutter/material.dart';

@immutable
abstract class LocalizationEvent {}

class ChangeLocaleEvent extends LocalizationEvent {}
