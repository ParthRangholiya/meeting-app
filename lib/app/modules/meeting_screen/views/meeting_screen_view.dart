import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/app/data/resources/firestore_method.dart';
import 'package:zoom_clone/utils/colors.dart';

import '../controllers/meeting_screen_controller.dart';

class MeetingScreenView extends GetView<MeetingScreenController> {
  const MeetingScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting History'),
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirestoreMethods().meetingsHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Room Name : ${(snapshot.data! as dynamic).docs[index]["meeting"]}',
                ),
                subtitle: Text(
                  'Joined on ${DateFormat.yMMMMd().format((snapshot.data! as dynamic).docs[index]["createdAt"].toDate())}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
