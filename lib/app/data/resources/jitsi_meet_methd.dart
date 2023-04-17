import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:zoom_clone/app/data/resources/auth_methods.dart';
import 'package:zoom_clone/app/data/resources/firestore_method.dart';

class JitsiMeetMethod {
  final AuthMethods authMethods = AuthMethods();
  final FirestoreMethods firestoreMethods = FirestoreMethods();

  Future<void> createMeeting(
    String roomName,
    bool isAudioMuted,
    bool isVideoMuted,
    String username,
  ) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; 

      String name;
      if (username.isEmpty) {
        name = authMethods.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = authMethods.user.email
        ..userAvatarURL = authMethods.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      firestoreMethods.addToMeetingHistoty(roomName);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
