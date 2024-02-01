part of 'quotes_bloc.dart';
abstract class QuotesState extends Equatable {
  const QuotesState();

  @override
  List<Object?> get props => [];
}

class QuotesInitial extends QuotesState {
  const QuotesInitial();
}

class QuotesLoading extends QuotesState {
  const QuotesLoading();
}

class QuotesLoaded extends QuotesState {
  final List<QuoteEntity> quotes;

  const QuotesLoaded(this.quotes);

  @override
  List<Object> get props => [quotes];
}

class QuotesError extends QuotesState {
  final String errorMessage;

  const QuotesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
