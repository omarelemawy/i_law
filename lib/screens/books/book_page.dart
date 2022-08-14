import 'package:decorated_icon/decorated_icon.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/screens/books/reviews/all_review_screen.dart';
import 'package:i_law/screens/home_body/home_data_screen.dart';
import 'package:like_button/like_button.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

import '../../constants/color_constans.dart';
import '../../constants/themes.dart';
import '../../constants/widget.dart';
import '../../localization/localization_constants.dart';
import '../home/my_home_screen.dart';

class BookPageScreen extends StatefulWidget {
  const BookPageScreen({Key? key}) : super(key: key);

  @override
  _BookPageScreenState createState() => _BookPageScreenState();
}

class _BookPageScreenState extends State<BookPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          getTranslated(context, "Book Details")!
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Container(
                height: 230,
                width: 153,
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
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width/1.4,
                child: Text("Jan Rombouts Een Renaissan Cemeester Herontdekt",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width/11,),
                  InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder:
                              (context)=> MyHomeScreen(2)
                          ),
                              (route) => false);
                    },
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                     height: 40,
                      child: MaterialButton(onPressed: (){
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder:
                                (context)=> MyHomeScreen(2)
                            ),
                                (route) => false);
                      },color: HexColor("#6575A1"),
                         child: Text("${getTranslated(context, "PDF")} \$27.82",
                           style: TextStyle(color: Colors.white,fontSize: 15,
                               fontWeight: FontWeight.bold),),height: 40
                        ,minWidth: MediaQuery.of(context).size.width/2.5,
                      ),
                    ),
                  ),

                  Spacer(),

                  InkWell(onTap: (){
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder:
                            (context)=> MyHomeScreen(2)
                        ),
                            (route) => false);
                  },child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         border: Border.all(color:HexColor("#6575A1"))
                       ),
                       child: Text("${getTranslated(context, "Hard Copy")} \$27.82",
                         style: TextStyle(color: HexColor("#6575A1"),fontSize: 14,
                             fontWeight: FontWeight.bold),),
                     ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/11,),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: .7,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20,),
                  Column(
                    children: [

                      Text(
                        "2010",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        getTranslated(context, "Published")!,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                        ),
                      ),
                    ],
                  ),


                  Column(
                    children: [

                      Text(
                        "2010",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        getTranslated(context, "Pages")!,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                        ),
                      ),
                    ],
                  ),


                  Column(
                    children: [

                      Text(
                        "1.7K",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        getTranslated(context, "Reviews")!,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                        ),
                      ),
                    ],
                  ),
                  /*

                  Column(
                    children: [

                      Text(
                        "#03",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        getTranslated(context, "Best Seller")!,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                        ),
                      ),
                    ],
                  ),*/
                  SizedBox(width: 20,)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: .7,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                    height: 50,
                    width: 50,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:   BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: customCachedNetworkImage(
                      boxFit: BoxFit.cover,
                      context: context,
                      url: "https://apod.nasa.gov/apod/image/0407/moussette_aur16jul1_full.jpg",
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(
                    getTranslated(context, "Published")!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),

                  Text(
                    getTranslated(context, "Summary")!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ExpandableText(
                  "From the glamorous San Francisco social scene of the 1920s, through war and the social changes of the ’60s, to the rise of Silicon Valley today, this extraordinary novel takes us on a family odyssey that is both heartbreaking and inspiring, as each generation faces the challenges of their day. The Parisian design houses in 1928, the crash of 1929, the losses of war, the drug culture of the 1960s history holds many surprises, and lives are changed forever.",
                  expandText:getTranslated(context, "read more")!,
                  expandOnTextTap: true,
                  maxLines: 10,
                  collapseOnTextTap: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15
                  ),
                  collapseText: getTranslated(context, "show less",)!
                  ,
                ),
              ),
              SizedBox(height: 20,),

              /*Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Drama",
                      style: TextStyle(color: Colors.white,fontSize: 13),

                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Romance",
                      style: TextStyle(color: Colors.white,fontSize: 13),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Mysteries",
                      style: TextStyle(color: Colors.white,fontSize: 13),
                    ),
                  ),
                ],
              ),*/


              const SizedBox(height: 15,),
              Container(
                color: Colors.grey,
                height: .4,
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const SizedBox(width: 30,),
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
                        isLiked ? Icons.favorite : Icons.favorite,
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
                  const SizedBox(width: 5,),
                  Text(getTranslated(context, "Favorites")!
                    ,style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                  ),),
                  const SizedBox(width: 30,),
                  Icon(
                    Icons.list,color: Colors.grey,
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    getTranslated(context, "Contents")!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                  ),),
                  const SizedBox(width: 40,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>ViewAllReviews()));
                    },
                      child: customText(
                          getTranslated(context, "See Reviews")!
                          ,fontWeight:
                      FontWeight.bold,color: customColor,
                          size: 12),)
                ],
              ),

              const SizedBox(height: 10,),

              Container(
                color: Colors.grey,
                height: .4,
              ),
              const SizedBox(height: 20,),


              Row(
                children: [
                  const SizedBox(width: 20,),
                  customText(
                      getTranslated(context, "Featured Books")!
                      , color: Colors.black,
                      fontWeight: FontWeight.bold, size: 17),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      print(Localizations
                          .localeOf(context)
                          .languageCode);
                      /* Navigator.push(context, MaterialPageRoute(builder:
                                  (context)=>AllCategoryList(
                                  widget.myContext,
                                  Localizations.localeOf(context).languageCode,
                                  widget.phone
                              )));*/
                    },
                    child: Row(
                      children: [
                        customText(
                            getTranslated(context, "See all")!
                            , color: HexColor("#8A8A8F"),
                            fontWeight: FontWeight.w400,
                            size: 12),
                        Icon(Icons.arrow_forward_ios,
                            color: HexColor("#8A8A8F"), size: 12)
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,)
                ],
              ),
              const SizedBox(height: 10,),


              const SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Expanded(child: getFeaturedBooks(context)),
                ],
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getFeaturedBooks(context)
{
  return SizedBox(
    height: 220,
    child: ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return getFeathedBooksCard(/*myContext,lang,phone,list: list, index: index,*/context);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10,);
      },),
  );
}
Widget getFeathedBooksCard(context)
{
  return InkWell(
    onTap: () {
      pushNewScreen(
        context,
        screen: BookPageScreen(),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

    },
    child: Column(
      children: [
        Container(
          height: 140,
          width: 94,
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

        SizedBox(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text(
                "Jan Rombouts Een Renaissan",
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                ),
              ),
              const SizedBox(height: 5,),
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
            ],
          ),
        ),
      ],
    ),
  );
}
