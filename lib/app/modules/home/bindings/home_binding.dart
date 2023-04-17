import 'package:get/get.dart';
import 'package:zoom_clone/app/modules/meet_chat_screen/controllers/meet_chat_screen_controller.dart';
import 'package:zoom_clone/app/modules/meeting_screen/controllers/meeting_screen_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MeetChatScreenController>(
      () => MeetChatScreenController(),
    );
    Get.lazyPut<MeetingScreenController>(
      () => MeetingScreenController(),
    );
  }
}
