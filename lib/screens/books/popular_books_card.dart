import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:like_button/like_button.dart';

import '../../constants/color_constans.dart';
import '../../constants/widget.dart';
import '../auth/login/login_screen.dart';

class PopularBooksCard extends StatefulWidget {
  const PopularBooksCard({Key? key}) : super(key: key);

  @override
  _PopularBooksCardState createState() => _PopularBooksCardState();
}

class _PopularBooksCardState extends State<PopularBooksCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 171,
              width: 114,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: customCachedNetworkImage(
                boxFit: BoxFit.cover,
                context: context,
                url: "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg",
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    LikeButton(
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
                    SizedBox(width: 40,),
                    Icon(Icons.star,color:Colors.amber,size: 13,shadows: shadowText(),),
                    Text("4.5",style:
                    TextStyle(color:
                    Colors.white,
                        fontSize: 15,
                      shadows: shadowText()
                    ),)
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 5,),
        SizedBox(
          width: 90,
          child: Text(
            "Jan Rombouts Een Renaissan",
            maxLines: 2,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
                overflow: TextOverflow.ellipsis
            ),
          ),
        ),
        const SizedBox(height: 7,),

        SizedBox(
          width: 90,
          child:
          Text(
            "Jan Rombouts Een Renaissan",
            maxLines: 1,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color:customTextColor ,
                fontSize: 13,
                overflow: TextOverflow.ellipsis
            ),
          ),
        ),
        const SizedBox(height: 5,),
      ],
    );
  }
}
