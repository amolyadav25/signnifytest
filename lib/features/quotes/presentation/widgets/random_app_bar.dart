import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../bloc/quote_bloc/quote_bloc.dart';

class RandomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RandomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (BuildContext context, QuoteState state) {
        return AppBar(
          title: Text(
            Constants.appName,
            style: TextStyle(
              fontSize: getFontSize(
                MediaQuery.of(context).size.width,
              ),
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
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.share,
                      ),
                      onPressed: () {
                        if (state is QuoteLoaded ) {
                          shareQuote(state.quoteEntity);
                        }
                      },
                      iconSize: getIconSize(constraints),
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
