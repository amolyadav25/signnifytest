import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/quote_entity.dart';
import '../../../domain/use_case/get_random_quote_use_case.dart';
import '../../../domain/use_case/get_quotes_use_case.dart';
part 'quotes_state.dart';

class QuotesBloc extends Cubit<QuotesState> {
  final GetQuotesUseCase getQuotesUseCase;

  QuotesBloc({
    required this.getQuotesUseCase,
  }) : super(const QuotesInitial()) {
    fetchAllQuotes();
  }

  Future<void> fetchAllQuotes() async {
    emitLoadingState();
    try {
      final quotes = await getQuotesUseCase.execute();
      emitSuccessState(QuotesLoaded(quotes));
    } catch (e) {
      emitErrorState(e);
    }
  }

  void emitLoadingState() {
    emit(const QuotesLoading());
  }

  void emitSuccessState(QuotesState state) {
    emit(state);
  }

  void emitErrorState(dynamic error) {
    emit(QuotesError('$error'));
  }
}
