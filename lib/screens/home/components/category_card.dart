import 'package:ab3ad/constants.dart';
import 'package:ab3ad/models/Category.dart';
import 'package:ab3ad/size_config.dart';
import 'package:ab3ad/utils/.env.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryCard extends StatelessWidget { 
  const CategoryCard({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 4),
        child: Container(
          width: getScreenSize(context) * 22.0,
          height: getScreenSize(context) * 22.0,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: getScreenSize(context) * 12.0,
                height: getScreenSize(context) * 12.0,
                child: Image.asset("assets/images/cat_1.png"),
                // child: CachedNetworkImage(
                //     imageUrl: "$uploadUri/categories/${category.image}",
                //     placeholder: (context, url) => Image.asset("assets/images/liquid-loader.gif"),
                //     errorWidget: (context, url, error) => Image.asset("assets/images/liquid-loader.gif"),
                // )
              ),
              const VerticalSpacing(of: 2.0),
              const Text(
                "أنبوبة غاز",
                style:  TextStyle(
                    fontSize: 16,
                    color: kTextColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
