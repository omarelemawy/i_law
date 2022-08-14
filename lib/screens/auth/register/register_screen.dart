
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:random_password_generator/random_password_generator.dart';
import '../../../constants/MediaButton.dart';
import '../../../constants/color_constans.dart';
import '../../../constants/themes.dart';
import '../../../localization/localization_constants.dart';
import '../../../sharedPreferences.dart';
import '../../home/my_home_screen.dart';
import '../login/login_screen.dart';
import 'cubit_register/register_cubit.dart';
import 'cubit_register/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword=true;
  bool obscureConfirmPassword=true;
  String? phoneNumber;

  String countryCode="+20";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? myGender=getTranslated(context, "male");
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (BuildContext context, state)
        {
          if(state is ErrorRegisterState){
            _scaffoldKey.currentState!.
            showSnackBar(SnackBar(content: customText(state.error,color: Colors.white),
              backgroundColor: customColor,));
          }
        },
        builder: (BuildContext context, Object? state) {
          String? checkPhoneError(){
            if(state is ErrorRegisterState){
              return state.errorPhone!.isNotEmpty?state.errorPhone!:null;
            }
          }
          String? checkEmailError(){
            if(state is ErrorRegisterState){
              return state.errorEmail!.isNotEmpty?state.errorEmail!:null;
            }
          }
          String? checkPassError(){
            if(state is ErrorRegisterState){
              return state.errorPass!.isNotEmpty?state.errorPass!:null;
            }
          }
          return Scaffold(
            key: _scaffoldKey,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(00),
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

                            const SizedBox(height: 30,),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/1.8,
                                  child: Text(
                                    getTranslated(context, "Welcome user")!,
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
                                  getTranslated(context, "Sign up to join")!,
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
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height/20,),
                            TextFormField(
                              controller: nameController,
                              validator: (val) =>val!.isEmpty?
                              getTranslated(context, " Oops! Your Name Is Not Correct ",)!
                                  : null,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                prefixIcon: const Icon(Icons.person),
                                hintText: getTranslated(context, "Name"),
                              ),
                            ),
                            const SizedBox(height: 20,),

                            TextFormField(
                              controller: userNameController,
                              validator: (val) =>val!.isEmpty?
                              getTranslated(context, " Oops! Your User Name Is Not Correct ",)!
                                  : null,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                prefixIcon: const Icon(Icons.person),
                                hintText: getTranslated(context, "User Name"),

                              ),
                            ),
                            const SizedBox(height: 20,),

                            TextFormField(
                              controller: phoneController,
                              validator: (val) =>val!.isEmpty?
                              getTranslated(context, " Oops! Your Phone Is Not Correct ",)!
                                  : null,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                prefixIcon: const Icon(Icons.person),
                                hintText: getTranslated(context, "Phone"),

                              ),
                            ),
                            const SizedBox(height: 20,),

                            TextFormField(
                              controller: emailController,
                              validator: (val) =>val!.isEmpty?
                              getTranslated(context, " Oops! Your Email Is Not Correct ",)!
                                  : null,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                prefixIcon: const Icon(Icons.email),
                                hintText: getTranslated(context, "Email")
                                ,

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
                            TextFormField(
                              controller: confirmPassController,
                              validator: (val) =>val!.isEmpty?
                              getTranslated(context, " Oops! Your Confirm Password Is Not Correct ",)!
                                  : null,
                              obscureText:obscureConfirmPassword,
                              decoration: textFormInputDecorationForPassword
                                (Icons.visibility_off,
                                  getTranslated(context, "Confirm Password")!
                                  ,(){
                                    setState(() {
                                      obscureConfirmPassword= !obscureConfirmPassword;
                                    });
                                  },obscureConfirmPassword),
                            ),




                            const SizedBox(height: 40,),
                            /*state is LoadingLoginState?
                            const Center(
                              child:  SpinKitChasingDots(
                                color: customColor,
                                size: 40,
                              ),
                            ):*/
                            customButton(
                                    (){
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
                                getTranslated(context, "Sign Up",)!
                                ,textColor: Colors.white,
                                height: MediaQuery.of(context).size.height / 16,
                                width: MediaQuery.of(context).size.width
                            ),
                            const SizedBox(height:20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customText(
                                    getTranslated(context,"have a account?",)!
                                    ,
                                    color: Colors.grey),
                                const SizedBox(width: 5,),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context)=>const LoginScreen()),
                                            (route) => false);
                                  },
                                  child: customText(
                                      getTranslated(context,"Sign In",)!
                                      ,
                                      color: Colors.black),
                                ),
                              ],
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

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
      },),
    );
  }
}
