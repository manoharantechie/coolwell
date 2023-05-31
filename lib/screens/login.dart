

import 'package:coolwell/common/colors.dart';
import 'package:coolwell/common/widget/custom_widget.dart';
import 'package:coolwell/common/widget/textformfield_custom.dart';
import 'package:coolwell/screens/screens/home_screen.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  Login({Key? key,}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;

  bool loading = false;
  bool passVisible = false;
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {






    final forgotLabel = ElevatedButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
    return Scaffold(
      backgroundColor: AppColors.backgroundColor  ,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                     colors: [AppColors.gradi1Color, AppColors.gradi2Color],
                     begin: Alignment.topRight,
                     //const FractionalOffset(0.0, 0.5),
                     end: Alignment.bottomLeft,
                     //const FractionalOffset(1.0, 0.6),
                     stops: [0.0, 1.0],
                     tileMode: TileMode.clamp),
               ),
              ),
            ],
          ),
          Center(
            child: Card(
              color: AppColors.backgroundColor,
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.all(42),
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 1.5,
                color: AppColors.backgroundColor,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 62.0),
                    Center(
                        child:  SvgPicture.asset(
                          'assets/icons/logo.svg',
                          width: 60,
                          height: 60,
                          color: AppColors.appColor,
                        )),
                    SizedBox(height: 48.0),

                    SizedBox(height: 5.0,),
                    TextFormFieldCustom(
                      onEditComplete: () {
                        emailFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 10.0,
                      error: "Enter Email or Phone Number",
                      textColor: AppColors.blackColor,
                      borderColor: AppColors.whiteColor,
                      fillColor: AppColors.whiteColor,
                      hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, AppColors.hintColor, FontWeight.w600, 'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomSizedTextStyle(16.0,
                          AppColors.blackColor, FontWeight.w600, 'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: emailFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "Email",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                      },
                      enabled: true,
                      textInputType: TextInputType.name,
                      controller: emailController,
                    ),


                    SizedBox(height: 5.0,),
                    TextFormFieldCustom(
                      obscureText: !passVisible,
                      textInputAction: TextInputAction.next,
                      textColor: AppColors.blackColor,
                      borderColor: AppColors.whiteColor,
                      fillColor: AppColors.whiteColor,
                      hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, AppColors.hintColor, FontWeight.w600, 'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomSizedTextStyle(16.0,
                          AppColors.blackColor, FontWeight.w600, 'FontRegular'),
                      radius: 10.0,
                      focusNode: passFocus,
                      suffix: Container(
                        width: 0.0,
                      ),
                      controller: passwordController,
                      enabled: true,
                      onChanged: () {},
                      hintText: "************",
                      textChanged: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        }

                        return null;
                      },
                      maxlines: 1,
                      error: "Enter Valid Password",
                      text: "",
                      onEditComplete: () {
                        passFocus.unfocus();
                      },
                      textInputType: TextInputType.visiblePassword,
                    ),

                    SizedBox(height: 8.0),

                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text("Remember Me")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 18.0),
                   InkWell(
                     onTap: (){
                       Navigator.of(context).pushReplacement(
                         MaterialPageRoute(
                           builder: (context) => HomeScreen(

                           ),
                         ),
                       );
                     },
                     child: Container(
                       padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         gradient: LinearGradient(
                             colors: [AppColors.gradi1Color, AppColors.gradi2Color],
                             begin: Alignment.topRight,
                             //const FractionalOffset(0.0, 0.5),
                             end: Alignment.bottomLeft,
                             //const FractionalOffset(1.0, 0.6),
                             stops: [0.0, 1.0],
                             tileMode: TileMode.clamp),

                       ),
                       child: Center(
                         child: Text("Login",style: CustomWidget(context: context).CustomSizedTextStyle(16.0, AppColors.whiteColor, FontWeight.w500, "FontRegular"),),
                       ),
                     ),
                   )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}