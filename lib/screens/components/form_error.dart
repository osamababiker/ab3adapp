import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List errors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Column(
          children: List.generate(errors.length, (index) => formErrorText(error: errors[index])),
        ),
      ),
    );
  }
 
  Row formErrorText({String? error}) { 
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          width: 14,
          height:14
        ),
        const SizedBox(width: 10),
        Text("$error")
      ]
    );
  }
}
