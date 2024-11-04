import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:work_time_check/auth/firebase_auth/auth_util.dart';
import 'package:work_time_check/flutter_flow/flutter_flow_icon_button.dart';
import 'package:work_time_check/flutter_flow/flutter_flow_theme.dart';
import 'package:work_time_check/flutter_flow/upload_data.dart';
import 'package:work_time_check/solo/solo_function.dart';

List<CameraDescription> _cameras = [];

class CustomCameraPage extends StatefulWidget {
  const CustomCameraPage({Key? key}) : super(key: key);

  @override
  State<CustomCameraPage> createState() => _CustomCameraPageState();
}

class _CustomCameraPageState extends State<CustomCameraPage> {
  late CameraController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _cameras = await availableCameras();
      controller = CameraController(_cameras[1], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          isReady = true;
        });
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<dynamic> onTakePictureButtonPressed() async {
    var file = await takePicture();
    final mediaBytes = await compressFile(await file!.readAsBytes());
    final path = getStoragePath(null, file!.name, false);
    final selectedMedia = [
      SelectedFile(
        storagePath: path,
        filePath: file!.path,
        bytes: mediaBytes!,
        dimensions: null,
      )
    ];
    Navigator.pop(context, selectedMedia);
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isReady) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ถ่ายรูปเข้า-ออกงาน',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Kanit',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: CameraPreview(controller),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                color: FlutterFlowTheme.of(context).primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        color: Colors.blue,
                        onPressed: controller != null && controller.value.isInitialized && !controller.value.isRecordingVideo ? onTakePictureButtonPressed : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
