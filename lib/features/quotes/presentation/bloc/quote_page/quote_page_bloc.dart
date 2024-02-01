import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'quote_page_event.dart';
import 'quote_page_state.dart';


class QuotePageBloc extends Bloc<QuotePageEvent, QuotePageState> {
  final PageController pageController;
  int currentIndex = 0;

  QuotePageBloc({required this.pageController}) : super(const QuotePageInitial(0)) {
    on<PageChangedEvent>((event, emit) {
      if (currentIndex < pageController.positions.length - 1) {
        currentIndex = event.newIndex;
        _animateToPage();
        emit(QuotePageInitial(currentIndex));
      }
    });

    on<NextPageEvent>((event, emit) {
        currentIndex++;
        _animateToPage();
        emit(QuotePageInitial(currentIndex));

    });

    on<PreviousPageEvent>((event, emit) {
      if (currentIndex > 0) {
        currentIndex--;
        _animateToPage();
        emit(QuotePageInitial(currentIndex));
      }
    });
  }

  void _animateToPage() {
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
