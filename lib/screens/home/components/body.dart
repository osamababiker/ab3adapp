import 'package:ab3ad/constants.dart';
import 'package:ab3ad/models/Category.dart';
import 'package:ab3ad/screens/home/components/categoriesCard.dart';
import 'package:ab3ad/screens/home/components/discount_banner.dart';
import 'package:ab3ad/screens/home/components/home_header.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {

  const Body({Key? key, required this.categories}) : super(key: key);
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding / 2),
          child: Column(
            children: [
              const HomeHeader(),
              const DiscountBanner(),
              CategoriesCard(categories: categories)
            ],
          ),
        ),
      )
    );
  }
}