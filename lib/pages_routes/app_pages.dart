import 'package:get/get.dart';
import 'package:pontal_delivery/pages/auth/view/sign_in_screen.dart';
import 'package:pontal_delivery/pages/auth/view/sign_up_screen.dart';
import 'package:pontal_delivery/pages/base/base_screen.dart';
import 'package:pontal_delivery/pages/home/binding/home_binding.dart';
import 'package:pontal_delivery/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => SplashScreen(),
      name: PagesRoutes.splashRoute,
    ),
    GetPage(
      page: () => SignInscreen(),
      name: PagesRoutes.signInRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PagesRoutes.signUpRoute,
    ),
    GetPage(
      page: () => const Basescreen(),
      name: PagesRoutes.baseRoute,
      bindings: [
        HomeBinding(),
      ]
    )
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
