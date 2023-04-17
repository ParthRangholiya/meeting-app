import 'package:get/get.dart';

import '../controllers/video_call_screen_controller.dart';

class VideoCallScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoCallScreenController>(
      () => VideoCallScreenController(),
    );
  }
}
