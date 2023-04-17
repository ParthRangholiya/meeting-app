import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:zoom_clone/app/data/resources/auth_methods.dart';
import 'package:zoom_clone/app/data/resources/jitsi_meet_methd.dart';

class VideoCallScreenController extends GetxController {
  @override
  void onInit() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: authMethods.user.displayName,
    );
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    meetingIdController.clear();
    nameController.clear();
    JitsiMeet.removeAllListeners();
  }

  final AuthMethods authMethods = AuthMethods();
  final JitsiMeetMethod jitsiMeetMethod = JitsiMeetMethod();
  late TextEditingController meetingIdController = TextEditingController();
  late TextEditingController nameController = TextEditingController();

  final _isAudioMuted = true.obs;
  bool get isAudioMuted => _isAudioMuted.value;
  set isAudioMuted(bool value) => _isAudioMuted.value = value;

  final _isVideoMuted = true.obs;
  bool get isVideoMuted => _isVideoMuted.value;
  set isVideoMuted(bool value) => _isVideoMuted.value = value;

  void joinMeeting() {
    jitsiMeetMethod.createMeeting(
      meetingIdController.text,
      isAudioMuted,
      isVideoMuted,
      nameController.text,
    );
  }

  onAudioMuted(bool val) {
    isAudioMuted = !val;
  }

  onVideoMuted(bool val) {
    isVideoMuted = !val;
  }
}
