
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

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
                    TextField(
                      keyboardType: TextInputType.text,
                      onSubmitted: (value) async {},
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "ابحث عن موقع معين",
                        hintStyle:
                            TextStyle(color: kTextColor, fontSize: 14),
                        contentPadding: EdgeInsets.all(kDefaultPadding),
                      )
                    ),
                    const SizedBox(height: 5),
                    DefaultButton(
                      text: "ارسل الطلب",
                      press: () async {}
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
