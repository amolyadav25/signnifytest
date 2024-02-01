import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/constants.dart';
import '../bloc/quotes_bloc/quotes_bloc.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/my_body_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: MyBodyWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed("random");
        },
        tooltip: Constants.tooTip,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
