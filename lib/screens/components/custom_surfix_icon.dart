import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getScreenSize(context) * 2.0,
        getScreenSize(context) * 2.0,
        getScreenSize(context) * 2.0,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getScreenSize(context) * 1.8,
      ),
    );
  }
}
