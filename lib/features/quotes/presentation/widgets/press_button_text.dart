import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_utils.dart';

class PressButtonWidget extends StatelessWidget {
  const PressButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:  Text(
          Constants.pressButtonText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: getFontSize(
              MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}
