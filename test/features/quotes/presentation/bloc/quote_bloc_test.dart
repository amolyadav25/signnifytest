import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:signify_test/features/quotes/domain/entity/quote_entity.dart';
import 'package:signify_test/features/quotes/domain/usecase/get_quotes_use_case.dart';
import 'package:signify_test/features/quotes/domain/usecase/get_random_quote_use_case.dart';
import 'package:signify_test/features/quotes/presentation/bloc/quote_bloc.dart';

class MockGetRandomQuoteUseCase extends Mock implements GetRandomQuoteUseCase {}

class MockGetQuotesUseCase extends Mock implements GetQuotesUseCase {}

void main() {
  group('QuoteBloc', () {
    late MockGetRandomQuoteUseCase mockGetRandomQuoteUseCase;
    late MockGetQuotesUseCase mockGetQuotesUseCase;

    setUp(() {
      mockGetRandomQuoteUseCase = MockGetRandomQuoteUseCase();
      mockGetQuotesUseCase = MockGetQuotesUseCase();
    });

    blocTest<QuoteBloc, QuoteState>(
      'emits [QuoteLoading, QuoteLoaded] when fetchRandomQuote is called successfully',
      build: () {
        when(() => mockGetRandomQuoteUseCase.execute())
            .thenAnswer((_) async => const QuoteEntity(id: '1', content: 'Test Quote', author: 'Test Author', tags: [], authorSlug: 'test-author', length: 100, dateAdded: '2022-01-31', dateModified: '2022-01-31'));
        return QuoteBloc(getRandomQuoteUseCase: mockGetRandomQuoteUseCase, getQuotesUseCase: mockGetQuotesUseCase);
      },
      act: (bloc) => bloc.fetchRandomQuote(),
      expect: () => [const QuoteLoading(), const QuoteLoaded(QuoteEntity(id: '1', content: 'Test Quote', author: 'Test Author', tags: [], authorSlug: 'test-author', length: 100, dateAdded: '2022-01-31', dateModified: '2022-01-31'))],
    );

    blocTest<QuoteBloc, QuoteState>(
      'emits [QuoteLoading, QuoteError] when fetchRandomQuote fails',
      build: () {
        when(() => mockGetRandomQuoteUseCase.execute()).thenThrow(Exception('Failed to load quote'));
        return QuoteBloc(getRandomQuoteUseCase: mockGetRandomQuoteUseCase, getQuotesUseCase: mockGetQuotesUseCase);
      },
      act: (bloc) => bloc.fetchRandomQuote(),
      expect: () => [const QuoteLoading(), const QuoteError('Failed to load quote')],
    );

    blocTest<QuoteBloc, QuoteState>(
      'emits [QuoteLoading, QuotesLoaded] when fetchAllQuotes is called successfully',
      build: () {
        when(() => mockGetQuotesUseCase.execute()).thenAnswer((_) async => [
          const QuoteEntity(id: '1', content: 'Quote 1', author: 'Author 1', tags: [], authorSlug: 'author-1', length: 50, dateAdded: '2024-01-31', dateModified: '2024-01-31'),
          const QuoteEntity(id: '2', content: 'Quote 2', author: 'Author 2', tags: [], authorSlug: 'author-2', length: 60, dateAdded: '2022-01-31', dateModified: '2022-01-31'),
        ]);
        return QuoteBloc(getRandomQuoteUseCase: mockGetRandomQuoteUseCase, getQuotesUseCase: mockGetQuotesUseCase);
      },
      act: (bloc) => bloc.fetchAllQuotes(),
      expect: () => [const QuoteLoading(), const QuotesLoaded([
        QuoteEntity(id: '1', content: 'Quote 1', author: 'Author 1', tags: [], authorSlug: 'author-1', length: 50, dateAdded: '2024-01-31', dateModified: '2024-01-31'),
        QuoteEntity(id: '2', content: 'Quote 2', author: 'Author 2', tags: [], authorSlug: 'author-2', length: 60, dateAdded: '2022-01-31', dateModified: '2022-01-31'),
      ])],
    );

    blocTest<QuoteBloc, QuoteState>(
      'emits [QuoteLoading, QuoteError] when fetchAllQuotes fails',
      build: () {
        when(() => mockGetQuotesUseCase.execute()).thenThrow(Exception('Failed to load quotes'));
        return QuoteBloc(getRandomQuoteUseCase: mockGetRandomQuoteUseCase, getQuotesUseCase: mockGetQuotesUseCase);
      },
      act: (bloc) => bloc.fetchAllQuotes(),
      expect: () => [const QuoteLoading(), const QuoteError('Failed to load quotes')],
    );
  });
}
