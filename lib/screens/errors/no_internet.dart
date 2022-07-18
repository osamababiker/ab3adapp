import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';
import '../../size_config.dart';


class NoInternetScreen extends StatelessWidget {

  const NoInternetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  width: getScreenSize(context) * 40.0,
                  height: getScreenSize(context) * 20.0,
                  child: SvgPicture.asset("assets/icons/signal_searching.svg")
                ), 
                const SizedBox(height: kDefaultPadding),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: const [
                      Text(
                        "هناك مشكلة في الاتصال",
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextColor
                        ),
                      ),
                      Text(
                        "الرجاء المحاولة في وقت لاحق",
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextColor
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}


