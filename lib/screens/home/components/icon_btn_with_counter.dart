import 'package:ab3ad/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final GestureTapCallback press;
  final CartDbController _cartController = 
  Get.find<CartDbController>();

  @override
  Widget build(BuildContext context) {

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getScreenSize(context) * 1.2),
            height: getScreenSize(context) * 4.6,
            width: getScreenSize(context) * 4.6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          Positioned(
            top: -3,
            right: 0,
            child: Container(
              height: getScreenSize(context) * 2.5,
              width: getScreenSize(context) * 2.5,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Obx((() => Center(
                child: Text("${_cartController.cartCounter.value}",
                  style: TextStyle(
                    fontSize: getScreenSize(context) * 1.0,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ))
            ),
          ),
        )
        ],
      ),
    );
  }
}
