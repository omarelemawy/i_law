import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:like_button/like_button.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

import '../../constants/widget.dart';
import 'book_page.dart';

class CardBooksVertical extends StatefulWidget {
  const CardBooksVertical({Key? key}) : super(key: key);

  @override
  _CardBooksVerticalState createState() => _CardBooksVerticalState();
}

class _CardBooksVerticalState extends State<CardBooksVertical> {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 81,
              width: 54,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Text(
                  "Abstract Art in The World",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "Armando Newman",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5,),
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
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LikeButton(
                size: 20,
                isLiked: false,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                circleColor:
                const CircleColor(start:  Color(0xff00ddff),
                    end: Color(0xff0099cc)),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor:  Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  print(isLiked.toString());
                  return DecoratedIcon(
                    isLiked ? Icons.favorite : Icons.favorite_outline,
                    color: isLiked ? HexColor("#FB7181") :
                    Colors.grey,
                    size: 20.0,
                  )
                  /*Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration:const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: .5,
                                          ),
                                        ]),child: Icon(
                                    isLiked ? Icons.favorite : Icons.favorite_outline,
                                    color: isLiked ? HexColor("#FB7181") : Colors
                                        .grey[300],
                                    size: 25,
                                  ),)*/;
                },
              ),
            ),
            const SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}
