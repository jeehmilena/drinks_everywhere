import 'package:get/get.dart';

import '../modules/drink_detail/bindings/drink_detail_binding.dart';
import '../modules/drink_detail/views/drink_detail_view.dart';
import '../modules/drinks/bindings/drinks_binding.dart';
import '../modules/drinks/views/drinks_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DRINKS,
      page: () => DrinksView(),
      binding: DrinksBinding(),
    ),
    GetPage(
      name: _Paths.DRINK_DETAIL,
      page: () => DrinkDetailView(),
      binding: DrinkDetailBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
