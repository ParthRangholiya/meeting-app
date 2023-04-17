import 'package:get/get.dart';

import '../controllers/meet_chat_screen_controller.dart';

class MeetChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetChatScreenController>(
      () => MeetChatScreenController(),
    );
  }
}
