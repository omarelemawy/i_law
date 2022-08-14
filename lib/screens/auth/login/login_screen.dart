import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../constants/MediaButton.dart';
import '../../../constants/color_constans.dart';
import '../../../constants/themes.dart';
import '../../../localization/localization_constants.dart';
import '../../../main.dart';
import '../../../models/language.dart';
import '../../../sharedPreferences.dart';
import '../../home/my_home_screen.dart';
import '../forget_pass/forget_pass.dart';
import '../register/register_screen.dart';
import 'cubit_login/login_cubit.dart';
import 'cubit_login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool obscurePassword=true;
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);

    MyApp.setLocale(context, _locale);
    MySharedPreferences.saveAppLang(_locale.toString());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        builder:(context, state) =>
            Scaffold(
              key: _scaffoldKey,

            body: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    Container(
                      height: 300,
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          image:  DecorationImage(
                              fit: BoxFit.fill,
                              opacity: .5,
                              image: AssetImage("lib/images/books_back.jpeg",)
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.grey,
                              Colors.black,
                            ],
                          )
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /* PopupMenuButton(
                                    icon: Icon(
                                      Icons.language,
                                      color: HexColor("#40BFFF"),
                                    ),
                                    itemBuilder: (context){
                                      return Language.languageList()
                                          .map<PopupMenuItem<Language>>(
                                            (e) => PopupMenuItem<Language>(
                                          value: e,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Text(
                                                e.flag,
                                                style: const TextStyle(fontSize: 30),
                                              ),
                                              Text(e.name)
                                            ],
                                          ),
                                        ),
                                      ).toList();
                                    },
                                    onSelected:(Language value){
                                      _changeLanguage(value);
                                    }
                                ),*/
                              PopupMenuButton(
                                  icon: DecoratedIcon(
                                    Icons.language,
                                    color: Colors.white,
                                    shadows:shadowText(),
                                  ),
                                  itemBuilder: (context){
                                    return Language.languageList()
                                        .map<PopupMenuItem<Language>>(
                                          (e) => PopupMenuItem<Language>(
                                        value: e,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                              e.flag,
                                              style: const TextStyle(fontSize: 30),
                                            ),
                                            Text(e.name)
                                          ],
                                        ),
                                      ),
                                    ).toList();
                                  },
                                  onSelected:(Language value){
                                    _changeLanguage(value);
                                  }
                              ),
                              const Spacer(),
                              TextButton(onPressed: ()async{
                                await MySharedPreferences.saveUserUserEmail("");
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                                      (context)=> MyHomeScreen(0)), (route) => false);
                              }, child: Text(
                                getTranslated(context, 'skip')!,
                                style: TextStyle(
                                    shadows:shadowText(),
                                    fontSize: 17,
                                    color: Colors.white
                                ),

                              ),
                              )
                              /*customText(
                                  getTranslated(context, 'skip')!,
                                  size: 17,
                                  color: Colors.white
                                ),),*/
                            ],
                          ),

                          const SizedBox(height: 30,),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/1.8,
                                child: Text(
                                  "Welcome back",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      shadows:shadowText(),
                                      fontSize: 40,
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Text(
                                getTranslated(context, "Sign in to continue",)!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    shadows:shadowText(),
                                    fontSize: 17,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                           SizedBox(height: MediaQuery.of(context).size.height/20,),
                          TextFormField(
                            controller: emailController,
                            validator: (val) =>val!.isEmpty?
                            getTranslated(context, " Oops! Your Email Is Not Correct ",)!
                                : null,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                prefixIcon: const Icon(Icons.person),
                                hintText: getTranslated(context, "Your Email",)!,

                            ),
                          ),
                          const SizedBox(height: 20,),

                          TextFormField(
                            controller: passController,
                            validator: (val) =>val!.isEmpty?
                            getTranslated(context, " Oops! Your Password Is Not Correct ",)!
                                : null,
                            obscureText:obscurePassword,
                            decoration: textFormInputDecorationForPassword
                              (Icons.visibility_off,getTranslated(context, "Password",)!
                                ,(){
                                  setState(() {
                                    obscurePassword= !obscurePassword;
                                  });
                                },obscurePassword),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>const ForgetPassScreen()));
                                },
                                child: customText(getTranslated(context, "Forgot Password?")!
                                    ,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40,),
                          state is LoadingLoginState?
                           const Center(
                             child:  SpinKitChasingDots(
                               color: customColor,
                               size: 40,
                             ),
                           ):
                          customButton((){
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                                  (context)=>MyHomeScreen(0)), (route) => false);
                              /*LoginCubit.get(context).
                              loginWithEmail(emailController.text,
                                  passController.text,
                                  Localizations.localeOf(context).languageCode,
                                  context
                              );*/
                            }
                          },context,
                              getTranslated(context, "Sign In",)!
                              ,textColor: Colors.white,
                              height: MediaQuery.of(context).size.height / 16,
                              width: MediaQuery.of(context).size.width
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  getTranslated(context, "or connect")!,
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    fontSize: 17
                                  )
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          /* InkWell(
                            onTap: () {
                              setState(() {
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Row(
                                children: [
                                  Image.asset("lib/images/Google.png"),
                                  const SizedBox(width: 80,),
                                  Text(
                                      getTranslated(context, "Login with Google",)!
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              setState(() async{
                                */
                          /* AccessToken? result = await FacebookAuth.instance.login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
                                if (result!.userId.isNotEmpty) {
                                  // you are logged
                                  final String accessToken = result.token;
                                } else {
                                  print(result.token);
                                  print(result.userId);
                                }*/
                          /*
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.facebookF,
                                    color: Colors.blueAccent,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 80,),
                                  Text(getTranslated(context, "Login with FaceBook",)!
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: SignInWithAppleButton(
                              text: getTranslated(context, "Sign in with Apple",)!
                              ,
                              onPressed: () {

                              },
                            ),
                          ),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width/2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black
                                    )
                                ),
                                // ignore: deprecated_member_use
                                child: Center(
                                  child: Text(
                                    "Google",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width/2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black
                                  )
                                ),
                                // ignore: deprecated_member_use
                                child: Center(
                                  child: Text(
                                    "Facebook",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                  getTranslated(context, "Don’t have a account?")!,
                                  color: Colors.grey),
                              const SizedBox(width: 5,),
                              InkWell(
                                onTap: (){
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                                      (context)=>const RegisterScreen()), (route) => false);
                                },
                                child: customText(getTranslated(context, "Sign up")!,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        listener: (context,state){
          if(state is ErrorLoginState){
            _scaffoldKey.currentState!.
            showSnackBar(SnackBar(content: customText(state.error,color: Colors.white),
              backgroundColor: customColor,));
          }
        },
      ),
    );
  }
}
List<Shadow>? shadowText(){
  return [
    BoxShadow(
      color: Colors.black,
      blurRadius: 10,
      offset: Offset(1, 1), // Shadow position
    ),
    BoxShadow(
      color: Colors.black,
      blurRadius: 10,
      offset: Offset(1, 1), // Shadow position
    ),
    BoxShadow(
      color: Colors.black,
      blurRadius: 10,
      offset: Offset(1, 1), // Shadow position
    ),
    BoxShadow(
      color: Colors.black,
      blurRadius: 10,
      offset: Offset(1, 1), // Shadow position
    ),
  ];
}
