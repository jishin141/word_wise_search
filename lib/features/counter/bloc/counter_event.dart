part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CountIncrementEvent extends CounterEvent {}

class CountDecrementEvent extends CounterEvent {}
