import 'package:flutter/material.dart';
import 'package:ab3ad/constants.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Ab3ad \n اصدار :  1.0",
                style: TextStyle(
                  fontSize: 16
                )
              ),
              SizedBox(height: 15),
              Text.rich(
                TextSpan(
                  text: " الايميل \n \n",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "ab3ad@email.com" ,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      )
                    )
                  ]
                )
              ),
              Divider(),
              SizedBox(height: kDefaultPadding),
              Text.rich(
                TextSpan(
                  text: " سياسة الاستخدام والخصوصية \n \n",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "policy",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      )
                    )
                  ]
                )
              ),
            ]
          ),
        ),
      ),
          
    );
  }
}