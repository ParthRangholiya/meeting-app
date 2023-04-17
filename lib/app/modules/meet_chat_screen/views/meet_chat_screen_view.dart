import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/home_meeting_button.dart';
import '../controllers/meet_chat_screen_controller.dart';

class MeetChatScreenView extends GetView<MeetChatScreenController> {
  const MeetChatScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet & chat'),
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetingButton(
                  onPressed: controller.createNewMeeting,
                  text: "New Meeting",
                  icon: Icons.videocam,
                ),
                HomeMeetingButton(
                  onPressed: () {
                    controller.joinMeeting();
                  },
                  text: "Join Meeting",
                  icon: Icons.add_box_rounded,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Create/Join Meetings \n with just a click!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
