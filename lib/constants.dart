import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kFontFamily = "Tajawal";

const kAnimationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);


final headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const kDefaultPadding = 20.0;
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "الرجاء ادخال الايميل";
const String kInvalidEmailError = "الرجاء ادخال ايميل صحيح";
const String kPassNullError = "الرجاء ادخال كلمة المرور";
const String kShortPassError = "كلمة المرور قصيرة جدا";
const String kMatchPassError = "كلمة المرور غير متطابقة";
const String kNamelNullError = "الرجاء ادخال الاسم";
const String kPhoneNumberNullError = "الرجاء ادخال رقم الهاتف";
const String kAddressNullError = "الرجاء ادخال العنوان";
const String kmessageNullError = 'الرجاء كتابة الرسالة';
const String kTransportNullError = "الرجاء ادخال وسيلة التوصيل";
const String kQuantityNullError = "الرجاء ادخال الكمية المطلوبة";

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(kDefaultPadding / 2),
    borderSide: const BorderSide(color: kTextColor),
  );
}
