import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final _stateStreamcontroller = StreamController<int>();
  StreamSink<int> get _counterSink => _stateStreamcontroller.sink;
  Stream<int> get counterStream => _stateStreamcontroller.stream;

  final _eventSreamController = StreamController<int>();
  StreamSink<int> get eventSink => _eventSreamController.sink;
  Stream<int> get _eventStream => _eventSreamController.stream;

  CounterBloc() : super(CounterInitial()) {
  dynamic counter = 0;

  on<IncrementEvent>((event, emit) {
    counter++;
    _counterSink.add(counter);
  });
  on<DecrementEvent>((event, emit) {
    counter--;
    _counterSink.add(counter);
  });
  on<ResetEvent>((event, emit) {
    counter = 0;
    _counterSink.add(counter);
  });
  }
}
