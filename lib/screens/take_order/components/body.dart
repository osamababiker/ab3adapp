import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../components/default_button.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "عنوان التوصيل",
                        style: TextStyle(fontSize: 16, color: kTextColor),
                      ),
                      const VerticalSpacing(of: 2.0),
                      const Text(
                          "Dubai",
                          style: TextStyle(
                              fontSize: 16,
                              color: kTextColor,
                              fontWeight: FontWeight.bold),
                      ),
                      const VerticalSpacing(of: 2.0),
                      DefaultButton(
                        text: "توصيل الطلبية",
                        press: () async {},
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}