import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/utils/mytheme.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entity/quote_entity.dart';
import '../bloc/quote_page_bloc.dart';
import '../bloc/quote_page_event.dart';
import '../bloc/quote_page_state.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class QuotePageView extends StatelessWidget {
  final List<QuoteEntity> quotes;
  final PageController pageController;

  const QuotePageView({
    Key? key,
    required this.quotes,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuotePageBloc bloc = context.read<QuotePageBloc>();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider.value(
      value: bloc,
      child: Focus(
        child: BlocBuilder<QuotePageBloc, QuotePageState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: quotes.length,
                    controller: bloc.pageController,
                    onPageChanged: (index) {
                      bloc.add(PageChangedEvent(index));
                    },
                    itemBuilder: (context, index) {
                      final quote = quotes[index];
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultTextStyle(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: getFontSize(
                                  MediaQuery.of(context).size.width,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                      quote.content,
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
                            ),
                            const SizedBox(height: 8),
                            DefaultTextStyle(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: getFontSize(
                                  MediaQuery.of(context).size.width,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    WavyAnimatedText(
                                      quote.author,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        bloc.add(PreviousPageEvent());
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        bloc.add(NextPageEvent());
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
