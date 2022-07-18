
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/screens/components/form_error.dart';
import 'package:ab3ad/screens/components/custom_suffix_icon.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "قيم تجربتك من 1 الى 5",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding:
                          const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: kDefaultPadding),
                    TextFormField(
                      onChanged: (value) {},
                      validator: (value) {},
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "رجاءا اخبرنا اكثر عن تجربتك",
                        suffixIcon: CustomSuffixIcon(
                          svgIcon: "assets/icons/Question mark.svg",
                        ),
                        floatingLabelBehavior:
                            FloatingLabelBehavior.never,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding / 2),
                    const FormError(errors: []),
                    const SizedBox(height: kDefaultPadding / 2),
                    DefaultButton(
                        text: "ارسال التقييم",
                        press: () async {})
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
