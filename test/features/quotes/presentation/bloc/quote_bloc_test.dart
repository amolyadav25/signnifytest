import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:signify_test/features/quotes/domain/entity/quote_entity.dart';
import 'package:signify_test/features/quotes/domain/use_case/get_random_quote_use_case.dart';
import 'package:signify_test/features/quotes/presentation/bloc/quote_bloc/quote_bloc.dart';

class MockGetRandomQuoteUseCase extends Mock implements GetRandomQuoteUseCase {}


void main() {
  group('QuoteBloc', () {
    late MockGetRandomQuoteUseCase mockGetRandomQuoteUseCase;

    setUp(() {
      mockGetRandomQuoteUseCase = MockGetRandomQuoteUseCase();
    });

    blocTest<QuoteBloc, QuoteState>(
      'emits [ QuoteLoaded] when fetchRandomQuote is called successfully',
      build: () {
        when(() => mockGetRandomQuoteUseCase.execute())
            .thenAnswer((_) async => const QuoteEntity(id: '1', content: 'Test Quote', author: 'Test Author', tags: [], authorSlug: 'test-author', length: 100, dateAdded: '2022-01-31', dateModified: '2022-01-31'));
        return QuoteBloc(getRandomQuoteUseCase: mockGetRandomQuoteUseCase,);
      },
      act: (bloc) => bloc.fetchRandomQuote(),
      expect: () => [const QuoteLoaded(QuoteEntity(id: '1', content: 'Test Quote', author: 'Test Author', tags: [], authorSlug: 'test-author', length: 100, dateAdded: '2022-01-31', dateModified: '2022-01-31'))],
    );

    blocTest<QuoteBloc, QuoteState>(
      'emits [QuoteLoading, QuoteError] when fetchRandomQuote fails',
      build: () {
        when(() => mockGetRandomQuoteUseCase.execute()).thenThrow('Failed to load quote');
        return QuoteBloc(getRandomQuoteUseCase: mockGetRandomQuoteUseCase,);
      },
      act: (bloc) => bloc.fetchRandomQuote(),
      expect: () => [const QuoteLoading(), const QuoteError('Failed to load quote')],
    );
  });
}
