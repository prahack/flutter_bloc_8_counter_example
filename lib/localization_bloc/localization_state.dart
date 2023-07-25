import 'package:flutter/material.dart';

@immutable
class LocalizationState {
  final Locale locale;

  const LocalizationState({
    required this.locale,
  });

  static LocalizationState get initialState => const LocalizationState(
        locale: Locale('en'),
      );

  LocalizationState clone({
    Locale? locale,
  }) {
    return LocalizationState(
      locale: locale ?? this.locale,
    );
  }
}
