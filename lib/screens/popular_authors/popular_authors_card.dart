import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../constants/color_constans.dart';
import '../../constants/widget.dart';
import '../authors/authors_screen.dart';

class PopularAuthors extends StatefulWidget {
  const PopularAuthors({Key? key}) : super(key: key);

  @override
  _PopularAuthorsState createState() => _PopularAuthorsState();
}

class _PopularAuthorsState extends State<PopularAuthors> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: Authors(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor("#F9F9F9"),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HexColor("#EFEFF4"))
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Container(
              height: 45,
              width: 45,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:  const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: customCachedNetworkImage(
                boxFit: BoxFit.cover,
                context: context,
                url: "https://media.istockphoto.com/photos/lens-image-dslr-manhattan-downtown-city-new-york-hand-picture-id901169654?k=20&m=901169654&s=612x612&w=0&h=BEzK22AQ7PrtCrIrIL92l7YvENVBLqE7Qurxu4m5iD4=",
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gerard Fabiano",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "Leila’s Story",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: HexColor("#666666"),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}
