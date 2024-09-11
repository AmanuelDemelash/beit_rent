import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/apartmentDetail/bindings/apartment_detail_binding.dart';
import '../modules/apartmentDetail/views/apartment_detail_view.dart';
import '../modules/apartmentDetail/views/over_view_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/forgot_password_view.dart';
import '../modules/auth/views/sign_up_view.dart';
import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.AUTH,
        page: () => AuthView(),
        binding: AuthBinding(),
        children: [
          GetPage(
            name: _Paths.FORGOT,
            page: () => ForgotPasswordView(),
            binding: AuthBinding(),
          ),
          GetPage(
            name: _Paths.SIGNUP,
            page: () => SignUpView(),
            binding: AuthBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
        name: _Paths.APARTMENT_DETAIL,
        page: () => ApartmentDetailView(),
        binding: ApartmentDetailBinding(),
        children: [
          GetPage(
            name: _Paths.OVERVIEW_APARTMENT,
            page: () => OverViewView(),
            binding: AccountBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => const BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
