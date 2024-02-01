import 'package:flutter/material.dart';
import 'package:rating_bar_updated/rating_bar_updated.dart';


class RatingBarWidget extends StatelessWidget {

  const RatingBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar(
          onRatingChanged: (rating) => {},
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          halfFilledIcon: Icons.star_half,
          isHalfAllowed: true,
          aligns: Alignment.centerLeft,
          filledColor: Colors.green,
          emptyColor: Colors.redAccent,
          halfFilledColor: Colors.amberAccent,
          size: 48,
        ),
      ],
    );
  }
}
