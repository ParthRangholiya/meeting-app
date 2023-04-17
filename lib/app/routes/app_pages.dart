import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/meet_chat_screen/bindings/meet_chat_screen_binding.dart';
import '../modules/meet_chat_screen/views/meet_chat_screen_view.dart';
import '../modules/meeting_screen/bindings/meeting_screen_binding.dart';
import '../modules/meeting_screen/views/meeting_screen_view.dart';
import '../modules/signup_page/bindings/signup_page_binding.dart';
import '../modules/signup_page/views/signup_page_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/video_call_screen/bindings/video_call_screen_binding.dart';
import '../modules/video_call_screen/views/video_call_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.MEET_CHAT_SCREEN,
      page: () => const MeetChatScreenView(),
      binding: MeetChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.MEETING_SCREEN,
      page: () => const MeetingScreenView(),
      binding: MeetingScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_CALL_SCREEN,
      page: () => const VideoCallScreenView(),
      binding: VideoCallScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_PAGE,
      page: () => const SignupPageView(),
      binding: SignupPageBinding(),
    ),
  ];
}
