import 'package:ab3ad/constants.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(4,(index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.all(kDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SizedBox(
                            width: getScreenSize(context) * 8.0,
                            height: getScreenSize(context) * 8.0,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: getScreenSize(context) * 4.0,
                                  height: getScreenSize(context) * 4.0,
                                  child: Image.asset("assets/images/item_1.jpg"),
                                  // child: FadeInImage.assetNetwork(
                                  //   imageErrorBuilder:
                                  //       (context, error, stackTrace) {
                                  //     return Image.asset("assets/images/spinner.gif");
                                  //   },
                                  //   placeholder: "assets/images/spinner.gif",
                                  //   image: "$uploadUri/items/${widget.orders[index].item.image}"
                                  // )
                                ),
                                const VerticalSpacing(of: 1.0),
                                const Text("غاز ايران",
                                  style: TextStyle(fontSize: 16,color: kTextColor),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            " الكمية المطلوبة",
                            style: TextStyle(
                                fontSize: 16, color: kTextColor),
                          ),
                          SizedBox(
                              width: getScreenSize(context) * 2.0),
                          const Text(
                            "4",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        GestureDetector(
                          onTap: () async {},
                          child: Container(
                            width: getScreenSize(context) * 4.0,
                            height: getScreenSize(context) * 4.0,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  kDefaultPadding / 2),
                              child: SvgPicture.asset(
                                  "assets/icons/Trash.svg",
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(kDefaultPadding / 2),
                    child: Row(
                      children: const [
                        Text(
                          "حالة الطلب",
                          style: TextStyle(
                              fontSize: 16, color: kTextColor),
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text(
                          " قيد الانتظار ",
                          style: TextStyle(
                              fontSize: 16,
                              color: kTextColor,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ), 
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
                    child: GestureDetector(
                        onTap: () async {},
                        child: Column(
                          children: [
                            Container(
                              width: getScreenSize(context) * 4.0,
                              height: getScreenSize(context) * 4.0,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.circular(50)),
                              child: const Padding(
                                padding: EdgeInsets.all(
                                    kDefaultPadding / 2),
                                child: Icon(Icons.check, color: Colors.white),
                              ),
                            ),
                            const Text(
                              "تم الاستلام",
                              style: TextStyle(
                                fontSize: 16,
                                color: kTextColor
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                  Divider(color: kTextColor.withOpacity(0.2)),
                ],
              ))),
          )
        )
      );
  }
}
