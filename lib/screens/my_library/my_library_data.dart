import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:like_button/like_button.dart';

import '../../constants/color_constans.dart';
import '../../constants/widget.dart';

Widget bookCard(context){
  double sliderWidthMax=MediaQuery.of(context).size.width/2;
  double sliderWidthMin=.85;
  return Padding(
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
        const SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text(
              "Abstract Art in The World",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Armando Newman",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 3,
                      width: sliderWidthMax,
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                    ),
                    Container(
                      height: 3,
                      width: sliderWidthMax*sliderWidthMin,
                      decoration: BoxDecoration(
                          color: HexColor("#FF9500")
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10,),
                Text(
                  "${sliderWidthMin*100} %",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  ),)
              ],
            )
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
                Colors.white,
                size: 20.0,
                shadows: const[
                  BoxShadow(
                    blurRadius: 12.0,
                    color: customColor,
                  ),
                  BoxShadow(
                    blurRadius: 12.0,
                    color: customColor,
                    offset:  Offset(0, 6.0),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 10,),
      ],
    ),
  );
}