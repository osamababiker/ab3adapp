import 'package:ab3ad/constants.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/Category.dart';
import 'category_card.dart';


class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key? key,
    required this.categories
  }) : super(key: key);

  final List<Category> categories;
  @override
  Widget build(BuildContext context) { 
    return Padding( 
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "home_screen_categories_section_title".tr,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(of: 2.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row( 
                children: List.generate(categories.length, (index) {
                return CategoryCard(category: categories[index]); 
            })),
          )
        ],
      ),
    );
  }
}
