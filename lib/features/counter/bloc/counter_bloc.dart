import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CountIncrementEvent>(_incrementCount);
    on<CountDecrementEvent>(_decrementCount);
  }

  _incrementCount(CountIncrementEvent event, Emitter<CounterState> emit) {
    int count = state.count;
    count++;
    emit(CounterIncrementedState(count: count));
  }

  _decrementCount(CountDecrementEvent event, Emitter<CounterState> emit) {
    int count = state.count;
    count--;
    emit(CounterDecrementedState(count: count));
  }
}
