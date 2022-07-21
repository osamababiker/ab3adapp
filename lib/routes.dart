
import 'package:ab3ad/bindings/authControllerBinding.dart';
import 'package:ab3ad/bindings/cartControllerBinding.dart';
import 'package:ab3ad/bindings/categoriesControllerBinding.dart';
import 'package:ab3ad/bindings/imageControllerBinding.dart';
import 'package:ab3ad/bindings/itemsControllerBindings.dart';
import 'package:ab3ad/bindings/settingsControllerBinding.dart';
import 'package:ab3ad/controllers/imagePickerController.dart';
import 'package:ab3ad/screens/cart/cart_screen.dart';
import 'package:ab3ad/screens/home/home_screen.dart';
import 'package:ab3ad/screens/location/location_screen.dart';
import 'package:ab3ad/screens/order_form/order_form_screen.dart';
import 'package:ab3ad/screens/profile/profile_screen.dart';
import 'package:ab3ad/screens/settings/settings_screen.dart';
import 'package:ab3ad/screens/sign_in/sign_in_screen.dart';
import 'package:ab3ad/screens/sign_up/sign_up_screen.dart';
import 'package:ab3ad/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(
      name: '/home', 
      page: () => HomeScreen(),
      bindings: [
        CategoriesControllersBindings(),
        CartControllersBindings()
      ]
    ),
    GetPage(
      name: '/signin', 
      page: () => const SignInScreen(),
      binding: AuthControllerBinding()
    ),
    GetPage(
      name: '/signup', 
      page: () => const SignUpScreen(),
      binding: AuthControllerBinding()
    ),
    GetPage(
      name: '/orderForm', 
      page: () => OrderFormScreen(),
      bindings: [
        ItemsControllersBindings(),
        ImageControllersBindings(),
        CartControllersBindings()
      ] 
    ),
    GetPage(
      name: '/location', 
      page: () => const LocationScreen()
    ),
    GetPage(
      name: '/settings', 
      page: () => const SettingsScreen(),
      binding: SettingsControllersBindings()
    ),
    GetPage(
      name: '/profile', 
      page: () => const ProfileScreen()
    ),
    GetPage(
      name: '/cart', 
      page: () => const CartScreen(),
      binding: CartControllersBindings()
    )
  ];
}