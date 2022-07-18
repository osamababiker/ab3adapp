import 'package:flutter/material.dart';
import 'package:ab3ad/screens/home/home_screen.dart';

import '../../constants.dart';
import '../../size_config.dart';



class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            accountName: Text(
              "osama babiker",
              style: const TextStyle(color: kTextColor),
            ),
            accountEmail: Text(
              "+971525440487",
              style: const TextStyle(color: kTextColor),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.all(kDefaultPadding / 1.5),
              child: ClipOval(
                child: Image.asset("assets/images/logos_black.png"),
              ),
            )
          ) 
          //: 
          // Container(
          //   width: size.width,
          //   padding: const EdgeInsets.all(kDefaultPadding),
          //   decoration: BoxDecoration(
          //     color: Colors.grey.shade100,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: getScreenSize(context) * 5.0,
          //         height: getScreenSize(context) * 5.0,
          //         child: ClipOval(
          //           child: Image.asset("assets/images/logos_black.png"),
          //         ),
          //       ),
          //       const VerticalSpacing(of: 1.0),
          //       GestureDetector(
          //         onTap: () {
                    
          //         },
          //         child: Container(
          //           padding: const EdgeInsets.all(kDefaultPadding / 2),
          //           decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.circular(5),
          //             boxShadow: [BoxShadow(
          //               offset: const Offset(0 , 2),
          //               blurRadius: 1,
          //               color: Colors.black.withOpacity(0.9),
          //             )]
          //           ),
          //           child: const Text(
          //             "تسجيل دخول",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          ,
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                offset: const Offset(0 , 2),
                blurRadius: 1,
                color: Colors.black.withOpacity(0.16),
              )]
            ),
            child: GestureDetector(
              onTap: () {},
              child: const ListTile(
                title: Text("الرئيسية", style: TextStyle(fontSize: 14)),
                trailing:  SizedBox(
                  width: 20,
                  height: 20,
                  child: Icon(Icons.home_outlined),
                ),
              ),
            ),
          ),
          const VerticalSpacing(of: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 1,
                color: Colors.black.withOpacity(0.16)
              )]
            ),
            child: GestureDetector(
              onTap: (){},
              child: const ListTile(
                title: Text("طلباتك", style: TextStyle(fontSize: 14)),
                trailing:  SizedBox(
                  width: 20,
                  height: 20,
                  child: Icon(Icons.shopping_bag_outlined),
                ),
              )
            ),
          ),
          const VerticalSpacing(of: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 1,
                color: Colors.black.withOpacity(0.16)
              )]
            ),
            child: GestureDetector(
              onTap: (){},
              child: const ListTile(
                title: Text("الاشعارات", style: TextStyle(fontSize: 14)),
                trailing:  SizedBox(
                  width: 20,
                  height: 20,
                  child: Icon(Icons.notifications_outlined),
                ),
              )
            ),
          ),
          const VerticalSpacing(of: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 1,
                color: Colors.black.withOpacity(0.16)
              )]
            ),
            child: GestureDetector(
              onTap: (){},
              child: const ListTile(
                title: Text("عن التطبيق", style: TextStyle(fontSize: 14)),
                trailing:  SizedBox(
                  width: 20,
                  height: 20,
                  child: Icon(Icons.info_outline),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}

