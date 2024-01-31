import '../entity/quote_entity.dart';

abstract class QuoteRepository {
  Future<QuoteEntity> getRandomQuote();
  Future<QuoteEntity> getLocalQuote();
  Future<List<QuoteEntity>> getQuotes();
  Future<List<QuoteEntity>> getLocalQuotes();
}