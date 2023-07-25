import 'package:new_bloc/counter_page/counter_event.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {

    test('value should be incremented', () {
      final incrementEvent = IncrementEvent();
      expect(incrementEvent, isA<CounterEvent>());
    });

    test('value should be incremented', () {
      final decrementEvent = DecrementEvent();
      expect(decrementEvent, isA<CounterEvent>());
    });

    test('value should be decremented', () {
      final jumpToEvent = JumpToEvent(2);
      expect(jumpToEvent, isA<CounterEvent>());
    });

    test('value should be decremented', () {
      final jumpToEvent = JumpToEvent(5);
      expect(jumpToEvent.num, 5);
    });
  });
}