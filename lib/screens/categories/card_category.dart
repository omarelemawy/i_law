
import 'package:flutter/material.dart';
import 'package:i_law/screens/categories/sub_category_list.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../constants/color_constans.dart';
import '../../../constants/widget.dart';
import '../auth/login/login_screen.dart';
import '../popular_authors/popular_authors_list_screen.dart';

class CardCategory extends StatefulWidget {
  CardCategory(
      {Key? key}) : super(key: key);
  List<Category>? list;
  String? lang;
  String? phone;
  var myContext;
  int? index;
  @override
  _CardCategoryState createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        pushNewScreen(
          context,
          screen: AllSubCategoryList(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );;
      },
      child: Column(
        children: [
           Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 90,
                width: 138,
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
              Center(
                child: Text(
                  "dvsdvsdvsdv",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    shadows: shadowText()
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}