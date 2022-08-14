import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/screens/home/home_bloc/home_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../constants/color_constans.dart';
import '../../constants/themes.dart';
import '../../localization/localization_constants.dart';
import '../Cart/cart_screen.dart';
import '../account/account_screen.dart';
import '../books/books_screen.dart';
import '../drawer/drawer_screen.dart';
import '../home_body/home_data_screen.dart';
import '../my_library/my_library_screen.dart';
import 'home_bloc/home_state.dart';

class MyHomeScreen extends StatefulWidget {
   MyHomeScreen(this.initialIndex,{Key? key}) : super(key: key);
  int? initialIndex;
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState(this.initialIndex);
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  _MyHomeScreenState(this.initialIndex);
  int? initialIndex;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final _controller = PersistentTabController(initialIndex:initialIndex!);
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {

          List<Widget> _buildScreens() {
            return [
              HomeDataScreen(context,_scaffoldKey),
              BooksScreen(),
              CartScreen(),
              MyLibraryScreen(),
              AccountScreen(),
            ];
          }
          List<PersistentBottomNavBarItem> _navBarsItems() {
            return [
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.search),
                title: (getTranslated(context, "Browse")
                ),
                activeColorPrimary: customColor,
                inactiveColorPrimary: HexColor("#6575A1"),
              ),
              PersistentBottomNavBarItem(
                icon: Badge(
                  toAnimate: true,
                  animationType: BadgeAnimationType.slide,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  child: const Icon(Icons.menu_book_outlined),
                  borderRadius: BorderRadius.circular(10),
                  badgeContent: customText("1"
                      , color: Colors.white, size: 12),
                ),
                title: getTranslated(context, "Books")!,
                activeColorPrimary: customColor,
                inactiveColorPrimary: HexColor("#9098B1"),
              ),


              PersistentBottomNavBarItem(
                icon: Badge(
                  toAnimate: true,
                  animationType: BadgeAnimationType.slide,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  child: const Icon(Icons.shopping_cart_outlined),
                  borderRadius: BorderRadius.circular(10),
                  badgeContent: customText("1"
                      , color: Colors.white, size: 12),
                ),
                title: (getTranslated(context, "Cart")),
                activeColorPrimary: customColor,
                inactiveColorPrimary: HexColor("#9098B1"),
              ),


              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.layers),
                title: (getTranslated(context, "My Library")),
                activeColorPrimary: customColor,
                inactiveColorPrimary: HexColor("#9098B1"),
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.person_alt),
                title: (
                    getTranslated(context, "Account",)!),
                activeColorPrimary: customColor,
                inactiveColorPrimary: HexColor("#9098B1"),
              ),
            ];
          }
          return
            /*settingsModel==null?
          Scaffold(
            body: const Center(
                child:  SpinKitChasingDots(
                  color: customColor,
                  size: 40,
                )),
          ):*/
            Scaffold(
              drawer: MyDrawerScreen(),
              key: _scaffoldKey,
              body: PersistentTabView(
                context,

                controller: _controller,
                decoration: NavBarDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(1, 1), // Shadow position
                      ),
                    ]
                ),
                screens: _buildScreens(),
                items: _navBarsItems(),
                backgroundColor: Colors.white,
                // Default is Colors.white.
                handleAndroidBackButtonPress: true,
                // Default is true.
                resizeToAvoidBottomInset: true,
                // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true,
                // Default is true.
                hideNavigationBarWhenKeyboardShows: true,


                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle
                    .style6, // Choose the nav bar style with this property.
              ),
            )
          ;
        },
      ),
    );
  }



}
