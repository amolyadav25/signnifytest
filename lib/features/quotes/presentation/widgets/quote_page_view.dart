import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator.dart';
import '../../domain/entity/quote_entity.dart';
import '../bloc/quote_page/quote_page_bloc.dart';

import '../bloc/quote_page/quote_page_event.dart';
import '../bloc/quote_page/quote_page_state.dart';
import 'page_navigation_buttons.dart';
import 'quote_card.dart';

class QuotePageView extends StatelessWidget {
  const QuotePageView({
    super.key,
    required this.quotes,
    required this.bloc,
  });

  final List<QuoteEntity> quotes;
  final QuotePageBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotePageBloc, QuotePageState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: quotes.length,
                controller: getIt<PageController>(),
                onPageChanged: (index) {
                  bloc.add(PageChangedEvent(index));
                },
                itemBuilder: (context, index) {
                  final quote = quotes[index];
                  return QuoteCard(quote: quote);
                },
              ),
            ),
            PageNavigationButtons(bloc: bloc),
          ],
        );
      },
    );
  }
}
