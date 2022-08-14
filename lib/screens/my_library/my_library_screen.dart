
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:i_law/screens/my_library/orders_list_screen.dart';

import 'package:searchbar_animation/searchbar_animation.dart';
import 'my_library_data.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  _MyLibraryScreenState createState() => _MyLibraryScreenState();
}
var _tabController;
class _MyLibraryScreenState extends State<MyLibraryScreen> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {

    return NestedScrollView(
      headerSliverBuilder:
          (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
              delegate: SliverChildListDelegate(
                  <Widget>[
                    Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50,),
                          /*Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.filter_list_alt,
                                  color: Colors.black,size: 25,),
                                SearchBarAnimation(
                                  searchBoxWidth: MediaQuery.of(context).size.width/1.5,
                                  durationInMilliSeconds: 500,

                                  isOriginalAnimation: true,
                                  buttonBorderColour: Colors.white,
                                  buttonIcon: Icons.search,
                                  onFieldSubmitted: (String value){
                                    debugPrint('onFieldSubmitted value $value');
                                  }, textEditingController: TextEditingController(),
                                ),
                              ],
                            ),
                          ),*/
                           Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child:  Text(
                            getTranslated(context, "My Library")!
                            ,style:
                             TextStyle(
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                  ])
          ),
          SliverAppBar(
            floating: false,
            snap: false,
            pinned: false,
            stretch: true,
            expandedHeight: 0,
            backgroundColor:  Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      getTranslated(context, "Books")!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color:  _tabController!.index == 0
                          ? Colors.black
                          : Colors.grey,fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                     getTranslated(context,  "Purchases")!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color:
                      _tabController!.index == 1
                          ? Colors.black
                          : Colors.grey,fontSize: 18),
                    ),
                  ),
                ],
                onTap: (index){
                  setState((){
                  });
                },
                controller: _tabController,
                indicatorColor: HexColor("#6575A1"),
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children:  <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(itemBuilder:
                  (context,index){
                return bookCard(context);
              },
                itemCount: 12, separatorBuilder:
                    (BuildContext context, int index) {
                  return const SizedBox(height:10,);
                },

              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(itemBuilder:
                  (context,index){
                return orderItem(context);
              },
                itemCount: 12, separatorBuilder:
                    (BuildContext context, int index) {
                  return const SizedBox(height:10,);
                },

              ),
            ),
          ),
        ],

      ),
    );
  }
}


