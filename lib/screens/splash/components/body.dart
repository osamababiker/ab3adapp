import 'package:flutter/material.dart';
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/size_config.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Image.asset(
                    "assets/images/logo.jpg",
                    height: getScreenSize(context) * 26.5,
                    width: getScreenSize(context) * 23.5,
                  ),
                  const Spacer(),
                  Text(
                    "أبعاد",
                    style: TextStyle(
                      fontSize: getScreenSize(context) * 3.6,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "خدمة توصيل غاز من الباب الى الباب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ),
            const VerticalSpacing(of: kDefaultPadding / 2),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getScreenSize(context) * 2.0),
              child: const CircularProgressIndicator(
                color: kPrimaryColor,
              )
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

}
