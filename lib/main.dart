import 'package:flutter/material.dart';
import 'package:new_bloc/counter_page/counter_view.dart';

import 'counter_page/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterProvider(),
    );
  }
}
