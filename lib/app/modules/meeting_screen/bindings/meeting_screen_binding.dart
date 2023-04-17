import 'package:get/get.dart';

import '../controllers/meeting_screen_controller.dart';

class MeetingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingScreenController>(
      () => MeetingScreenController(),
    );
  }
}
