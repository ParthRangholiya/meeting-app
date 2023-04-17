import 'dart:math';

import 'package:get/get.dart';
import 'package:zoom_clone/app/routes/app_pages.dart';
import 'package:zoom_clone/app/data/resources/jitsi_meet_methd.dart';

class MeetChatScreenController extends GetxController {
  final JitsiMeetMethod jitsiMeetMethod = JitsiMeetMethod();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    jitsiMeetMethod.createMeeting(roomName, true, true, null.toString());
  }

  joinMeeting() {
    Get.toNamed(Routes.VIDEO_CALL_SCREEN);
  }
}
