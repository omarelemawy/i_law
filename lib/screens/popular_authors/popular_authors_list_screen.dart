import 'package:flutter/material.dart';
import 'package:i_law/screens/authors/authors_screen.dart';
import 'package:i_law/screens/popular_authors/popular_authors_card.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PopularAuthorsListScreen extends StatefulWidget {
  const PopularAuthorsListScreen({Key? key}) : super(key: key);

  @override
  _PopularAuthorsListScreenState createState() => _PopularAuthorsListScreenState();
}

class _PopularAuthorsListScreenState extends State<PopularAuthorsListScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: categoresGridView(context));
  }
  categoresGridView( BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
           onTap: (){
             pushNewScreen(
               context,
               screen: Authors(),
               withNavBar: false, // OPTIONAL VALUE. True by default.
               pageTransitionAnimation: PageTransitionAnimation.cupertino,
             );
           },
            child: PopularAuthors());
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10,);
      },);
  }
}

class Category{
  int? id;
  String? name;
  String? photo;

  Category({this.id, this.name, this.photo});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}
