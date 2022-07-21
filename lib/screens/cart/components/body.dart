import 'package:ab3ad/constants.dart';
import 'package:ab3ad/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ab3ad/utils/.env.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controllers/cartController.dart';
import '../../../size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';

 
class Body extends StatelessWidget {

  Body({Key? key}) : super(key: key);
  final CartDbController _cartController = 
  Get.find<CartDbController>();

  @override
  Widget build(BuildContext context) {

      return Obx(() => Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: Column(
            children: List.generate(_cartController.itemsList.length,(index) => Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 88,
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container( 
                              padding: EdgeInsets.all(
                                getScreenSize(context) * 1.0),
                                child: CachedNetworkImage(
                              imageUrl: "$uploadUri/items/${_cartController.itemsList[index].image}",
                              placeholder: (context, url) => Image.asset("assets/images/liquid-loader.gif"),
                              errorWidget: (context, url, error) => Image.asset("assets/images/liquid-loader.gif"),
                          )
                          ),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _cartController.itemsList[index].name,
                            style: const TextStyle(color: Colors.black, fontSize: 16),maxLines: 2,
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              text: "${_cartController.itemsList[index].price} جنيه",
                              style: const TextStyle(fontWeight: FontWeight.w600,color: kPrimaryColor),
                              children: [
                                TextSpan(
                                  text:" x ${_cartController.itemsList[index].quantity}",
                                  style: Theme.of(context).textTheme.bodyText1
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: kDefaultPadding),
                      GestureDetector(
                        onTap: () async {
                          _cartController.deleteItem(_cartController.itemsList[index].id);
                          Get.snackbar(
                            'cart_screen_item_deleted_title'.tr,
                            'cart_screen_item_deleted_title_message'.tr,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: kPrimaryLightColor
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(kDefaultPadding / 2),
                            child: SvgPicture.asset(
                                "assets/icons/Trash.svg",
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                    ],
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2)
              ],
            )),
          ),
        ),
      );
    } 
  }

