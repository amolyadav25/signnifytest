abstract class QuotePageEvent {}

class PageChangedEvent extends QuotePageEvent {
  final int newIndex;

  PageChangedEvent(this.newIndex);
}

class NextPageEvent extends QuotePageEvent {}

class PreviousPageEvent extends QuotePageEvent {}