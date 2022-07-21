import 'package:flutter/material.dart';

import '../../../size_config.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getScreenSize(context) * 2.0),
      padding: EdgeInsets.only(top: getScreenSize(context) * 2.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: child,
    );
  }
}
