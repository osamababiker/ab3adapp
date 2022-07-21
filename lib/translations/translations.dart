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

  /** order form screen */
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
};

final Map<String, String> en = {
  'app_name': 'Ab3ad',
  'app_slogan': 'door-to-door gas delivery service', 
  
  /** order form screen */
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

};