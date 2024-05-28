part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();
  final int count = 1;

  @override
  List<Object> get props => [count];
}

final class CounterInitial extends CounterState {}

class CounterIncrementedState extends CounterState {
  final int count;
  CounterIncrementedState({required this.count});
  @override
  List<Object> get props => [count];
}

class CounterDecrementedState extends CounterState {
  final int count;
  CounterDecrementedState({required this.count});
  @override
  List<Object> get props => [count];
}
