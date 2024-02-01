import 'package:flutter/material.dart';

import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entity/quote_entity.dart';
import 'rating_bar_widget.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key, required this.quote});

  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              key: Key('content-${quote.content}'),
              quote.content,
              style: TextStyle(
                fontSize: getFontSize(
                  MediaQuery.of(context).size.width,
                ),
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              quote.author,
              key: Key('author-${quote.id}'),
              style: TextStyle(
                fontSize: getFontSize(
                  MediaQuery.of(context).size.width,
                ),
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(width: 8),
            const RatingBarWidget(),
          ],
        ),
      ),
    );
  }
}
