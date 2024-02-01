import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quote_bloc/quote_bloc.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/press_button_text.dart';
import '../widgets/quote_card.dart';
import '../widgets/random_app_bar.dart';

class RandomQuotePage extends StatelessWidget {
  const RandomQuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RandomAppBar(),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (BuildContext context, QuoteState state) {
          if (state is QuoteLoading) {
            return const LoadingWidget();
          } else if (state is QuoteError) {
            return ErrorWidgets(errorMessage: state.errorMessage);
          } else if (state is QuoteLoaded) {
            return QuoteCard(
              quote: state.quoteEntity,
            );
          } else {
            return const PressButtonWidget();
          }
        },
      ),
    );
  }
}
