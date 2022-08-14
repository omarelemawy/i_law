import 'package:flutter/material.dart';

import '../../constants/widget.dart';


class CoursesSearch extends SearchDelegate {
  CoursesSearch()
      : super(
      searchFieldLabel: 'search',
      searchFieldStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontFamily: 'Cairo-SemiBold'));

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [
        const Text("Authors", style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17
        ),),
        SizedBox(
          height: 80,
          child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: customCachedNetworkImage(
                          context: context,
                          url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ_g6RuUvDQCxONurbdUzvsp7VD86KLHGUXfd2apKsMCTQwJFR3Co9zgfjXlDVQmWezLU&usqp=CAU",
                        )),
                  ),
                  const Text("yrdt"),
                ],
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: customCachedNetworkImage(
                        context: context,
                        url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ_g6RuUvDQCxONurbdUzvsp7VD86KLHGUXfd2apKsMCTQwJFR3Co9zgfjXlDVQmWezLU&usqp=CAU",
                      )),
                ),
                title: const Text("yrdt"),
                onTap: () {},
              );
            },
          ),
        ),

      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Authors", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17
          ),),
        ),

        const SizedBox(height: 20,),
        Container(
          padding: const EdgeInsets.all(10),
          height: 140,
          child: ListView.separated(
            itemCount: 12,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: customCachedNetworkImage(
                            context: context,
                            url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ_g6RuUvDQCxONurbdUzvsp7VD86KLHGUXfd2apKsMCTQwJFR3Co9zgfjXlDVQmWezLU&usqp=CAU",
                          )),
                    ),
                    const SizedBox(height: 5,),
                    const Text("yrdgbnngreghrhethrtntnt",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                      ),),
                  ],
                ),
              );
            },
            separatorBuilder: (context, i) {
              return const SizedBox(
                width: 15,
              );
            },
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Books", style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17
          ),),
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, i) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 80,
                      width: 80,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: customCachedNetworkImage(
                        boxFit: BoxFit.cover,
                        context: context,
                        url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ_g6RuUvDQCxONurbdUzvsp7VD86KLHGUXfd2apKsMCTQwJFR3Co9zgfjXlDVQmWezLU&usqp=CAU",
                      ),
                    ),
                  ),
                  Column(
                    children: const[
                       Text(
                        "yrdgbnngreghrhethrtntnt",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13
                        ),),
                       SizedBox(height: 5,),
                       Text(
                        "yrdgbnngreghrhethrtntnt",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                        ),),
                    ],
                  ),
                ],

              );
            },
          ),
        ),
      ],
    );
  }
}
