import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/meeting_option.dart';
import '../controllers/video_call_screen_controller.dart';

class VideoCallScreenView extends GetView<VideoCallScreenController> {
  const VideoCallScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join a Meeting'),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondarybackgroundColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Room ID",
                contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                fillColor: secondarybackgroundColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Name",
                contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: controller.joinMeeting,
              child: const Text(
                "Join",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => MeetingOption(
                text: "Mute Audio",
                isMute: controller.isAudioMuted,
                onchange: (val) {
                  controller.onAudioMuted(controller.isAudioMuted);
                },
              ),
            ),
            Obx(
              () => MeetingOption(
                text: "Turn Off My Video",
                isMute: controller.isVideoMuted,
                onchange: (val) {
                  controller.onVideoMuted(controller.isVideoMuted);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
