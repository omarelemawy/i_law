import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/constants/color_constans.dart';
import 'package:i_law/constants/themes.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:i_law/screens/auth/login/login_screen.dart';
import 'package:i_law/screens/books/popular_books_list.dart';
import 'package:i_law/screens/books/popular_books_screen.dart';
import 'package:i_law/screens/search/filter_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../../constants/widget.dart';
import '../search/coursesSearch.dart';
import 'books_list_vertical.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  String? searchValue;
  final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context).languageCode);

    return Scaffold(
      key: scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              showMyBottomSheet(scaffoldKey,context);
            },
            child: Container(
              height: 44,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius:
                  Localizations.localeOf(context).languageCode=="en"||
                      Localizations.localeOf(context).languageCode=="fr"?
                  BorderRadius.only(
                    topLeft:  Radius.circular(10)
                    ,bottomLeft:  Radius.circular(10),):
                  BorderRadius.only(
                    topRight:  Radius.circular(10)
                    ,bottomRight:  Radius.circular(10),),
                  color: HexColor("#6575A1")
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.arrow_up_arrow_down,color: Colors.white,),
                  const SizedBox(width: 10,),
                   Text(getTranslated(context, "Sort")!,style: const TextStyle(color: Colors.white,fontSize: 17,),)
                ],
              ),
            ),
          ),
          const SizedBox(width: .5,),
          InkWell(
            onTap: (){
              pushNewScreen(
                context,
                screen: FilterScreen(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Container(
              height: 44,
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.filter_list_alt,color: Colors.white,),
                  const SizedBox(width: 10,),
                   Text(getTranslated(context, "Filter")!,style: const TextStyle(color: Colors.white,fontSize: 17,),)
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: Localizations.localeOf(context).languageCode=="en"||
                      Localizations.localeOf(context).languageCode=="fr"?
                  BorderRadius.only(
                    topRight:  Radius.circular(10)
                    ,bottomRight:  Radius.circular(10),)
                 : BorderRadius.only(
                    topLeft:  Radius.circular(10)
                    ,bottomLeft:  Radius.circular(10),),
                  color: HexColor("#6575A1")
              ),
            ),
          ),
        ],
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  showSearch(
                    context: context,
                    delegate: CoursesSearch(),
                  );
                },
                  icon: Icon(Icons.search,color: Colors.black,size: 25,),),
                /*SearchBarAnimation(
                  searchBoxWidth: MediaQuery.of(context).size.width/1.2,
                  durationInMilliSeconds: 500,

                  isOriginalAnimation: true,
                  buttonBorderColour: Colors.white,
                  buttonIcon: Icons.search,
                  onFieldSubmitted: (String value){
                    debugPrint('onFieldSubmitted value $value');
                  }, textEditingController: TextEditingController(),
                ),*/
                const SizedBox(width: 30,),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10,),
                     Text(getTranslated(context, "Books")!,style: TextStyle(color:
                    Colors.black,fontWeight: FontWeight.bold,
                        fontSize: 34
                    ),),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    customText(getTranslated(context, "Popular Books")!
                        , color: Colors.black,
                        fontWeight: FontWeight.bold, size: 17),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: PopularBooksScreen(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );
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
                    const SizedBox(width: 10,)
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: const[
                    SizedBox(width: 10,),
                    Expanded(child:  PopularBooksList()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width/1.15,
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
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20,),
                              Text("${getTranslated(context, "Books of the Year:")} 2019’s",
                                style: TextStyle(
                                    color: Colors.white,
                                    shadows: shadowText(),
                                    fontSize: 17
                                ),),
                              Spacer(),
                              Icon(Icons.arrow_forward,size: 25,color: Colors.white,
                                shadows: shadowText(),
                              ),
                              SizedBox(width: 20,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            const BooksListVertical()

          ],
        ),
      ),




    );
  }
}

void showMyBottomSheet(scaffoldKey,context)
{
  scaffoldKey.currentState!.showBottomSheet(
    enableDrag: true,
        (BuildContext context) {
      return editPhone(context);
    },
  );
}

Widget editPhone(context){
  return Container(
    height: MediaQuery.of(context).size.height/2,
    color: Colors.white,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height/3.3,
                child: CustomRadioSortOptions()),


            Row(
              children: [
                SizedBox(width: 20,),
                Expanded(
                  child: MaterialButton(onPressed:
                      (){
                        Navigator.pop(context);
                      },
                      color: customColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                       child: Text(
                         "Cancel",
                         style: TextStyle(
                           color: Colors.white,
                         ),
                       ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: MaterialButton(onPressed:
                      (){
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: customColor)
                      ),
                       child: Text(
                         "Save",
                         style: TextStyle(
                           color: customColor,
                         ),
                       ),
                  ),
                ),
                SizedBox(width: 20,),

              ],
            )
          ],
        ),
      ),
    ),
  );
}