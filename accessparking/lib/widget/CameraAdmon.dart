// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';
import 'package:accessparking/widget/Pconfi.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraAdmon extends StatefulWidget {
  const CameraAdmon({super.key});

  @override
  State<CameraAdmon> createState() => _CameraAdmonState();
}

class _CameraAdmonState extends State<CameraAdmon> with WidgetsBindingObserver {
  bool _isGranted = false;
  late final Future<void> _future;
  CameraController? _cameraController;
  final textRecognizer = TextRecognizer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _future = _requestCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    stopCamera();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      stopCamera();
    } else if (state == AppLifecycleState.resumed &&
        _cameraController != null &&
        _cameraController!.value.isInitialized) {
      startCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ocr APP'),
        ),
        body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            return Stack(
              children: [
                if (_isGranted)
                  FutureBuilder<List<CameraDescription>>(
                    future: availableCameras(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _initCameraController(snapshot.data!);
                        return Center(child: CameraPreview(_cameraController!));
                      } else {
                        return const LinearProgressIndicator();
                      }
                    },
                  ),
                Container(
                    child: _isGranted
                        ? Column(
                            children: [
                              Expanded(child: Container()),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: MaterialButton(
                                  color: Colors.blueAccent,
                                  onPressed: _scan,
                                  child: const Text('Capturar'),
                                ),
                              )
                            ],
                          )
                        : const Center(
                            child: Text('Actualizar Permisos'),
                          ))
              ],
            );
          },
        ));
  }

  Future<void> _requestCamera() async {
    final status = await Permission.camera.request();
    _isGranted = status == PermissionStatus.granted;
  }

  void startCamera() {
    // ignore: unnecessary_null_comparison
    if (CameraController != null) {
      _selectedCamera(_cameraController!.description);
    }
  }

  void stopCamera() {
    if (CameraController != null) {
      _cameraController!.dispose();
    }
  }

  void _initCameraController(List<CameraDescription> cameras) {
    if (_cameraController != null) {
      return;
    }
    CameraDescription? camera;
    for (var i = 0; 1 < cameras.length; i++) {
      final CameraDescription current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }

    if (camera != null) {
      _selectedCamera(camera);
    }
  }

  Future<void> _selectedCamera(CameraDescription camera) async {
    _cameraController =
        CameraController(camera, ResolutionPreset.max, enableAudio: false);
    await _cameraController!.initialize();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _scan() async {
    if (_cameraController == null) return;

    final navigator = Navigator.of(context);

    try {
      final picture = await _cameraController!.takePicture();

      final file = File(picture.path);

      final inputImage = InputImage.fromFile(file);

      final recognizerText = await textRecognizer.processImage(inputImage);

      await navigator.push(MaterialPageRoute(
        builder: (context) => Pconfi(text: recognizerText.text),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
