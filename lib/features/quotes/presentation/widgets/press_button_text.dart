import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/mytheme.dart';
import '../../../../core/utils/responsive_utils.dart';

class PressButtonWidget extends StatelessWidget {
  const PressButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 70.0,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                Constants.pressButtonText,
                textStyle: TextStyle(
                  fontSize: getFontSize(
                    MediaQuery.of(context).size.width,
                  ),
                ),
                colors: isDarkMode ? MyThemes.darkColorizeColors : MyThemes.lightColorizeColors,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
