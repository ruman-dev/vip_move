import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vid_move/feature/all_service/presentation/screens/all_service_screen.dart';
import 'package:vid_move/feature/booking/presentation/screens/cancel_booking_screen.dart';
import 'package:vid_move/feature/home/presentation/screens/donation_form_screen.dart';
import 'package:vid_move/feature/home/presentation/screens/feedback_screen.dart';
import 'package:vid_move/feature/home/presentation/screens/order_details_screen.dart';
import 'package:vid_move/feature/home/presentation/screens/schedule_screen.dart';
import 'package:vid_move/feature/home/presentation/screens/service_details_screen.dart';
import 'package:vid_move/feature/auth/presentation/screens/create_pass_screen.dart';
import 'package:vid_move/feature/auth/presentation/screens/forgot_otp_screen.dart';
import 'package:vid_move/feature/auth/presentation/screens/forgot_pass_screens.dart';
import 'package:vid_move/feature/auth/presentation/screens/otp_screen.dart';
import 'package:vid_move/feature/auth/presentation/screens/sign_in_screen.dart';
import 'package:vid_move/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:vid_move/feature/home/presentation/screens/home_screen.dart';
import 'package:vid_move/feature/map/presentation/screens/map_screen.dart';
import 'package:vid_move/feature/message/presentation/screens/calling_screen.dart';
import 'package:vid_move/feature/message/presentation/screens/chat_screen.dart';
import 'package:vid_move/feature/nav_bar/presentation/bottom_nav_bar.dart';
import 'package:vid_move/feature/notification/presentation/screens/notification_screen.dart';
import 'package:vid_move/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:vid_move/feature/home/presentation/screens/popular_service_screen.dart';
import 'package:vid_move/feature/profile/presentation/screens/edit_profile_screen.dart';
import 'package:vid_move/feature/profile/presentation/screens/help_screen.dart';
import 'package:vid_move/feature/profile/presentation/screens/language_screen.dart';
import 'package:vid_move/feature/search/presentation/screens/search_screen.dart';
import 'package:vid_move/feature/splash/presentation/screens/splash_screen.dart';

class Routes {
  static String splashScreen = '/splashScreen';
  static String onboardingScreen = '/onboardingScreen';
  static String signInScreen = '/signInScreen';
  static String signUpScreen = '/signUpScreen';
  static String forgotPassScreen = '/forgotPassScreen';
  static String otpScreen = '/otpScreen';
  static String homeScreen = '/homeScreen';
  static String forgotOtpScreen = '/forgotOtpScreen';
  static String createNewPassScreen = '/createNewPassScreen';
  static String bottomNavBar = '/bottomNavBar';
  static String notificationScreen = '/notificationScreen';
  static String searchScreen = '/searchScreen';
  static String allServiceScreen = '/allServiceScreen';
  static String popularServiceScreen = '/popularServiceScreen';
  static String serviceDetailsScreen = '/serviceDetailsScreen';
  static String orderDetailsScreen = '/orderDetailsScreen';
  static String feedBackScreen = '/feedBackScreen';
  static String donationScreen = '/donationScreen';
  static String cancelBookingScreen = '/cancelBookingScreen';
  static String chatScreen = '/chatScreen';
  static String callingScreen = '/callingScreen';
  static String editProfileScreen = '/editProfileScreen';
  static String languageScreen = '/languageScreen';
  static String helpScreen = '/helpScreen';
  static String scheduleScreen = '/scheduleScreen';
  static String mapScreen = '/mapScreen';

  static List<GetPage> route = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: forgotPassScreen, page: () => ForgotPassScreen()),
    GetPage(name: otpScreen, page: () => OtpScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: forgotOtpScreen, page: () => ForgotOtpScreen()),
    GetPage(name: createNewPassScreen, page: () => CreatePassScreen()),
    GetPage(name: bottomNavBar, page: () => BottomNavBar()),
    GetPage(name: notificationScreen, page: () => NotificationScreen()),
    GetPage(name: searchScreen, page: () => SearchScreen()),
    GetPage(name: allServiceScreen, page: () => AllServiceScreen()),
    GetPage(name: popularServiceScreen, page: () => PopularServiceScreen()),
    GetPage(name: serviceDetailsScreen, page: () => ServiceDetailsScreen()),
    GetPage(name: orderDetailsScreen, page: () => OrderDetailsScreen()),
    GetPage(name: feedBackScreen, page: () => FeedbackScreen()),
    GetPage(name: donationScreen, page: () => DonationFormScreen()),
    GetPage(name: cancelBookingScreen, page: () => CancelBookingScreen()),
    GetPage(name: chatScreen, page: () => ChatScreen()),
    GetPage(name: callingScreen, page: () => CallingScreen()),
    GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    GetPage(name: languageScreen, page: () => LanguageScreen()),
    GetPage(name: helpScreen, page: () => HelpScreen()),
    GetPage(name: scheduleScreen, page: () => ScheduleScreen()),
    GetPage(name: mapScreen, page: () => MapScreen()),
  ];
}
