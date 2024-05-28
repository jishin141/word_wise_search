import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:google_fonts/google_fonts.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<SearchButtonClickEvent>(_searchAndFindWord);
    on<AudioButtonClickEvent>(_playAudio);
  }

  FutureOr<void> _searchAndFindWord(
      SearchButtonClickEvent event, Emitter<HomeState> emit) async {
    final word = event.word;

    String baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/$word";
    Dio dioClient = Dio();

    try {
      emit(WordLoadingState());
      final response = await dioClient.get(baseUrl);
      if (response.statusCode == 200) {
        final meaning =
            response.data[0]["meanings"][0]['definitions'][0]['definition'];
        final audio = response.data[0]["phonetics"][0]['audio'];
        log(audio);

        log(meaning);
        emit(WordLoadingSuccessState(meaning: meaning, audio: audio));
      }
    } catch (error) {
      emit(WordLoadingErrorState());
      log(error.toString());
    }
  }

  FutureOr<void> _playAudio(
      AudioButtonClickEvent event, Emitter<HomeState> emit) async {
    final player = AudioPlayer();

    try {
      await player.play(UrlSource(event.audio));
    } catch (error) {
      log(error.toString());
    }
  }
}
