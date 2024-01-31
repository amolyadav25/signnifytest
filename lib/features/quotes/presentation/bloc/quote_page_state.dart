import 'package:equatable/equatable.dart';

abstract class QuotePageState extends Equatable {
  final int currentIndex;

  const QuotePageState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class QuotePageInitial extends QuotePageState {
  QuotePageInitial(int currentIndex) : super(currentIndex);
}