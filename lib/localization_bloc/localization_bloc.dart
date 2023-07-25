import 'dart:ui';

import 'package:bloc/bloc.dart';

import 'localization_state.dart';
import 'localization_event.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState.initialState) {
    on<ChangeLocaleEvent>(changeLocaleMethod);
  }

  void changeLocaleMethod(ChangeLocaleEvent event, Emitter emit) {
    Locale locale = const Locale('en');
    if (state.locale.languageCode == 'en') {
      locale = const Locale.fromSubtags(languageCode: 'es');
    } else {
      locale = const Locale.fromSubtags(languageCode: 'en');
    }
    emit(state.clone(locale: locale));
  }
}
