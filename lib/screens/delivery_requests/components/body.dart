import 'package:ab3ad/constants.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(5,(index) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "بيانات العميل",
                        style: TextStyle(fontSize: 16, color: kTextColor),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Row(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.person),
                              SizedBox(width: kDefaultPadding / 4),
                              Text(
                                "osama babiker",
                                style: TextStyle(
                                    fontSize: 16, color: kTextColor),
                              ),
                            ],
                          ),
                          const SizedBox(width: kDefaultPadding / 4),
                          Row(
                            children: const[
                              Icon(Icons.phone),
                              SizedBox(width: kDefaultPadding / 4),
                              Text(
                                "+971525440487",
                                style: TextStyle(fontSize: 16, color: kTextColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(color: kTextColor.withOpacity(0.5)),
                      const Text(
                        "تفاصيل الطلب",
                        style: TextStyle(fontSize: 16, color: kTextColor),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Padding(
                        padding:
                            const EdgeInsets.all(kDefaultPadding / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                              SizedBox(
                                width: getScreenSize(context) * 8.0,
                                height: getScreenSize(context) * 8.0,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: getScreenSize(context) * 4.0,
                                      height: getScreenSize(context) * 4.0,
                                      child: Image.asset("assets/images/item_1.jpg")
                                      // child: CachedNetworkImage(
                                      //   imageUrl: "$uploadUri/items/${snapshot.data.item.image}",
                                      //   placeholder: (context, url) => Image.asset("assets/images/liquid-loader.gif"),
                                      //   errorWidget: (context, url, error) => Image.asset("assets/images/liquid-loader.gif"),
                                      // )
                                    ),
                                    const VerticalSpacing(of: 1.0),
                                    const Text(
                                      "غاز النيل",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: kTextColor
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Text(" الكمية المطلوبة",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: kTextColor
                              ),
                              ),
                              SizedBox(width: getScreenSize(context) * 2.0),
                              const Text("3",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            GestureDetector(
                              onTap: () async {},
                              child: Container(
                                width:
                                    getScreenSize(context) * 4.0,
                                height:
                                    getScreenSize(context) * 4.0,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.circular(
                                            50)),
                                child: const Padding(
                                  padding: EdgeInsets.all(
                                      kDefaultPadding / 2),
                                  child: Icon(Icons.check, color: Colors.white),
                                ),
                              ),
                            ) 
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2),
              ],
            )
          ),
        ),
      ),
    );
  }
}
