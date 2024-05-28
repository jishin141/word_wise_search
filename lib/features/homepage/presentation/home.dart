import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_wise_search/features/homepage/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final wordController = TextEditingController();
    String meaning = '';
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 227, 224, 195),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: wordController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              border: InputBorder.none),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 227, 224, 195),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            final String word = wordController.text;
                            bloc.add(SearchButtonClickEvent(word: word));
                          },
                          icon: const Icon(Icons.search))),
                  const SizedBox(
                    width: 20,
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is WordLoadingSuccessState) {
                        return Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 227, 224, 195),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                onPressed: () {
                                  bloc.add(AudioButtonClickEvent(
                                      audio: state.audio));
                                },
                                icon: const Icon(Icons.speaker_phone)));
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is WordLoadingState) {
                  return const CircularProgressIndicator();
                }
                if (state is WordLoadingSuccessState) {
                  meaning = state.meaning;
                }
                if (state is WordLoadingErrorState) {
                  meaning = 'Some error occured';
                }
                return Text(
                  meaning,
                  style: GoogleFonts.protestRiot(
                      fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
