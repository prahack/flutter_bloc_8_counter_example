import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc/counter_page/counter_bloc.dart';
import 'package:new_bloc/counter_page/counter_event.dart';
import 'package:new_bloc/counter_page/counter_state.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // use of context.select
            Builder(
              builder: (context) {
                final text =
                    context.select((CounterBloc bloc) => bloc.state.text);
                return Text(text);
              },
            ),
            const Text(
              '-10 to 10 counter current state value:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (pre, current) => pre.counter != current.counter,
                builder: (context, state) {
                  return Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // use of context.read
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(JumpToEvent(0)),
            tooltip: 'JumpToZero',
            child: const Icon(Icons.undo_sharp),
          ),
          FloatingActionButton(
            onPressed: () => counterBloc.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => counterBloc.add(IncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
