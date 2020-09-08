import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_app/widgets/camera_capture_button.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:logger/logger.dart';
import "package:path/path.dart" as p;
import "package:path_provider/path_provider.dart" as pv;
import 'package:permission_handler/permission_handler.dart';

final _logger = Logger();

class CameraCapturePage extends StatefulWidget {
  CameraCapturePage({Key key}) : super(key: key);

  @override
  _CameraCapturePageState createState() => _CameraCapturePageState();
}

class _CameraCapturePageState extends State<CameraCapturePage> {
  CameraController _cameraController;
  bool isLoading = true;

  final double topPannelHeight = 60;
  final double bottomPannelHeight = 100;

  @override
  void initState() {
    super.initState();
    // initialize();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  // Future<void> initialize() async {
  //   try {
  //     final cameras = await availableCameras();

  //     // if(Permission.storage)
  //     print(await Permission.storage.request());

  //     _cameraController = CameraController(
  //       cameras[0],
  //       ResolutionPreset.veryHigh,
  //       enableAudio: false,
  //     );
  //     await _cameraController.initialize();

  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // 캡쳐 버튼 컨테이너
  Widget _captureButtonContainer() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          child: CameraCaptureButton(
            onPressed: () async {
              try {
                final directoryPath =
                    (await pv.getExternalStorageDirectory()).path;
                // var imagePath = p.join(
                //   (await pv.getExternalStorageDirectories()),
                //   "${DateTime.now().millisecondsSinceEpoch}.png",
                // );

                // _logger.i("imagePath $imagePath");

                _logger.i(directoryPath);

                final files = Directory(directoryPath).listSync();

                final imageFiles =
                    files.map((e) => FileImage(File(e.path))).toList();

                print(imageFiles);

                // files.map((e) => print(e.toString()));

                // 캡쳐 (주석 풀어야함)
                // await _cameraController.takePicture(imagePath);
              } catch (e) {
                _logger.e(e);
              }
            },
            size: 70,
          ),
        ),
      ),
    );
  }

  // 인풋 프레임 탑 영역
  Widget _topPannel() {
    return Opacity(
      opacity: .5,
      child: Container(
        height: topPannelHeight,
        color: Colors.red,
      ),
    );
  }

  // 인풋 프레임 바텀 영역
  Widget _bottomPannel() {
    return Opacity(
      opacity: .7,
      child: Container(
        height: bottomPannelHeight,
        color: Colors.black54,
        child: Column(
          children: [
            Container(),
            _captureButtonContainer(),
            Container(),
          ],
        ),
      ),
    );
  }

  // 인풋 프레임 / 카메라 위에 덮어씀
  Widget _inputFrame() {
    return SafeArea(
      child: Column(
        children: [
          _topPannel(),
          Expanded(
            child: Container(),
          ),
          _bottomPannel(),
        ],
      ),
    );
  }

  // 카메라 화면
  Widget _preview() {
    return Stack(
      children: [
        CameraPreview(_cameraController),
        _inputFrame(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _LoadingWidget();
    }

    return Scaffold(
      body: _preview(),
    );
  }
}

// 로딩 화면
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
