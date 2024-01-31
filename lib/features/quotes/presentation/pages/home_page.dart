import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/mytheme.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entity/quote_entity.dart';
import '../bloc/quote_bloc.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/press_button_text.dart';
import '../widgets/quote_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        Widget bodyWidget;

        if (state is QuoteLoading) {
          bodyWidget = const LoadingWidget();
        } else if (state is QuoteError) {
          bodyWidget = ErrorWidgets(
            errorMessage: state.errorMessage,
          );
        } else if (state is QuotesLoaded || state is QuoteLoaded) {
          List<QuoteEntity> quotes = state is QuotesLoaded
              ? state.quotes
              : [if (state is QuoteLoaded) state.quoteEntity];
          PageController pageController = PageController();
          bodyWidget = QuotePageView(
            quotes: quotes,
            pageController: pageController,
          );
        } else {
          bodyWidget = const PressButtonWidget();
        }

        return Scaffold(
          appBar: AppBar(
            title: DefaultTextStyle(
              style: TextStyle(
                fontSize: getFontSize(MediaQuery.of(context).size.width),
                color: Colors.white,
                shadows: const [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    Constants.appName,
                    textStyle: TextStyle(
                      fontSize: getFontSize(
                        MediaQuery.of(context).size.width,
                      ),
                    ),
                    colors: isDarkMode
                        ? MyThemes.darkColorizeColors
                        : MyThemes.lightColorizeColors,
                  ),
                ],
              ),
            ),
            actions: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.refresh,
                        ),
                        onPressed: () {
                          context.read<QuoteBloc>().fetchRandomQuote();
                        },
                        iconSize: getIconSize(constraints),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.share,
                        ),
                        onPressed: () {
                          final currentState = context.read<QuoteBloc>().state;

                          if (currentState is QuoteLoaded) {
                            shareQuote(currentState.quoteEntity);
                          }
                        },
                        iconSize: getIconSize(constraints),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: bodyWidget,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<QuoteBloc>().fetchAllQuotes();
            },
            tooltip: Constants.tooTip,
            child: const Icon(Icons.view_list),
          ),
        );
      },
    );
  }
}
