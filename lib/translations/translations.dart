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

  /** home screen */ 
  'home_screen_categories_section_title': 'ماذا تريد ان تطلب',
  'home_screen_discount_section_slogn': 'خدمة توصيل غاز من الباب الى الباب',
  'home_screen_discount_section_action': 'أطلب الان',
  'home_screen_header_section_search_label': 'حدد مكان التوصيل ',

  /** orders screen */
  'orders_screen_title': 'طلباتي السابقة',
  'orders_screen_quantity': 'الكمية المطلوبة',
  'orders_screen_order_status': 'حالة الطلب',
  'orders_screen_pending': 'قيد الانتظار',
  'orders_screen_delivery': 'قيد التوصيل',
  'orders_screen_delivered': 'تم التوصيل',
  'orders_screen_canceled': 'تم الالغاء',
  'orders_screen_done': 'تم الاستلام',
  'orders_screen_no_orders': 'لا توجد طلبات لعرضها حاليا',
  'orders_screen_update_error_title': 'مشكلة في التحديث',
  'orders_screen_update_error_message': 'هناك مشكلة في تحديث حالة الطلب',
  'orders_screen_delete_success_title': 'تم الحذف',
  'orders_screen_delete_success_message': 'تم حذف الطلب بنجاح',

  /** order form screen */
  'order_form_screen_title': ' اضافة الطلب للسلة',
  'order_form_screen_quantity_label': 'العدد المطلوب',
  'order_form_screen_quantity_hint': 'ادخل عدد العناصر التي تريد',
  'order_form_screen_delivery_time_label': 'اختر موعد التوصيل',
  'order_form_screen_choose_item_label': 'أختر نوع العنصر',
  'order_form_screen_notes_label': 'اي ملاحظات او تنبيهات ',
  'order_form_screen_notes_hint': 'ادخل اي ملاحظات او تنبيهات للطلب',
  'order_form_screen_pick_image': 'قم بارفاق صورة',
  'order_form_screen_add_to_cart_btn': 'أضف للسلة',
  'order_form_screen_add_to_cart_title': 'تمت الاضافة بنجاح',
  'order_form_screen_add_to_cart_message': 'تمت اضافة العنصر الى السلة بنجاح',

  /** cart screen */
  'cart_screen_title': 'عربة التسوق الخاصة بك',
  'cart_screen_item_deleted_title': 'تم الحذف بنجاح',
  'cart_screen_item_deleted_title_message': 'تم حذف العنصر من سلة التسوق بنجاح',
  'cart_screen_check_out_total': 'المجموع',
  'cart_screen_check_out_currancy': 'جنيه',
  'cart_screen_check_out_delivery_btn': 'اختر موقع التوصيل',

  /** delivery screen */
  'delivery_screen_title': 'طلبات التوصيل',
  'delivery_screen_customer_details': 'تفاصيل العميل',
  'delivery_screen_order_details': 'تفاصيل الطلب',
  'delivery_screen_quantity': 'الكمية',
  'delivery_screen_no_orders': 'لا توجد طلبات توصيل لعرضها حاليا',
  'delivery_screen_delivery_time': 'مواعيد التوصيل',

  /** delivery requests screen */
  'delivery_requests_screen_title': 'طلباتك للتوصيل',
  'delivery_requests_customer_details': 'تفاصيل العميل',
  'delivery_requests_order_details': 'تفاصيل الطلب',
  'delivery_requests_quantity': 'الكمية',
  'delivery_requests_no_requests': 'لا توجد طلبات توصيل لعرضها حاليا',

  /** evaluation screen */
  'evaluation_screen_title': 'تقييم الخدمة',
  'evaluation_screen_rating_label': 'قيم تجربتك من 1 الى 5',
  'evaluation_screen_review_label': 'رجاءا اخبرنا اكثر عن تجربتك',
  'evaluation_screen_send_btn': 'ارسال التقييم',
  'evaluation_screen_review_field_error': 'الرجاء كتابة نعليق صحيح',
  'evaluation_screen_error_title': 'مشكلة في ارسال التقييم',
  'evaluation_screen_error_message': 'هناك مشكلة في ارسال التقييم',
  'evaluation_screen_success_title': 'تم ارسال التقييم',
  'evaluation_screen_success_message': 'تم ارسال تقييم بنجاح',

  /** location screen */
  'location_screen_title': 'اختر موقع التوصيل',
  'location_screen_search_location_hint': 'ابحث عن موقع معين',
  'location_screen_send_order_btn': 'ارسل الطلب',
  'location_screen_cart_empty_error_title': 'سلة التسوق فارغة',
  'location_screen_cart_empty_error_message': 'الرجاء اضافة عناصر لسلة التسوق اولا',

  /** signin screen */
  'signin_screen_title': 'تسجيل دخول',
  'signin_screen_phone_label': 'رقم الهاتف',
  'signin_screen_phone_hint': 'أدخل رقم الهاتف',
  'signin_screen_password_label': 'كلمة المرور',
  'signin_screen_password_hint': 'أدخل كلمة المرور',
  'signin_screen_btn': 'تسجيل دخول',
  'signin_screen_not_having_account': 'لا تمتلك حسابا',
  'signin_screen_create_account': 'أنشاء حساب',
  'signin_screen_phone_validation_error': 'الرجاء ادخال رقم هاتف صحيح',
  'signin_screen_password_validation_error': 'الرجاء ادخال كلمة مرور صحيحة',
  'signin_screen_unauthorized_message': 'رقم الهاتف او الايميل المدخل غير صحيح',
  'signin_screen_signin_error_title': 'مشكلة في تسجيل الدخول ',
  'signin_screen_signin_error_message': 'مشكلة في تسجيل الدخول الرجاء المحاولة في وقت اخر',


  /** signup screen */
  'signup_screen_title': 'أنشاء حساب',
  'signup_screen_terms': 'بانشاء حسابك فانك توافق على شروط وسياسات الاستخدام للتطبيق',
  'signup_screen_btn': 'انشاء حساب',
  'signup_screen_name_label': 'الاسم',
  'signup_screen_name_hint': 'ادخل الاسم كاملا',
  'signup_screen_address_label': 'السكن',
  'signup_screen_address_hint': 'ادخل عنوان السكن',
  'signup_screen_phone_label': 'رقم الهاتف',
  'signup_screen_phone_hint': 'ادخل رقم الهاتف',
  'signup_screen_password_confirm_label': 'تأكيد كلمة المرور',
  'signup_screen_password_confirm_hint': 'قم باعادة ادخال كلمة المرور',
  'signup_screen_password_label': 'كلمة المرور',
  'signup_screen_password_hint': 'قم بادخال كلمة المرور',
  'signup_screen_name_validation_error': 'الرجاء ادخال اسم صحيح',
  'signup_screen_address_validation_error': 'الرجاء ادخال عنوان صحيح',
  'signup_screen_password_confirm_validation_error': 'كلمة المرور التي ادخلتها غير مطابقة',
  'signup_screen_password_short_validation_error': 'يجب ان تحتوي كلمة المرور على 6 حروف على الاقل',
  'signup_screen_signup_error_title': 'مشكلة في انشاء حساب',
  'signup_screen_signup_error_message': 'مشكلة في انشاء الحساب الرجاء المحاولة في وقت اخر',

  /**  profile screen */
  'profile_screen_title': 'الملف الشخصي',
  'profile_screen_settings_btn': 'الاعدادات',
  'profile_screen_orders_btn': 'طلبات التوصيل',
  'profile_screen_signout_btn': 'تسجيل خروج',

  /** take order screen */
  'take_order_screen_title': 'توصيل الطلب',
  'take_order_screen_delivery_address': 'عنوان التوصيل',
  'take_order_screen_deliver_order_btn': 'توصيل الطلب',
  'take_order_screen_success_title': 'نجاح', 
  'take_order_screen_success_message': 'تم ارسال طلب التوصيل بنجاح',
  'take_order_screen_error_title': 'خطأ', 
  'take_order_screen_error_message': 'هناك مشكلة في ارسال الطلب الخاص بك',

  /** order complete screen */
  'order_complete_screen_message': 'تم ارسال الطلب بنجاح',
  'order_complete_screen_btn': 'مواصلة التسوق',

  /** settings screen */
  'settings_screen_title': 'معلومات عن التطبيق',
  'settings_screen_app_version': 'الاصدار',
  'settings_screen_app_email': 'الايميل',
  'settings_screen_app_policy': 'سياسة الاستخدام والخصوصية',
  'settings_screen_change_langauge': 'تغيير اللغة',
  'order_form_during_day': 'خلال اليوم',
  'order_form_morning': 'صباحا',
  'order_form_afternoon': 'بعد الظهر',
  'order_form_evening': 'مساءا',
  'network_error_message_1': 'هناك مشكلة في الاتصال',
  'network_error_message_2': 'الرجاء المحاولة في وقت لاحق',
  'image_picker_not_select_image_error': 'الرجاء اختيار الصورة',
};

