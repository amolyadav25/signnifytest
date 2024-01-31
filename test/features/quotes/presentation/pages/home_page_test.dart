import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:signify_test/features/quotes/domain/entity/quote_entity.dart';
import 'package:signify_test/features/quotes/domain/usecase/get_quotes_use_case.dart';
import 'package:signify_test/features/quotes/domain/usecase/get_random_quote_use_case.dart';
import 'package:signify_test/features/quotes/presentation/bloc/quote_bloc.dart';
import 'package:signify_test/features/quotes/presentation/pages/home_page.dart';
import 'package:signify_test/features/quotes/presentation/widgets/press_button_text.dart';

class MockGetRandomQuoteUseCase extends Mock implements GetRandomQuoteUseCase {}

class MockGetQuotesUseCase extends Mock implements GetQuotesUseCase {}

void main() {
  group('HomePage', () {
    late QuoteBloc quoteBloc;
    late MockGetRandomQuoteUseCase mockGetRandomQuoteUseCase;
    late MockGetQuotesUseCase mockGetQuotesUseCase;
    setUp(() {
      mockGetRandomQuoteUseCase = MockGetRandomQuoteUseCase();
      mockGetQuotesUseCase = MockGetQuotesUseCase();
      quoteBloc = QuoteBloc(
          getRandomQuoteUseCase: mockGetRandomQuoteUseCase,
          getQuotesUseCase: mockGetQuotesUseCase);
    });

    tearDown(() {
      quoteBloc.close();
    });

    testWidgets('Renders Loading State', (WidgetTester tester) async {
      when(() => mockGetRandomQuoteUseCase.execute()).thenAnswer(
        (_) async => const QuoteEntity(
          id: '1',
          content: 'Sample quote content',
          author: 'Sample Author',
          tags: ['tag1', 'tag2'],
          authorSlug: 'sample-author',
          length: 42,
          dateAdded: '2024-16-01',
          dateModified: '2024-01-02',
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: quoteBloc,
            child: const HomePage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(PressButtonWidget), findsOneWidget);
    });

    testWidgets('Renders Loaded State', (WidgetTester tester) async {
      when(() => mockGetRandomQuoteUseCase.execute()).thenAnswer(
        (_) async => const QuoteEntity(
          id: '1',
          content: 'Sample quote content',
          author: 'Sample Author',
          tags: ['tag1', 'tag2'],
          authorSlug: 'sample-author',
          length: 42,
          dateAdded: '2024-01-01',
          dateModified: '2024-01-02',
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: quoteBloc,
            child: const HomePage(),
          ),
        ),
      );

      quoteBloc.fetchRandomQuote();

      await tester.pumpAndSettle();

      expect(find.text('Sample quote content'), findsOneWidget);
      expect(find.text('- Sample Author'), findsOneWidget);
    });

  });
}
