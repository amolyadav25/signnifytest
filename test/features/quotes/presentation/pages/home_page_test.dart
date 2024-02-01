import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:signify_test/features/quotes/domain/entity/quote_entity.dart';
import 'package:signify_test/features/quotes/domain/use_case/get_quotes_use_case.dart';
import 'package:signify_test/features/quotes/presentation/bloc/quotes_bloc/quotes_bloc.dart';
import 'package:signify_test/features/quotes/presentation/pages/home_page.dart';
import 'package:signify_test/features/quotes/presentation/widgets/home_app_bar.dart';
import 'package:signify_test/features/quotes/presentation/widgets/my_body_widget.dart';

class MockGetQuotesUseCase extends Mock implements GetQuotesUseCase {}

void main() {
  group('HomePage', () {
    late QuotesBloc quotesBloc;
    late MockGetQuotesUseCase mockGetQuotesUseCase;
    setUp(() {
      mockGetQuotesUseCase = MockGetQuotesUseCase();
      quotesBloc = QuotesBloc(
        getQuotesUseCase: mockGetQuotesUseCase,
      );
    });

    tearDown(() {
      quotesBloc.close();
    });

    testWidgets('Renders Loading State', (WidgetTester tester) async {
      when(() => mockGetQuotesUseCase.execute()).thenAnswer((_) async => [
            const QuoteEntity(
              id: '1',
              content: 'Sample quote content',
              author: 'Sample Author',
              tags: ['tag1', 'tag2'],
              authorSlug: 'sample-author',
              length: 42,
              dateAdded: '2024-16-01',
              dateModified: '2024-01-02',
            ),
          ]);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: quotesBloc,
            child: const HomePage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyBodyWidget), findsOneWidget);

      expect(find.byType(HomeAppBar), findsOneWidget);

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
