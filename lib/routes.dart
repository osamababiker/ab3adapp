
import 'package:ab3ad/bindings/authControllerBinding.dart';
import 'package:ab3ad/bindings/cartControllerBinding.dart';
import 'package:ab3ad/bindings/categoriesControllerBinding.dart';
import 'package:ab3ad/bindings/driversControllerBinding.dart';
import 'package:ab3ad/bindings/evaluationsControllerBinding.dart';
import 'package:ab3ad/bindings/imageControllerBinding.dart';
import 'package:ab3ad/bindings/itemsControllerBindings.dart';
import 'package:ab3ad/bindings/locationControllerBinding.dart';
import 'package:ab3ad/bindings/ordersControllerBinding.dart';
import 'package:ab3ad/bindings/settingsControllerBinding.dart';
import 'package:ab3ad/screens/cart/cart_screen.dart';
import 'package:ab3ad/screens/delivery/delivery_screen.dart';
import 'package:ab3ad/screens/delivery_requests/delivery_requests_screen.dart';
import 'package:ab3ad/screens/errors/no_internet.dart';
import 'package:ab3ad/screens/evaluation/evaluation_screen.dart';
import 'package:ab3ad/screens/home/home_screen.dart';
import 'package:ab3ad/screens/location/location_screen.dart';
import 'package:ab3ad/screens/order_form/order_form_screen.dart';
import 'package:ab3ad/screens/orders/order_complete.dart';
import 'package:ab3ad/screens/orders/orders_screen.dart';
import 'package:ab3ad/screens/profile/profile_screen.dart';
import 'package:ab3ad/screens/settings/settings_screen.dart';
import 'package:ab3ad/screens/sign_in/sign_in_screen.dart';
import 'package:ab3ad/screens/sign_up/sign_up_screen.dart';
import 'package:ab3ad/screens/splash/splash_screen.dart';
import 'package:ab3ad/screens/take_order/take_order_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/splash', 
      page: () => const SplashScreen(),
      binding: AuthControllerBinding()
    ),
    GetPage(
      name: '/home', 
      page: () => HomeScreen(),
      bindings: [
        CategoriesControllersBindings(),
        CartControllersBindings(),
        AuthControllerBinding(),
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
        CartControllersBindings(),
        AuthControllerBinding()
      ] 
    ),
    GetPage(
      name: '/location', 
      page: () => const LocationScreen(),
      bindings: [
        LocationControllersBindings(),
        CartControllersBindings(), 
        OrdersControllersBindings(),
        AuthControllerBinding()
      ]
    ),
    GetPage(
      name: '/settings', 
      page: () => SettingsScreen(),
      bindings: [
        SettingsControllersBindings(),
        AuthControllerBinding(),
      ]
    ),
    GetPage(
      name: '/profile', 
      page: () => const ProfileScreen(),
      binding: AuthControllerBinding()
    ),
    GetPage(
      name: '/cart', 
      page: () => const CartScreen(),
      bindings: [
        CartControllersBindings(),
        AuthControllerBinding() 
      ]
    ),
    GetPage(
      name: '/orderComplete', 
      page: () => const OrderCompleteScreen()
    ),
    GetPage(
      name: '/orders', 
      page: () => OrdersScreen(),
      bindings: [
        OrdersControllersBindings(),
        AuthControllerBinding()
      ]
    ),
    GetPage(
      name: '/takeOrder', 
      page: () => const TakeOrderScreen(),
      bindings: [
        OrdersControllersBindings(),
        AuthControllerBinding(),
        LocationControllersBindings(),
        DriversControllersBindings()
      ]
    ),
    GetPage(
      name: '/deliveryRequests', 
      page: () => DeliveryRequestsScreen(),
      bindings: [
        DriversControllersBindings(),
        OrdersControllersBindings(),
        AuthControllerBinding()
      ]
    ),
    GetPage(
      name: '/delivery', 
      page: () => DeliveryScreen(),
      bindings: [
        OrdersControllersBindings()
      ]
    ),
    GetPage(
      name: '/evaluation', 
      page: () => const EvaluationScreen(),
      bindings: [
        EvaluationsControllersBindings(),
        DriversControllersBindings(),
        AuthControllerBinding()
      ]
    ),
    GetPage(
      name: '/noInternet', 
      page: () => const NoInternetScreen()
    )
  ];
}