part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class WordLoadingState extends HomeState {}

class WordLoadingSuccessState extends HomeState {
  final String meaning;
  final String audio;
  const WordLoadingSuccessState({required this.meaning, required this.audio});
}

class WordLoadingErrorState extends HomeState {}
