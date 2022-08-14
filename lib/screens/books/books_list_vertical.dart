import 'package:flutter/material.dart';
import 'package:i_law/screens/books/card_books_vertical.dart';

class BooksListVertical extends StatefulWidget {
  const BooksListVertical({Key? key}) : super(key: key);

  @override
  _BooksListVerticalState createState() => _BooksListVerticalState();
}

class _BooksListVerticalState extends State<BooksListVertical> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: categoresGridView(/*categoryList, context*/),
    );
  }

  categoresGridView(/*List<Category> list, BuildContext context*/)
  {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CardBooksVertical(/*myContext,lang,phone,list: list, index: index,*/);
      },
      separatorBuilder: (BuildContext context, int index) {
        return  Container(height:.3,color: Colors.grey,
        margin: EdgeInsets.symmetric(horizontal: 30),);
      },);
  }
}