final Map<String, String> en = {
  'app_name': 'Ab3ad',
  'app_slogan': 'door-to-door gas delivery service', 

  /** home screen */
  'home_screen_categories_section_title': 'What you want to order',
  'home_screen_discount_section_slogn': 'door-to-door gas delivery service',
  'home_screen_discount_section_action': 'Order now',
  'home_screen_header_section_search_label': 'Search delivery location',
  
  /** orders screen */
  'orders_screen_title': 'My previous orders',
  'orders_screen_quantity': 'Required quantity',
  'orders_screen_order_status': 'Order status',
  'orders_screen_pending': 'Is Pending',
  'orders_screen_delivery': 'In delivery',
  'orders_screen_delivered': 'Is delivered',
  'orders_screen_canceled': 'Is canceled',
  'orders_screen_done': 'It was received',
  'orders_screen_no_orders': 'There are no orders to display at this time',
  'orders_screen_update_error_title': 'Problem updating',
  'orders_screen_update_error_message': 'There is a problem updating the status of the request',
  'orders_screen_delete_success_title': 'Deleted',
  'orders_screen_delete_success_message': 'Order has been deleted successfully',

  /** order form screen */
  'order_form_screen_title': 'Add order to cart',
  'order_form_screen_quantity_label': 'The required number',
  'order_form_screen_quantity_hint': 'Enter the number of items you want.',
  'order_form_screen_delivery_time_label': 'Choose delivery date',
  'order_form_screen_choose_item_label': 'Select item',
  'order_form_screen_notes_label': 'Any notes or cautions?',
  'order_form_screen_notes_hint': 'Enter any notes  for the order.',
  'order_form_screen_pick_image': 'attach a picture',
  'order_form_screen_add_to_cart_btn': 'Add to cart',
  'order_form_screen_add_to_cart_title': 'added successfully',
  'order_form_screen_add_to_cart_message': 'Item has been added to cart successfully',

  /** cart screen */
  'cart_screen_title': 'Your shopping cart',
  'cart_screen_item_deleted_title': 'Deleted successfully',
  'cart_screen_item_deleted_title_message': 'Item has been deleted successfully',
  'cart_screen_check_out_total': 'Total',
  'cart_screen_check_out_currancy': 'Pound',
  'cart_screen_check_out_delivery_btn': 'Choose delivery location',

  /** delivery screen */
  'delivery_screen_title': 'Delivery orders',
  'delivery_screen_customer_details': 'Customer details',
  'delivery_screen_order_details': 'Order details',
  'delivery_screen_quantity': 'Quantity',
  'delivery_screen_no_orders': 'No delivery order found',
  'delivery_screen_delivery_time': 'Delivery time',

  /** delivery requests screen */
  'delivery_requests_screen_title': 'Your delivery requests',
  'delivery_requests_customer_details': 'Customer Details',
  'delivery_requests_order_details': 'Order Details',
  'delivery_requests_quantity': 'Quantity',
  'delivery_requests_no_requests': 'No delivery requests found',

  /** evaluation screen */
  'evaluation_screen_title': 'Service evaluation',
  'evaluation_screen_rating_label': 'Rate your experience from 1 to 5',
  'evaluation_screen_review_label': 'Please tell us more about your experience.',
  'evaluation_screen_send_btn': 'send evaluation',
  'evaluation_screen_review_field_error': 'Please write a valid reviwe.',
  'evaluation_screen_error_title': 'Error sending evaluation',
  'evaluation_screen_error_message': 'There is a problem sending the evaluation.',
  'evaluation_screen_success_title': 'Send successfully',
  'evaluation_screen_success_message': 'Evaluation has been sent successfully.',

  /** location screen */
  'location_screen_title': 'Choose a delivery location',
  'location_screen_search_location_hint': 'Search for a specific location',
  'location_screen_send_order_btn': 'Send order',
  'location_screen_cart_empty_error_title': 'Shopping cart is empty',
  'location_screen_cart_empty_error_message': 'Plase add items to shopping cart first',

  /** signin screen */
  'signin_screen_title': 'Sign in',
  'signin_screen_phone_label': 'Phone number',
  'signin_screen_phone_hint': 'Enter your phone number',
  'signin_screen_password_label': 'Your password',
  'signin_screen_password_hint': 'Enter your password',
  'signin_screen_btn': 'Sign in',
  'signin_screen_not_having_account': 'You don,t have an account',
  'signin_screen_create_account': 'Create account',
  'signin_screen_phone_validation_error': 'Please enter a valid phone number',
  'signin_screen_password_validation_error': 'Please enter a valid password',
  'signin_screen_unauthorized_message': 'The phone number or email entered is incorrect.',
  'signup_screen_signin_error_title': 'Problem sign you in',
  'signup_screen_signin_error_message': 'Problem sign you in , please try again later',

  /** signup screen */
  'signup_screen_title': 'Create account',
  'signup_screen_terms': 'By creating your account, you agree to the application,s terms and policies of use.',
  'signup_screen_btn': 'Create account',
  'signup_screen_name_label': 'Your name',
  'signup_screen_name_hint': 'Enter your name',
  'signup_screen_address_label': 'Your address',
  'signup_screen_address_hint': 'Enter your address',
  'signup_screen_phone_label': 'Your phone',
  'signup_screen_phone_hint': 'Enter your phone number',
  'signup_screen_password_confirm_label': 'confirm your password',
  'signup_screen_password_confirm_hint': 'Re-enter the password again',
  'signup_screen_password_label': 'Your password',
  'signup_screen_password_hint': 'Enter your password',
  'signup_screen_name_validation_error': 'Please enter a valid name',
  'signup_screen_address_validation_error': 'Please enter a valid address',
  'signup_screen_password_confirm_validation_error': 'The password you entered does not match',
  'signup_screen_password_short_validation_error': 'Password must contain at least 6 characters',
  'signup_screen_signup_error_title': 'Problem sign you up',
  'signup_screen_signup_error_message': 'Problem sign you up , please try again later',

  /**  profile screen */
  'profile_screen_title': 'Your Profile',
  'profile_screen_settings_btn': 'Settings',
  'profile_screen_orders_btn': 'Delivery requests',
  'profile_screen_signout_btn': 'Sign out',

  /** take order screen */
  'take_order_screen_title': 'Deliver order',
  'take_order_screen_delivery_address': 'Delivery address',
  'take_order_screen_deliver_order_btn': 'Deliver Order',
  'take_order_screen_success_title': 'Success', 
  'take_order_screen_success_message': 'Your request has been send successfully',
  'take_order_screen_error_title': 'Error', 
  'take_order_screen_error_message': 'Problem sending your request',

  /** order complete screen */
  'order_complete_screen_message': 'Your order has been send successfully',
  'order_complete_screen_btn': 'Continue shopping',

  /** settings screen */
  'settings_screen_title': 'Info about the app',
  'settings_screen_app_version': 'Version',
  'settings_screen_app_email': 'Email',
  'settings_screen_app_policy': 'Usage and Privacy Policy',
  'settings_screen_change_langauge': 'Change language',
  'order_form_during_day': 'During the day',
  'order_form_morning': 'At Morning',
  'order_form_afternoon': 'At Afternoon',
  'order_form_evening': 'At Evening',
  'network_error_message_1': 'There is a connection problem',
  'network_error_message_2': 'Please try again later',
  'image_picker_not_select_image_error': 'Please select an image',

};