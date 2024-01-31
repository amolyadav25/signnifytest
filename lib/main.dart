import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signify_test/service_locator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/utils/constants.dart';
import 'core/utils/mytheme.dart';
import 'features/quotes/domain/entity/quote_entity_adapter.dart';
import 'features/quotes/presentation/bloc/quote_bloc.dart';
import 'features/quotes/presentation/bloc/quote_page_bloc.dart';
import 'features/quotes/presentation/pages/home_page.dart';

void main() async {
  // Setup Dependencies
  setupDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  await initializeApp();

  runApp(const MyApp());
}

Future<void> initializeApp() async {
  Hive.registerAdapter(QuoteEntityAdapter());
  await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: MyThemes.lightThemes,
      darkTheme: MyThemes.darkThemes,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<QuoteBloc>(
            create: (context) => getIt<QuoteBloc>(),
          ),
          BlocProvider<QuotePageBloc>(
            create: (context) => getIt<QuotePageBloc>(),
          ),
        ],
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
