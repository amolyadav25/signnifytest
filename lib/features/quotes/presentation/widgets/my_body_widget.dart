import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/quote_page/quote_page_bloc.dart';
import '../bloc/quotes_bloc/quotes_bloc.dart';
import 'error_widget.dart';
import 'loading_widget.dart';
import 'press_button_text.dart';
import 'quote_page_view.dart';

class MyBodyWidget extends StatelessWidget {
  const MyBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesBloc, QuotesState>(
      builder: (BuildContext context, QuotesState state) {
        if (state is QuotesLoading) {
          return const LoadingWidget();
        } else if (state is QuotesError) {
          return ErrorWidgets(errorMessage: state.errorMessage);
        } else if (state is QuotesLoaded) {
          return QuotePageView(
            quotes:  state.quotes,
            bloc: context.read<QuotePageBloc>(),
          );
        } else {
          return const PressButtonWidget();
        }
      },
    );
  }
}
