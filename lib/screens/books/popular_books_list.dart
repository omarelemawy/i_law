import 'package:flutter/material.dart';
import 'package:i_law/screens/books/book_page.dart';
import 'package:i_law/screens/books/popular_books_card.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PopularBooksList extends StatefulWidget {
  const PopularBooksList({Key? key}) : super(key: key);

  @override
  _PopularBooksListState createState() => _PopularBooksListState();
}

class _PopularBooksListState extends State<PopularBooksList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: PopularBooksGridView(/*categoryList, context*/),
    );
  }
}

PopularBooksGridView(/*List<Category> list, BuildContext context*/) {
  return ListView.separated(
    itemCount: 10,
    padding: EdgeInsets.zero,
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: (){
          pushNewScreen(
            context,
            screen: BookPageScreen(),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: PopularBooksCard(/*myContext,lang,phone,list: list, index: index,*/));
    },
    separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(width: 20,);
    },);
}