import 'package:dragon_ball_catallog_flutter/home/data/repositories/home_repository_impl.dart';
import 'package:dragon_ball_catallog_flutter/home/domain/usecases/get_all_characters.dart';
import 'package:dragon_ball_catallog_flutter/home/presentation/home_screen.dart';
import 'package:dragon_ball_catallog_flutter/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'generated/l10n.dart';

main() async {
  final client = http.Client();
  final repository = HomeRepositoryImpl(client);
  final getAllCharacters = GetAllCharacters(repository);

  await S.load(const Locale('en'));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(getAllCharacters),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: S.current.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
