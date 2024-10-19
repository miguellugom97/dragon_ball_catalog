import 'package:dragon_ball_catallog_flutter/home/di/home_module.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(
      create: (_) => HomeModule().getHomeViewModelFactory(),
    ),
    // Agrega más proveedores aquí según sea necesario
  ];
}