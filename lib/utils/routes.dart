import 'package:flutter/material.dart';
import 'package:dragon_ball_catallog_flutter/detail/presentation/detail_screen.dart';
import 'package:dragon_ball_catallog_flutter/home/presentation/home_screen.dart';

// Se encarga de definir las rutas y de generar la ruta correspondiente.
class Routes {
  static const String home = '/';
  static const String detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case detail:
        final int id = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => DetailScreen(id: id));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
