import 'package:flutter/widgets.dart';



double getScreenSize(context) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);
  double screenHeight = _mediaQueryData.size.height;
  double screenWidth = _mediaQueryData.size.width;
  Orientation orientation = _mediaQueryData.orientation;
  double defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  return defaultSize;
}




class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    Key? key,
    this.of = 25,
  }) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getScreenSize(context) * (of),
    );
  }
}