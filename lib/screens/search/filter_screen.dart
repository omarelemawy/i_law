import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/localization/localization_constants.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

import '../../constants/color_constans.dart';
import '../../constants/themes.dart';
import '../../constants/widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>  with TickerProviderStateMixin
{
  RadioGroupController myController = RadioGroupController();
  int selected=1;
  var _tabController;
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

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 40,),
          Row(
            children: [
              MaterialButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios,
                  color: Colors.black,size: 25,),
              ),
              Spacer(),
              TextButton(
                  onPressed: (){

                  }, child: Text(
                getTranslated(context, "Reset")!,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17
                ),
              )),
              SizedBox(width: 10,)
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                floatingActionButton:   FloatingActionButton.extended(
                    backgroundColor: customColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    onPressed: (){},
                    label: Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width/1.2,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(

                          color: HexColor("#6575A1")
                      ),
                      child: Center(child: Text("Apply Filters",style:
                      TextStyle(color: Colors.white,fontSize: 17,),)),
                    )),
                backgroundColor: Colors.white,
                appBar:AppBar(
                  centerTitle: false,
                  backgroundColor: Colors.white,
                  title: Text("Filter",style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.bold
                  ),),
                  leading: Container(width: 0,),
                  elevation: 0,
                  bottom: TabBar(
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
                          getTranslated(context, "Authors")!,
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
                    physics: NeverScrollableScrollPhysics(),
                    indicatorColor: HexColor("#6575A1"),
                  ),
                ),
                body:  TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children:  <Widget>[

                    booksFilter(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 020),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Name Of Author",
                          border: OutlineInputBorder(
                          )
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
  Widget booksFilter(context){

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Text(getTranslated(context, "Sort Options")!,style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                  height: MediaQuery.of(context).size.height/3.3,
                  child: CustomRadioSortOptions()),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Text(getTranslated(context, "Language")!,style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                  height: MediaQuery.of(context).size.height/5.5,
                  child: CustomRadioLanguage()),

              SizedBox(height: 10,),

              Row(
                children: [
                  SizedBox(width: 15,),
                  Text(
                    getTranslated(context, "Star Rating")!
                    ,style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical:10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          selected=1;
                          print("objectik");
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: selected==1?HexColor("#6575A1"):Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("1",style: TextStyle(
                              color:selected==1?Colors.white: Colors.black,
                            ),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color:
                            selected==1?Colors.white:Colors.amber,size: 12,),
                            SizedBox(width: 20,),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: ()
                        => setState(() {
                           selected=2;
                           print("objectik");
                         }),

                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: selected==2?HexColor("#6575A1"):Colors.white,
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("2",style: TextStyle(
                              color: selected==2?Colors.white: Colors.black,
                            ),),

                            SizedBox(width: 2,),
                            Icon(Icons.star,color: selected==2?Colors.white:Colors.amber,size: 12,),

                            SizedBox(width: 20,),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                          selected=3;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: selected==3?HexColor("#6575A1"):Colors.white,
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("3",style: TextStyle(
                              color: selected==3?Colors.white:Colors.black,
                            ),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: selected==3?Colors.white:Colors.amber,size: 12,),

                            SizedBox(width: 20,),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                          selected=4;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: selected==4?HexColor("#6575A1"):Colors.white,
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("4",style: TextStyle(
                              color: selected==4?Colors.white:Colors.black,
                            ),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,color: selected==4?Colors.white:Colors.amber,size: 12,),

                            SizedBox(width: 20,),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                          selected=5;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: selected==5?HexColor("#6575A1"):Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("5",style: TextStyle(
                              color: selected==5?Colors.white:Colors.black,
                            ),),
                            SizedBox(width: 2,),
                            Icon(Icons.star,
                              color: selected==5?Colors.white:Colors.amber,size: 12,),

                            SizedBox(width: 20,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 120,)

            ],
          ),
        ),
      ),
    );
  }
}

class CustomRadioSortOptions extends StatefulWidget {
  @override
  createState() {
    return  CustomRadioStateSortOptions();
  }
}

class CustomRadioStateSortOptions extends State<CustomRadioSortOptions> {
  List<RadioModel>? sampleData =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData!.add( RadioModel(false, '1', 'Popularity'));
    sampleData!.add( RadioModel(true, '2', 'Star Rating (higest first)'));
    sampleData!.add( RadioModel(false, '3', 'Star Rating (lowest first)'));
    sampleData!.add( RadioModel(false, '4', 'Best Reviewed First'));
    sampleData!.add( RadioModel(false, '5', 'Most Reviewed First'));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:  ListView.separated(
        itemCount: sampleData!.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return  InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                sampleData!.forEach((element) => element.isSelected = false);
                sampleData![index].isSelected = true;
              });
            },
            child:  RadioItem(sampleData![index]),
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.grey[300],
            height: .6,
          );
      },
      ),
    );
  }
}

class CustomRadioLanguage extends StatefulWidget {
  @override
  createState() {
    return  CustomRadioStateLanguage();
  }
}

class CustomRadioStateLanguage extends State<CustomRadioLanguage> {
  List<RadioModel>? sampleData =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData!.add( RadioModel(false, '1', 'English'));
    sampleData!.add( RadioModel(false, '2', 'Spanish'));
    sampleData!.add( RadioModel(false, '3', 'Portuguese'));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:  ListView.separated(
        itemCount: sampleData!.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return  InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                sampleData!.forEach((element) => element.isSelected = false);
                sampleData![index].isSelected = true;
              });
            },
            child:  RadioItem(sampleData![index]),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.grey[300],
          height: .6,
        );
      },
      ),
    );
  }
}


class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  EdgeInsets.all(15.0),
      child:  Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

           Container(
            margin:  EdgeInsets.only(left: 10.0),
            child:  Text(_item.text,style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
          ),
          Spacer(),
          Container(
            height: 20.0,
            width: 20.0,
            child:  Center(
                child:  _item.isSelected
                    ?Icon(Icons.check,color: Colors.white,size: 12,):Container()
            ),
            decoration:  BoxDecoration(
              color: _item.isSelected
                  ? HexColor("#4CD964")
                  : Colors.transparent,
              shape: BoxShape.circle,
              border:  Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? HexColor("#4CD964")
                      : Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}






