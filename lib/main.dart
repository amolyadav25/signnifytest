import 'package:flutter/material.dart';
import 'package:signify_test/routes/app_routes.dart';
import 'package:signify_test/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/utils/constants.dart';
import 'core/utils/my_theme.dart';
import 'features/quotes/domain/entity/quote_entity_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  setupDependencies();
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
    return MaterialApp.router(
      title: Constants.appName,
      theme: MyThemes.lightThemes,
      darkTheme: MyThemes.darkThemes,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
