// import 'dart:io';
// import 'package:flutter/cupertino.dart';

// class Routes {
//   static final Routes _routes = Routes._internal();
//   Routes._internal();
//   static Routes get instance => _routes;
//   static const String roleScreen = '/roleScreen';
//   static const String login = '/login';
//   static const String signUpScreen = '/signUp';
//   static const String homeScreen = '/home_screen';
//   static const String userOrAdminScreen = '/userOrAdminScreen';
//   static const String forgotPassScreen = '/forgotPassScreen';
//   static const String otpVerifyScreen = '/otpVerifyScreen';
//   static const String newPassScreen = '/newPassScreen';
//   static const String searchScreen = '/searchScreen';
//   static const String msqDetailsScreen = '/msqDetailsScreen';
//   static const String createQuestion = '/createQuestion';
//   static const String communityDetails = '/communityDetails';
//   static const String profileScreen = '/profileScreen';
//   static const String donationDetails = '/donationDetails';
//   static const String notification = '/notificationScreen';
//   static const String adminSignUp = '/adminSignUp';
//   static const String volunteeringDetails = '/volunteeringDetails';

//   static const String createPost = '/createPost';
//   static const String createEvent = '/createEvent';
//   static const String createAdvertisement = '/createAdvertisement';
//   static const String donationsPost = '/donationsPost';
//   static const String volunteeringAnnouncement = '/volunteeringAnnouncementScreen';

//   static const String donationHistory = '/donationHistory';
//   static const String verificationStatus = '/verificationStatus';

// }

// class RouteGenerator {
//   static final RouteGenerator _routeGenerator = RouteGenerator._internal();
//   RouteGenerator._internal();
//   static RouteGenerator get instance => _routeGenerator;

//   static Route<dynamic>? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.userOrAdminScreen:
//         final args = settings.arguments as Map;
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: UserOrAdimnOptionScreen(
//                   loginOrSignUp: args['loginOrSignUp'],
//                 ),
//                 settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => UserOrAdimnOptionScreen(
//                       loginOrSignUp: args['loginOrSignUp'],
//                     ));

//       default:
//         return null;
//     }
//   }
// }

// class _FadedTransitionRoute extends PageRouteBuilder {
//   final Widget widget;
//   @override
//   final RouteSettings settings;

//   _FadedTransitionRoute({required this.widget, required this.settings})
//       : super(
//           settings: settings,
//           reverseTransitionDuration: const Duration(milliseconds: 1),
//           pageBuilder: (BuildContext context, Animation<double> animation,
//               Animation<double> secondaryAnimation) {
//             return widget;
//           },
//           transitionDuration: const Duration(milliseconds: 1),
//           transitionsBuilder: (BuildContext context,
//               Animation<double> animation,
//               Animation<double> secondaryAnimation,
//               Widget child) {
//             return FadeTransition(
//               opacity: CurvedAnimation(
//                 parent: animation,
//                 curve: Curves.ease,
//               ),
//               child: child,
//             );
//           },
//         );
// }
