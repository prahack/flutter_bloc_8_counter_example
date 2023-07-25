import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc/counter_page/counter_bloc.dart';
import 'package:new_bloc/counter_page/counter_view.dart';

class CounterProvider extends BlocProvider<CounterBloc> {
  CounterProvider({
    Key? key,
  }) : super(
          key: key,
          create: (context) => CounterBloc(),
          child: const CounterView(),
        );
}
