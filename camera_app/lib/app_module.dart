import 'package:camera_app/pages/camera_capture_page.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/app.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<Router> get routers => [
        Router("/", child: (_, __) => CameraCapturePage()),
      ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  @override
  Widget get bootstrap => App();
}
