import 'package:ab3ad/constants.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';

import 'category_card.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "ماذا تريد ان تطلب",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(of: 2.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(4, (index) {
                return CategoryCard();
            })),
          )
        ],
      ),
    );
  }
}
