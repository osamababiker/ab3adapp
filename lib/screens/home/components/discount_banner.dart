import 'package:flutter/material.dart';
import 'package:ab3ad/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(getScreenSize(context) * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: getScreenSize(context) * 2.0,
        vertical: getScreenSize(context) * 3.5,
      ),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: "خدمة توصيل غاز للمنازل\n",
                  style: TextStyle(
                    fontSize: 18
                  )
                ),
                TextSpan(
                  text: "أطلبها الان",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: getScreenSize(context) * 8.0,
            height: getScreenSize(context) * 8.0, 
            child: Image.asset("assets/images/logos_black.png")
          )
        ],
      ),
    );
  }
}
