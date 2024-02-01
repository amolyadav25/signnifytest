

import 'package:flutter/material.dart';

import '../bloc/quote_page/quote_page_bloc.dart';
import '../bloc/quote_page/quote_page_event.dart';

class PageNavigationButtons extends StatelessWidget {
  const PageNavigationButtons({super.key, required this.bloc});

  final QuotePageBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            bloc.add(PreviousPageEvent());
          },
          color: Theme.of(context).colorScheme.onBackground,
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            bloc.add(NextPageEvent());
          },
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ],
    );
  }
}

