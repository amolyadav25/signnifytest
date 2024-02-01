import '../../domain/entity/quote_entity.dart';
import '../repository/quote_repository.dart';

class GetQuotesUseCase {
  final QuoteRepository quoteRepository;

  GetQuotesUseCase({required this.quoteRepository});

  Future<List<QuoteEntity>> execute() async {
    return await quoteRepository.getQuotes();
  }
}
