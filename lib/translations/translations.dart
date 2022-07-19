import 'package:get/get.dart';

abstract class AppTranslation  extends Translations {
  @override
  static Map<String, Map<String, String>>  translationsKeys  = {
    'en': en,
    'ar': ar
  };
}

final Map<String, String> ar = {
  'app_name': 'أبعاد',
  'app_slogan': 'خدمة توصيل غاز من الباب الى الباب', 

  /* home screen translation */
  'home_screen_header_market_btn': 'السوق',
  'home_screen_header_deliver_btn': 'وصلي لي',
  'home_screen_header_confirm_btn': 'اتأكد لي',
  'home_screen_search_hint': 'ما الذي تبحث عنه ؟',
  'home_screen_delivery_to_hint': 'توصيل الى ',
  'home_screen_item_quantity_lable': 'ادخل الكمية التي تريد',
  'home_screen_item_quantity_hint': 'الكمية التي تريد',
  'home_screen_item_price_lable': 'ادخل سعر العنصر التي تريد',
  'home_screen_item_price_hint': 'سعر العنصر',
  'home_screen_add_to_shopping_list_btn': 'حفظ في قائمة التسوق',
  'home_screen_add_to_shopping_list_title': 'حدد الكمية والسعر',
  'home_screen_item_name_validation_error': 'الرجاء ادخال اسم العنصر',
  'home_screen_item_price_validation_error': 'الرجاء ادخال سعر صحيح',
  'home_screen_item_quantity_validation_error': 'الرجاء ادخال كمية صحيحة',

  /* profile screen translation */
  'profile_screen_settings_btn': 'الاعدادات',
  'profile_screen_orders_btn': 'مراسيلي',
  'profile_screen_logout_btn': 'تسجيل خروج',


  /* Signin screen translation */
  'signin_screen_title': 'تسجيل دخول',
  'signin_screen_description': 'خدمة توصيل من الافراد للأفراد',
  'signin_screen_name_validation_error': 'الرجاء ادخال اسم صحيح',
  'signin_screen_phone_validation_error': 'الرجاء ادخال رقم هاتف صحيح',
  'signin_screen_otp_validation_error': 'الرقم المدخل غير صحيح',
  'signin_screen_name_field_label': 'ادخل الاسم',
  'signin_screen_name_field_hint': 'الرجاء ادخال الاسم',
  'signin_screen_phone_field_label': 'ادخل رقم الهاتف',
  'signin_screen_phone_field_hint': 'الرجاء ادخال رقم الهاتف',
  'signin_screen_otp_field_label': 'ادخل رمز التحقق',
  'signin_screen_otp_field_hint': 'الرجاء ادخال رمز التحقق من الهاتف',
  'signin_screen_signin_btn': 'تسجيل دخول',

  /* settings screen translation */
  'settings_screen_title': 'الاعدادت',
  'settings_screen_change_langauge': 'الرجاء اختيار اللغة',
  'settings_screen_app_name_lable': 'اسم التطبيق',
  'settings_screen_app_version_lable': 'اصدار  التطبيق',
  'settings_screen_app_email_lable': 'ايميل الدعم الفني',
  'settings_screen_work_with_us_lable': 'هل ترغب في كسب دخل اضافي ؟ ',
  'settings_screen_work_with_us_btn': 'سجلني كمندوب',

  /* bottom navigation translation */
  'bottom_nav_settings': 'الاعدادات',
  'bottom_nav_orders': 'طلباتي',
  'bottom_nav_shopping_list': 'قائمة الشراء',
  'bottom_nav_notification': 'الاشعارات',
  'bottom_nav_profile': 'حسابي',

  /* general translation */
  'arabic': 'العربية',
  'english': 'الانجليزية',
  'error': 'خطأ',
  'image_picker_not_select_image_error': 'لم يتم اختيار صورة',
  'no_internet_connection_error': 'فشل في الاتصال بالانترنت',
  'adding_to_list_successfully_title': 'تمت اضافة العنصر بنجاح',
  'adding_to_list_successfully_message': 'تم اضافة العنصر لقائمة التسوق بنجاح',
  'item_deleted_from_shoppingList_title': 'تم ازالة العنصر',
  'item_deleted_from_shoppingList_message': 'تمت ازالة العنصر من سلة التسوق بنجاح',
  'hour': 'ساعة',
  'next': 'التالي',
  'previous': 'السابق',
  'skip': 'تخطي'
};

final Map<String, String> en = {
  'app_name': 'Ab3ad',
  'app_slogan': 'door-to-door gas delivery service', 

  /* home screen translation */
  'home_screen_header_market_btn': 'Market',
  'home_screen_header_deliver_btn': 'Deliver For Me',
  'home_screen_header_confirm_btn': 'Confirm For Me',
  'home_screen_search_hint': 'What are you looking for ?',
  'home_screen_delivery_to_hint': 'Delivery to ',
  'home_screen_item_quantity_lable': 'Enter the quantity you need',
  'home_screen_item_quantity_hint': 'Quantity you need',
  'home_screen_item_price_lable': 'Enter the price',
  'home_screen_item_price_hint': 'Item Price',
  'home_screen_add_to_shopping_list_btn': 'Save to shopping list',
  'home_screen_add_to_shopping_list_title': 'Determin Price and Quantity',
  'home_screen_item_name_validation_error': 'Plase enter the name of the item',
  'home_screen_item_price_validation_error': 'Place enter valide price',
  'home_screen_item_quantity_validation_error': 'Place enter valide quantity',

  /* profile screen translation */
  'profile_screen_settings_btn': 'Settings',
  'profile_screen_orders_btn': 'Orders',
  'profile_screen_logout_btn': 'Logout',

  /* Signin screen translation */
  'signin_screen_title': 'Sign in',
  'signin_screen_description': 'Delivery service from individuals to individuals',
  'signin_screen_name_validation_error': 'Please enter a valid name',
  'signin_screen_phone_validation_error': 'Please enter a valid phone number',
  'signin_screen_otp_validation_error': 'The number entered is incorrect',
  'signin_screen_name_field_label': 'Enter the name',
  'signin_screen_name_field_hint': 'Please enter the name',
  'signin_screen_phone_field_label': 'Enter a phone number',
  'signin_screen_phone_field_hint': 'Please enter the phone number',
  'signin_screen_otp_field_label': 'Enter the verification code',
  'signin_screen_otp_field_hint': 'Please enter the phone verification code',
  'signin_screen_signin_btn': 'Sign in',

   /* bottom navigation translation */
  'bottom_nav_settings': 'Settings',
  'bottom_nav_orders': 'My orders',
  'bottom_nav_shopping_list': 'Shopping list',
  'bottom_nav_notification': 'Notifications',
  'bottom_nav_profile': 'My profile',

  /* general translation */
  'arabic': 'Arabic',
  'english': 'English',
  'error': 'Error',
  'image_picker_not_select_image_error': 'No Image has been selected',
  'no_internet_connection_error': 'Failed to connect to the internet',
  'adding_to_list_successfully_title': 'Added Successfully',
  'adding_to_list_successfully_message': 'Item has been added to shopping list',
  'item_deleted_from_shoppingList_title': 'Item removed successfully',
  'item_deleted_from_shoppingList_message': 'Item has been removed from shopping list successfully',
  'hour': 'Hour',
  'next': 'NEXT',
  'previous': 'Previous',
  'skip': 'Skip',
};