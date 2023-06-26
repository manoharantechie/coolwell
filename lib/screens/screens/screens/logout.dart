import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/colors.dart';
import '../../../common/widget/custom_widget.dart';
import '../../login.dart';

class Logout_Screen extends StatefulWidget {
  const Logout_Screen({Key? key}) : super(key: key);

  @override
  State<Logout_Screen> createState() => _Logout_ScreenState();
}

class _Logout_ScreenState extends State<Logout_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Logout ",
                  style: CustomWidget(context: context).CustomSizedTextStyle(
                    20.0,
                    AppColors.textColor,
                    FontWeight.w600,
                    "FontRegular",
                  ),
                ),
                const SizedBox(height: 15.0,),
                Text(
                  "Are you want to Logout the Application ",
                  style: CustomWidget(context: context).CustomSizedTextStyle(
                    14.0,
                    AppColors.textColor,
                    FontWeight.w600,
                    "FontRegular",
                  ),
                ),
                const SizedBox(height: 15.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          setState(() {

                          });
                        },
                        child: Container(
                          width: 150.0,
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                                colors: [
                                  AppColors.gradi1Color.withOpacity(0.5),
                                  AppColors.gradi2Color.withOpacity(0.5)
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
                              "Cancel",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(16.0, AppColors.whiteColor,
                                  FontWeight.w500, "FontRegular"),
                            ),
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          setState(() async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.clear();
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                Login()), (Route<dynamic> route) => false);
                          });
                        },
                        child: Container(
                          width: 150.0,
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
                              "Okay",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(16.0, AppColors.whiteColor,
                                  FontWeight.w500, "FontRegular"),
                            ),
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0,),
              ],
            ),
          )

        ],
      ),
    ));
  }
}
