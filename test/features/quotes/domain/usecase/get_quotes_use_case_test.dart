import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:signify_test/features/quotes/domain/entity/quote_entity.dart';
import 'package:signify_test/features/quotes/domain/repository/quote_repository.dart';
import 'package:signify_test/features/quotes/domain/usecase/get_quotes_use_case.dart';

class MockQuoteRepository extends Mock implements QuoteRepository {}

void main() {
  group('GetQuotesUseCase', () {
    late GetQuotesUseCase useCase;
    late MockQuoteRepository mockRepository;

    setUp(() {
      mockRepository = MockQuoteRepository();
      useCase = GetQuotesUseCase(quoteRepository: mockRepository);
    });

    test('execute returns a list of QuoteEntity on success', () async {
      final expectedQuotes = [
        QuoteEntity(
          id: '1',
          content: 'Quote 1 content',
          author: 'Author 1',
          tags: ['Tag 1'],
          authorSlug: 'author-1',
          length: 50,
          dateAdded: '2024-01-31',
          dateModified: '2024-01-31',
        ),
        QuoteEntity(
          id: '2',
          content: 'Quote 2 content',
          author: 'Author 2',
          tags: ['Tag 2'],
          authorSlug: 'author-2',
          length: 60,
          dateAdded: '2024-01-31',
          dateModified: '2024-01-31',
        ),
      ];

      when(() => mockRepository.getQuotes()).thenAnswer((_) async => expectedQuotes);

      final result = await useCase.execute();

      expect(result, expectedQuotes);
      verify(() => mockRepository.getQuotes()).called(1);
    });
  });
}
