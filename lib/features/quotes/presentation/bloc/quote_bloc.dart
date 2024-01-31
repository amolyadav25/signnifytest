import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/quote_entity.dart';
import '../../domain/usecase/get_random_quote_use_case.dart';
import '../../domain/usecase/get_quotes_use_case.dart';  // Import the new use case
part 'quote_state.dart';

class QuoteBloc extends Cubit<QuoteState> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;
  final GetQuotesUseCase getQuotesUseCase;  // Include GetQuotesUseCase

  QuoteBloc({
    required this.getRandomQuoteUseCase,
    required this.getQuotesUseCase,
  }) : super(const QuoteInitial());

  Future<void> fetchRandomQuote() async {
    emit(const QuoteLoading());
    try {
      final quoteEntity = await getRandomQuoteUseCase.execute();
      emit(QuoteLoaded(quoteEntity));
    } catch (e) {
      emit(const QuoteError('Failed to load quote'));
    }
  }

  Future<void> fetchAllQuotes() async {
    emit(const QuoteLoading());
    try {
      final quotes = await getQuotesUseCase.execute();
      emit(QuotesLoaded(quotes));
    } catch (e) {
      emit(const QuoteError('Failed to load quotes'));
    }
  }
}
