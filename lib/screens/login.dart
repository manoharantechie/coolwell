import 'package:coolwell/common/colors.dart';
import 'package:coolwell/common/data/api_utils.dart';
import 'package:coolwell/common/data/model/login_model.dart';
import 'package:coolwell/common/widget/custom_widget.dart';
import 'package:coolwell/common/widget/textformfield_custom.dart';
import 'package:coolwell/screens/screens/home_screen.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({
    Key? key,
  }) : super(key: key);

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
  APIUtils apiUtils = APIUtils();
  final emailformKey = GlobalKey<FormState>();
  String address="";

  @override
  void initState() {
    super.initState();
    getdata();

  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    address = preferences.getString("token").toString();
   onLoad();

  }
  onLoad() {


     if (address.toString() == "" ||
        address.toString() == null ||
        address.toString() == "null") {
      setState(() {


        // checkDeviceID(deviceData['device_id'].toString());
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                HomeScreen()));
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
              child: Form(
                key: emailformKey,
                child: Container(
                  padding: EdgeInsets.all(42),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 1.5,
                  color: AppColors.backgroundColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 62.0),
                      Center(
                          child: SvgPicture.asset(
                            'assets/icons/logo.svg',
                            width: 60,
                            height: 60,
                            color: AppColors.appColor,
                          )),
                      SizedBox(height: 48.0),
                      SizedBox(
                        height: 5.0,
                      ),
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
                        hintStyle: CustomWidget(context: context)
                            .CustomSizedTextStyle(12.0, AppColors.hintColor,
                            FontWeight.w600, 'FontRegular'),
                        textStyle: CustomWidget(context: context)
                            .CustomSizedTextStyle(16.0, AppColors.blackColor,
                            FontWeight.w600, 'FontRegular'),
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
                          if (value!.isEmpty) {
                            return "Please enter Email";
                          }

                          return null;
                        },
                        enabled: true,
                        textInputType: TextInputType.name,
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextFormFieldCustom(
                        obscureText: !passVisible,
                        textInputAction: TextInputAction.next,
                        textColor: AppColors.blackColor,
                        borderColor: AppColors.whiteColor,
                        fillColor: AppColors.whiteColor,
                        hintStyle: CustomWidget(context: context)
                            .CustomSizedTextStyle(12.0, AppColors.hintColor,
                            FontWeight.w600, 'FontRegular'),
                        textStyle: CustomWidget(context: context)
                            .CustomSizedTextStyle(16.0, AppColors.blackColor,
                            FontWeight.w600, 'FontRegular'),
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
                        onTap: () {
                      if(emailformKey.currentState!.validate())
                        {
                          setState(() {
                            loading = true;

                            doVerify();
                          });
                        }
                                             },
                        child: Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                                colors: [
                                  AppColors.gradi1Color,
                                  AppColors.gradi2Color
                                ],
                                begin: Alignment.topRight,
                                //const FractionalOffset(0.0, 0.5),
                                end: Alignment.bottomLeft,
                                //const FractionalOffset(1.0, 0.6),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  16.0,
                                  AppColors.whiteColor,
                                  FontWeight.w500,
                                  "FontRegular"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
          ),
          loading
              ? CustomWidget(context: context)
                  .loadingIndicator(AppColors.appColor)
              : Container()
        ],
      ),
    );
  }

  doVerify() {

    apiUtils
        .doLoginEmail(emailController.text.toString(), passwordController.text.toString()).then((LoginModel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;

          });
          if(loginData.result!.user!.role.toString()=="admin")
            {

              CustomWidget(context: context).
              custombar(context, loginData.message.toString(), true);

              storeData(
                  loginData.result!.token.toString(),
                  loginData.result!.user!.id.toString(),
                  loginData.result!.user!.email.toString(),
                  loginData.result!.user!.role.toString(),
                  loginData.result!.user!.name.toString());

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen()));
            }


          emailController.clear();
          passwordController.clear();

        } else {

          loading = false;
          CustomWidget(context: context).
          custombar(context, loginData.message.toString(), false);

        }
      });
    }).catchError((Object error) {

      setState(() {
        loading = false;
      });
    });
  }

  storeData(String token, String userId, String email,String role, String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
    preferences.setString("userId", userId);
    preferences.setString("email", email);
    preferences.setString("roleType", role);
    preferences.setString("name", name);
  }
}
