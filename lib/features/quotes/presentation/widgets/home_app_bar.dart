import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../bloc/quotes_bloc/quotes_bloc.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesBloc, QuotesState>(
      builder: (BuildContext context, QuotesState state) {
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
                        Icons.share,
                      ),
                      onPressed: () {
                        int currentIndex =
                            GetIt.instance<PageController>().page?.round() ?? 0;
                        if (state is QuotesLoaded ) {
                          shareQuote(state.quotes[currentIndex]);
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
