import 'package:flutter/material.dart';
import 'package:ab3ad/constants.dart';

import '../../size_config.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key, 
    required this.text, 
    required this.press, 
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getScreenSize(context) * 5.6,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(kDefaultPadding * 2),
      ),
      child: TextButton(
        onPressed: press, 
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: kFontFamily
          ),
        ),
      ),
    );
  }
}

