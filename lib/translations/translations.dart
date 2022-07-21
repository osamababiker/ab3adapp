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

  /** location screen */
  'location_screen_title': 'اختر موقع التوصيل',
  'location_screen_search_location_hint': 'ابحث عن موقع معين',
  'location_screen_send_order_btn': 'ارسل الطلب',
  'location_screen_cart_empty_error_title': 'سلة التسوق فارغة',
  'location_screen_cart_empty_error_message': 'الرجاء اضافة عناصر لسلة التسوق اولا'
};

final Map<String, String> en = {
  'app_name': 'Ab3ad',
  'app_slogan': 'door-to-door gas delivery service', 

  /** home screen */
  'home_screen_categories_section_title': 'What you want to order',
  'home_screen_discount_section_slogn': 'door-to-door gas delivery service',
  'home_screen_discount_section_action': 'Order now',
  'home_screen_header_section_search_label': 'Search delivery location',
  
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

  /** location screen */
  'location_screen_title': 'Choose a delivery location',
  'location_screen_search_location_hint': 'Search for a specific location',
  'location_screen_send_order_btn': 'Send order',
  'location_screen_cart_empty_error_title': 'Shopping cart is empty',
  'location_screen_cart_empty_error_message': 'Plase add items to shopping cart first'

};