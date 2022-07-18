import 'package:ab3ad/constants.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          " لا تمتلك حسابا ؟ ",
          style: TextStyle(fontSize: getScreenSize(context) * 1.6),
        ),
        GestureDetector(
          onTap: () => {},
          child: Text(
            "انشاء حساب",
            style: TextStyle(
                fontSize: getScreenSize(context) * 1.6,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
