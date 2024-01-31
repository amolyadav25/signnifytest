part of 'quote_bloc.dart';
abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object?> get props => [];
}

class QuoteInitial extends QuoteState {
  const QuoteInitial();
}

class QuoteLoading extends QuoteState {
  const QuoteLoading();
}

class QuoteLoaded extends QuoteState {
  final QuoteEntity quoteEntity;

  const QuoteLoaded(this.quoteEntity);

  @override
  List<Object?> get props => [quoteEntity];
}
class QuotesLoaded extends QuoteState {
  final List<QuoteEntity> quotes;

  const QuotesLoaded(this.quotes);

  @override
  List<Object> get props => [quotes];
}

class QuoteError extends QuoteState {
  final String errorMessage;

  const QuoteError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
