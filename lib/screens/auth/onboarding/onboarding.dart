import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i_law/constants/themes.dart';
import 'package:i_law/screens/auth/login/login_screen.dart';
import '../../../constants/MediaButton.dart';
import '../../../constants/color_constans.dart';
import '../../../localization/localization_constants.dart';


class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}
int _currentPage = 0;
class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {

    PageController _controller = PageController();
    _onChanged(int index) {
      setState(() {
        _currentPage = index;
      });
    }

    List<Widget> _pages = [
      slide_page(
          context,
          "01 ",
          getTranslated(context, "Find millions of the best books and audiobooks for you")!,
          getTranslated(context, "Discover books you love"),
          6
      ),
      slide_page(
          context,
          "02 ",
          getTranslated(context, "Enjoy reading or listening to books even if you are offline"),
          getTranslated(context, "Read or listen to them"),
          2.4
      ),
      slide_page(
          context,
          "03 ",
          getTranslated(context, "Give and get book recommendations from friends or others"),
          getTranslated(context, "Give and get recommendation"),
          1.3
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 60,),
            Row(
              children: [
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder:
                    (context)=>LoginScreen()
                    ),(_)=>false);
                  },
                    child:customText(getTranslated(context, "skip")!,size: 17,
                        color: customTextColor)),
                SizedBox(width: 20,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Image.asset("lib/images/Logo.png"
                  ,height: 200,width: 200,fit: BoxFit.fill,),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: _onChanged,
                itemBuilder: (context, int index) {
                  return _pages[index];
                },
              ),
            ),
            SizedBox(height: 40,),
            customButton((){
              if(_currentPage!=2) {
                _onChanged(_currentPage + 1);
                print(_currentPage);
                _controller..nextPage(
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
                print(_currentPage);
              }else{
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder:
                    (context)=>LoginScreen()
                ),(_)=>false);
              }
            },context,
                getTranslated(context,  "Next",)!,
                width: MediaQuery.of(context).size.width/1.2)
          ],
        ),
      ),
    );
  }
}

class SliderContoler extends StatelessWidget {
  const SliderContoler({
    Key? key,
    required List<Widget> pages,
    required int currentPage,
  })  : _pages = pages,
        _currentPage = currentPage,
        super(key: key);

  final List<Widget> _pages;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            _pages.length,
                (int index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 10,
                width: (index == _currentPage) ? 30 : 10,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: (index == _currentPage)
                      ? customColor
                      : customColor.withOpacity(0.5),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget slide_page(context,number_page,subTitle,title,widthSlide){
  return Column(
    children: [
      Row(
        children: [
          SizedBox(width: 10,),
          Expanded(child:
          customText(title,
              size: 40,
              color: customTextColor,
              fontWeight: FontWeight.bold
          )),
        ],
      ),
      SizedBox(height: 20,),
      Row(
        children: [
          SizedBox(width: 10,),
          Expanded(child:
          customText(subTitle,
              size: 17,
              color: customTextColor.withOpacity(0.3),
              fontWeight: FontWeight.bold
          )),
        ],
      ),
      SizedBox(height: 80,),
      Row(
        children: [
          SizedBox(width: 10,),
          customText(number_page,
              size: 15,
              color: customTextColor,
              fontWeight: FontWeight.bold
          ),
          customText("/ 03 ",
              size: 15,
              color: customTextColor.withOpacity(0.1),
              fontWeight: FontWeight.bold
          ),
        ],
      ),
      SizedBox(height: 15),
      Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 1.5,
            width: double.infinity,
            color: customTextColor,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 1.5,
            width: MediaQuery.of(context).size.width/widthSlide,
            color: HexColor("#FF9500"),
          ),
        ],
      ),
    ],
  );
}