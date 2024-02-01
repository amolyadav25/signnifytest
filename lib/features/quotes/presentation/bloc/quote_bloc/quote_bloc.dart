import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/quote_entity.dart';
import '../../../domain/use_case/get_random_quote_use_case.dart';
part 'quote_state.dart';

class QuoteBloc extends Cubit<QuoteState> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;

  QuoteBloc({
    required this.getRandomQuoteUseCase,
  }) : super(const QuoteInitial()) {
    fetchRandomQuote();
  }

  Future<void> fetchRandomQuote() async {
    emitLoadingState();
    try {
      final quoteEntity = await getRandomQuoteUseCase.execute();
      emitSuccessState(QuoteLoaded(quoteEntity));
    } catch (e) {
      emitErrorState('$e');
    }
  }

  void emitLoadingState() {
    emit(const QuoteLoading());
  }

  void emitSuccessState(QuoteState state) {
    emit(state);
  }

  void emitErrorState(String error) {
    emit(QuoteError(error));
  }
}
