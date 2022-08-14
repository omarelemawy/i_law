import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/localization/localization_constants.dart';

import '../../constants/themes.dart';
import '../../constants/widget.dart';
import '../auth/login/login_screen.dart';

class MyHomeCarouseSlider extends StatefulWidget {
   MyHomeCarouseSlider({Key? key/*,this.items*/,
     this.height=300,
     this.margin=10.0,
     this.autoPlay=true}) : super(key: key);
   double? index=0;
   double? height;
   double? margin;
   List<MySlider>? items=[
     MySlider(image:
     "https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg"
     ,)
   ];
   bool? autoPlay;
  @override
  _MyHomeCarouseSliderState createState() => _MyHomeCarouseSliderState();
}

class _MyHomeCarouseSliderState extends State<MyHomeCarouseSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: widget.height,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlay: widget.autoPlay!,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                viewportFraction: 1,
                onPageChanged:(i,h){
                  setState(() {
                    widget.index = i.toDouble();
                  });
                  print(""+i.toString());
                }
            ),
            items: widget.items!
                .map(
                  (items) => GestureDetector(
                onTap: () {
                 /* _launchUrl(items.link);*/
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: widget.margin!),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin:  EdgeInsets.all(widget.margin!),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: ClipRRect(
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: widget.height,
                                decoration: const BoxDecoration(
                                  borderRadius:  BorderRadius.all(
                                     Radius.circular(20.0),
                                  ),
                                ),
                                child: customCachedNetworkImage(
                                  context: context,
                                  boxFit: BoxFit.cover,
                                  url: items.image,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Romance Books",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows:shadowText(),
                                        fontSize: 15,
                                        color: Colors.white
                                    ),),
                                  SizedBox(height: 10,),
                                  Text(
                                    "Find perfect romance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows:shadowText(),
                                        fontSize: 28,
                                        color: Colors.white
                                    ),),
                                  SizedBox(height: 10,),
                                  Text(
                                    getTranslated(context, "Learn More")!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows:shadowText(),
                                        fontSize: 17,
                                        color: HexColor("#FF9500")
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
 /* void _launchUrl(_url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }*/
}

class MySlider {
  String? image;
  String? link;

  MySlider({this.image, this.link});

  MySlider.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['link'] = this.link;
    return data;
  }
}









/*

class MyProductCarouseSlider extends StatefulWidget {
  MyProductCarouseSlider({Key? key,this.items,
    this.height=300,
    this.margin=10.0,
    this.autoPlay=true}) : super(key: key);
  double? index=0;
  double? height;
  double? margin;
  List<String>? items;
  bool? autoPlay;
  @override
  _MyProductCarouseSliderState createState() => _MyProductCarouseSliderState();
}

class _MyProductCarouseSliderState extends State<MyProductCarouseSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
                height: widget.height,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlay: widget.autoPlay!,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                viewportFraction: 1,
                onPageChanged:(i,h){
                  setState(() {
                    widget.index = i.toDouble();
                  });
                  print(""+i.toString());
                }
            ),
            items: widget.items!
                .map(
                  (items) => GestureDetector(
                onTap: () {
                  */
/*Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CategoriesCoursesPageView(
                        courses: items,
                      ),
                    ),
                  );*/
/*

                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: widget.margin!),
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin:  EdgeInsets.all(widget.margin!),
                    child: ClipRRect(
                      */
/*borderRadius: const BorderRadius.all(const Radius.circular(20.0)),*//*

                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              */
/* borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),*/
/*

                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: widget.height,
                                decoration: const BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20.0),
                                  ),
                                ),
                                child: customCachedNetworkImage(
                                  context: context,
                                  boxFit: BoxFit.cover,
                                  url: items,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ).toList(),
          ),
          DotsIndicator(
            dotsCount: widget.items!.length,
            position: widget.index!,
            decorator: DotsDecorator(
              color: Colors.grey, // Inactive color
              activeColor: customColor,
            ),
          )
        ],
      ),
    );
  }
}*/
