
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/screens/featured_books/featured_books_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:searchfield/searchfield.dart';
import '../../constants/color_constans.dart';
import '../../constants/themes.dart';
import '../../localization/localization_constants.dart';
import '../authors/authors_list_screen.dart';
import '../categories/all_category_list.dart';
import '../categories/category_list.dart';
import '../drawer/drawer_screen.dart';
import '../featured_books/category_list.dart';
import '../home/home_bloc/home_cubit.dart';
import '../home/home_bloc/home_state.dart';
import '../popular_authors/popular_authors_list_screen.dart';
import '../search/coursesSearch.dart';
import 'carouse_slider_home.dart';
import 'notifications_screen.dart';


class HomeDataScreen extends StatefulWidget {
   HomeDataScreen(this.myContext,this.scaffoldKey,{Key? key}) : super(key: key);
   var myContext;
   var scaffoldKey ;
  @override
  _HomeDataScreenState createState() => _HomeDataScreenState();
}

class _HomeDataScreenState extends State<HomeDataScreen> {
  double index = 0;
  TextEditingController searchController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    List productList = [
      "oui;io;",
      "gerg",
      "rherherh",
      "rehehrnyjk68o",
      "yu8;lp89p;",
      "9u8;9",
    ];
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,

            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 3,
                          child: TextField(
                            obscureText: true,
                            focusNode: this.passwordFocusNode,
                          ),
                        ),
                        const SizedBox(height: 30,),
                      ],
                    ),
                    /*settingsModel==null?
                    const Center(
                        child: SpinKitChasingDots(
                          color: customColor,
                          size: 40,
                        )):*/
                    Container(
                        child: Column(
                          children: [
                            const SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                           widget.scaffoldKey.currentState!.openDrawer();
                                        },
                                        child:const Icon(Icons.menu)
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 10,
                                    child: Form(
                                        key: _formKey,
                                        child:
                                        /* productList.isEmpty?
                                  const Center(
                                      child:  SpinKitChasingDots(
                                        color: customColor,
                                        size: 40,
                                      )):*/
                                        InkWell(
                                          onTap: (){
                                            showSearch(
                                              context: context,
                                              delegate: CoursesSearch(),
                                            );
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 20,),
                                                Icon(Icons.search,color: Colors.black,),
                                                SizedBox(width: 20,),
                                                Text(
                                                  getTranslated(context, "Search")!,
                                                  style: TextStyle(
                                                    color: Colors.grey
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        pushNewScreen(
                                    context,
                                    screen:  NotificationsScreen(),
                                    withNavBar: false, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                  );
                                      },
                                      child:
                                      /*settingsModel.data!.notificationsNumber==0?
                                const Icon(Icons.notifications_active_outlined):*/
                                      Badge(
                                        toAnimate: true,
                                        animationType: BadgeAnimationType.slide,
                                        shape: BadgeShape.circle,
                                        badgeColor: Colors.red,
                                        child: const Icon(Icons.notifications),
                                        borderRadius: BorderRadius.circular(10),
                                        badgeContent:
                                        customText(
                                            "1"
                                            , color: Colors.white, size: 12),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10,)
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            MyHomeCarouseSlider(),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const SizedBox(width: 10,),
                                customText(
                                    getTranslated(context, "Popular Authors")!
                                    , color: Colors.black,
                                    fontWeight: FontWeight.bold, size: 17),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    pushNewScreen(
                                      context,
                                      screen: AuthorsListScreen(),
                                      withNavBar: false, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );
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
                                const SizedBox(width: 10,)
                              ],
                            ),
                            const SizedBox(height: 10,),

                            Row(
                              children: [
                                SizedBox(width: 10,),
                                Expanded(child: PopularAuthorsListScreen()),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const SizedBox(width: 10,),
                                customText(
                                    getTranslated(context, "Categories")!
                                    , color: Colors.black,
                                    fontWeight: FontWeight.bold, size: 17),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    pushNewScreen(
                                      context,
                                      screen: AllCategoryList(),
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
                              children: [
                                SizedBox(width: 10,),
                                Expanded(child: HomeCategooriesBody()),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const SizedBox(width: 10,),
                                customText(
                                    getTranslated(context, "Featured Books")!
                                    , color: Colors.black,
                                    fontWeight: FontWeight.bold, size: 17),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    pushNewScreen(
                                      context,
                                      screen: FeaturedBooksScreen(),
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
                              children: [
                                SizedBox(width: 10,),
                                Expanded(child: FeaturedBooksList()),
                              ],
                            ),
                          ],
                        )

                    ),
                    // /*settingsModel==null?
                    // const Center(
                    //     child: SpinKitChasingDots(
                    //       color: customColor,
                    //       size: 40,
                    //     )):*/
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Column(
                    //     children: [
                    //       const SizedBox(height: 10,),
                    //       Row(
                    //         children: [
                    //           customText(
                    //               getTranslated(context, "Flash Sale",)!
                    //               , color: customColor,
                    //               fontWeight: FontWeight.bold, size: 14),
                    //         ],
                    //       ),
                    //
                    //       const SizedBox(height: 5,),
                    //       /*FlashSale(
                    //           widget.myContext,
                    //           HomeCubit.get(context).productsOfferList
                    //       ),*/
                    //
                    //       Row(
                    //         children: [
                    //           customText(
                    //               getTranslated(context, "You May Like",)!
                    //               , color: customColor,
                    //               fontWeight: FontWeight.bold, size: 14),
                    //         ],
                    //       ),
                    //       const SizedBox(height: 5,),
                    //       /*productList.isEmpty?
                    //       const Center(
                    //           child:  SpinKitChasingDots(
                    //             color: customColor,
                    //             size: 40,
                    //           )):
                    //       YouMayLikeHome(
                    //         widget.myContext,
                    //         productList,
                    //         physics: const NeverScrollableScrollPhysics(),)*/
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
/*void _launchUrl(_url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }*/
}
