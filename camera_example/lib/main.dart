import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import "package:path/path.dart" as p;
import "package:path_provider/path_provider.dart" as pv;

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraPicturePage(),
    );
  }
}

class CameraPicturePage extends StatefulWidget {
  CameraPicturePage({Key key}) : super(key: key);

  @override
  _CameraPicturePageState createState() => _CameraPicturePageState();
}

class _CameraPicturePageState extends State<CameraPicturePage> {
  String _imageDirectoryPath;
  CameraController _controller;
  bool _isCameraLoding = true;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // 카메라 초기화
  Future<void> initCamera() async {
    try {
      CameraDescription _camera = await getCamera();

      _controller = CameraController(
        _camera,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await _controller.initialize();

      var directoryPath = (await pv.getExternalStorageDirectory()).path;

      setState(() {
        _isCameraLoding = false;
        _imageDirectoryPath = directoryPath;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<CameraDescription> getCamera() async {
    return (await availableCameras()).first;
  }

  @override
  Widget build(BuildContext context) {
    if (_isCameraLoding) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: CameraPreview(_controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            var imagePath =
                p.join(_imageDirectoryPath, "${DateTime.now()}.png");
            _controller.takePicture(imagePath);
            print(imagePath);
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
