
import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/controllers/evaluationsController.dart';
import 'package:ab3ad/models/deliveryRequest.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/screens/components/custom_suffix_icon.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


class Body extends StatelessWidget {

  Body({Key? key, required this.deliveryRequest}) : super(key: key);
  final EvaluationsController _evaluationsController = 
  Get.find<EvaluationsController>();
  final DeliveryRequest deliveryRequest;
  final AuthController authController = 
  Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Obx(() => Column(
          children: [
            const SizedBox(height: kDefaultPadding * 2),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Form(
                  key: _evaluationsController.evaluationformKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "evaluation_screen_rating_label".tr,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          _evaluationsController.rating.value = rating;
                        },
                      ),
                      const SizedBox(height: kDefaultPadding),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return "evaluation_screen_review_field_error".tr;
                          }
                        },
                        controller: _evaluationsController.evaluationController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "evaluation_screen_review_label".tr,
                          suffixIcon: const CustomSuffixIcon(
                            svgIcon: "assets/icons/Question mark.svg",
                          ),
                          floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      const SizedBox(height: kDefaultPadding / 2),
                      DefaultButton(
                        text: "evaluation_screen_send_btn".tr,
                        press: () async {
                          int userId = 0;
                          if (deliveryRequest.customer.id == authController.user.id) {
                            userId = deliveryRequest.driver.id;
                          } else {
                            userId = deliveryRequest.customer.id;
                          }

                          Map formData = {
                            'raterId': authController.user.id,
                            'userId': userId,
                            'rating': _evaluationsController.rating.value,
                            'review': _evaluationsController.evaluationController.text
                          };
                          
                          bool checkEvaluation = await _evaluationsController.saveEvaluation(formData: formData);
                          if(checkEvaluation){
                            Get.snackbar(
                              "evaluation_screen_success_title".tr, 
                              "evaluation_screen_success_message".tr,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: kPrimaryColor,
                              colorText: Colors.white
                            );
                          }else{
                            Get.snackbar(
                              "evaluation_screen_error_title".tr, 
                              "evaluation_screen_error_message".tr,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: kPrimaryColor,
                              colorText: Colors.white
                            );
                          }
                        }
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
