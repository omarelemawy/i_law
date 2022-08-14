
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/screens/books/books_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import '../../../constants/color_constans.dart';
import '../../../constants/widget.dart';
import '../auth/login/login_screen.dart';
import '../books/book_page.dart';
import '../popular_authors/popular_authors_list_screen.dart';


class FeaturedBooksCard extends StatefulWidget {
  FeaturedBooksCard(
      {Key? key}) : super(key: key);
  List<Category>? list;
  String? lang;
  String? phone;
  int? index;
  @override
  _FeaturedBooksCardState createState() => _FeaturedBooksCardState();
}

class _FeaturedBooksCardState extends State<FeaturedBooksCard> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: BookPageScreen(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

      },
      child: Container(
        width: 265,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: HexColor("#EFEFF4"),
            borderRadius:BorderRadius.circular(10)

        ),
        child: Row(
          children: [
             Container(
               height: 120,
               width: 80,
               clipBehavior: Clip.antiAliasWithSaveLayer,
               decoration:   BoxDecoration(
                 borderRadius: BorderRadius.circular(10)
               ),
               child: customCachedNetworkImage(
                 boxFit: BoxFit.cover,
                 context: context,
                 url: "https://apod.nasa.gov/apod/image/0407/moussette_aur16jul1_full.jpg",
               ),
             ),
             const SizedBox(width: 10,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    "Jan Rombouts Een Renaissan",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "Mercartorfonds",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: HexColor("#666666"),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      RatingStars(
                        editable: false,
                        rating: 3,
                        color: Colors.amber,
                        iconSize: 13,
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        "2545",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          color: HexColor("#666666"),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "17 hr 43 min",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),


                ],
              ),
            ),
            const SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}