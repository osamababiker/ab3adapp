

import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/itemsController.dart';
import 'package:ab3ad/models/Category.dart';
import 'package:ab3ad/models/Item.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:ab3ad/screens/components/form_error.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  Body({
    Key? key, 
    required this.category, 
    required this.items
  }) : super(key: key);

 

  final Category category;
  final List items;
  final ItemsController _itemsController = 
    Get.find<ItemsController>();

  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Obx((() => Form(
          key: _itemsController.formKey,
          child: Column(
            children: [
              TopRoundedContainer( 
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  child: Column(
                    children: [
                      const VerticalSpacing(of: 2.0),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _itemsController.quantityController,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              _itemsController.removeError(error: kQuantityNullError);
                            }
                            return;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              _itemsController.addError(error: kQuantityNullError);
                            }
                            return;
                          },
                          decoration: const InputDecoration(
                            labelText: "العدد المطلوب",
                            hintText: "ادخل عدد العناصر التي تريد",
                            hintStyle: TextStyle(color: kTextColor, fontSize: 14),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.all(kDefaultPadding),
                          )),
                      const VerticalSpacing(of: 2.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: kTextColor,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'اختر موعد التوصيل',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: _itemsController.timeList
                                    .map((time) => DropdownMenuItem<String>(
                                      value: time,
                                      child: Text(
                                        time,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                  .toList(),
                                  value: _itemsController.selectedTime.value,
                                  onChanged: (value) {
                                    _itemsController.selectedTime.value = value as String;
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: kTextColor,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 50,
                                  buttonWidth: 200,
                                  buttonPadding:
                                      const EdgeInsets.only(left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultPadding / 2),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  itemHeight: 40,
                                  itemPadding:
                                      const EdgeInsets.only(left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultPadding / 2),
                                    color: Colors.white,
                                  ),
                                  scrollbarRadius:
                                      const Radius.circular(kDefaultPadding / 2),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                ),
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding / 2),
                            SizedBox(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: kTextColor,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'أختر نوع العنصر',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: items 
                                    .map((item) => DropdownMenuItem<Item>(
                                      value: item,
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                  .toList(),
                                  value: _itemsController.selectedItem,
                                  onChanged: (value) {
                                    _itemsController.selectedItem!.value = value as Item;
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: kTextColor,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 50,
                                  buttonWidth: 160,
                                  buttonPadding:
                                      const EdgeInsets.only(left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultPadding / 2),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  itemHeight: 40,
                                  itemPadding:
                                      const EdgeInsets.only(left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultPadding / 2),
                                    color: Colors.white,
                                  ),
                                  scrollbarRadius:
                                      const Radius.circular(kDefaultPadding / 2),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalSpacing(of: 2.0),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: _itemsController.notesController,
                        decoration: const InputDecoration(
                          labelText: "اي ملاحظات او تنبيهات ",
                          hintText: "ادخل اي ملاحظات او تنبيهات للطلب",
                          hintStyle: TextStyle(color: kTextColor, fontSize: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.all(kDefaultPadding * 2),
                        )
                      ),
                      const VerticalSpacing(of: 2.0),
                      const Text(
                        "قم بارفاق صورة",
                        style: TextStyle(fontSize: 16, color: kTextColor),
                      ),
                      _itemsController.image != null ?
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding / 4),
                        child: Container(
                          width: double.infinity,
                          height: getScreenSize(context) * 15.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, -15),
                                blurRadius: 20,
                                color: const Color(0xFFDADADA).withOpacity(0.4)
                              )
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(kDefaultPadding / 2),
                            child: Image.file(_itemsController.image!),
                          ),
                        ),
                      ) : const Text(""),
                      const VerticalSpacing(of: 1.0),
                      IconButton(
                          onPressed: () async {},
                          icon: const Icon(Icons.camera_alt)),
                      const VerticalSpacing(of: 2.0),
                          DefaultButton(
                              text: "أضف للسلة",
                              press: () async {},
                            ),
                      const SizedBox(height: kDefaultPadding / 2),
                      const FormError(errors: []),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    ));
  }
}
