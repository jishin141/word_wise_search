part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class WordSearchEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class SearchButtonClickEvent extends HomeEvent {
  final String word;
  const SearchButtonClickEvent({required this.word});
}

class AudioButtonClickEvent extends HomeEvent {
  final String audio;
  const AudioButtonClickEvent({required this.audio});
}
