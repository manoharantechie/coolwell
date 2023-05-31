import 'package:coolwell/common/colors.dart';
import 'package:coolwell/responsive/responsive.dart';
import 'package:coolwell/screens/screens/models/menu_modal.dart';
import 'package:coolwell/screens/screens/screens/customers.dart';
import 'package:coolwell/screens/screens/screens/dash_board.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/side/dash.svg', title: "Dashboard"),
    MenuModel(icon: 'assets/side/cust.svg', title: "Customer"),
    MenuModel(icon: 'assets/side/tech.svg', title: "Technician"),
    MenuModel(icon: 'assets/side/manage.svg', title: "Management"),
    MenuModel(icon: 'assets/side/job.svg', title: "Job Assign"),
    MenuModel(icon: 'assets/side/message.svg', title: "Message"),
    MenuModel(icon: 'assets/side/setting.svg', title: "Setting"),
    MenuModel(icon: 'assets/side/logout.svg', title: "Logout"),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

   Widget screen = Dashboard();
   int selectIndex=0;
  List<Widget> bottomPage = [
    Dashboard(),
    CustomersScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.grey,
    ),
    Container(
      color: Colors.cyan,
    ),
    Container(
      color: Colors.pink,
    ),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      key: _scaffoldkey,
      drawer:  MenuDesign(),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
          child:  Column(
            children: [

              header(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      child: MenuDesign(),
                    ),


                  Expanded(
                    flex: 5,
                    child: PageStorage(
                        child: screen, bucket: bucket),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }


  Widget header(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     !Responsive.isDesktop(context)?
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){

                _scaffoldkey.currentState!.openDrawer();
              }
          ):Container(
       width: MediaQuery.of(context).size.width*0.1665,
         height: 100,
         decoration: BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.topRight,
               colors: [
                 AppColors.gradi2Color,
                 AppColors.gradi1Color,
               ],
             )),
       child:   Padding(
         padding: EdgeInsets.only(left: 15.0,right: 15.0),
         child:   SvgPicture.asset(
           'assets/icons/logo.svg',
           width: 60,
           height: 60,
         ),
       )

     ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: search()),
        profile()
      ],
    );
  }

  Widget profile(){
    return Container(
      margin: EdgeInsets.only(left: 16.0,top: 10.0,right: 10.0),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0 / 2,
      ),
      decoration: BoxDecoration(
        color:   AppColors.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0 / 2),
              child: Text("Angelina Jolie"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
  Widget search(){
    return Padding(padding: EdgeInsets.only(top: 10.0),child: TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor:   AppColors.whiteColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(16.0 * 0.75),
            margin: EdgeInsets.symmetric(horizontal: 16.0 / 2),
            decoration: BoxDecoration(
              color:   AppColors.whiteColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    ),);
  }

  void onSelectItem(int index) async {
    setState(() {
      selectIndex = index;

        screen = bottomPage[index];

    });
  }
  Widget MenuDesign() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: !Responsive.isMobile(context)?MediaQuery.of(context).size.width*0.3:MediaQuery.of(context).size.width*0.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          AppColors.gradi2Color,
          AppColors.gradi1Color,
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          children: [

            SizedBox(
              height: Responsive.isMobile(context) ? 10 : 30,
            ),
            for (var i = 0; i < menu.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: selected == i
                    ? BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: <Color>[
                            Color(0xff0DD8FF),
                            Color(0xff0E69C7),
                          ], // Gradient from https://learnui.design/tools/gradient-generator.html
                        ),
                      )
                    : BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                        color: Colors.transparent),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = i;
                      onSelectItem(i);
                    });

                    _scaffoldkey.currentState!.closeDrawer();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 7),
                        child: SvgPicture.asset(
                          menu[i].icon,
                          color: AppColors.whiteColor,
                          height: 20.0,
                        ),
                      ),
                      Text(
                        menu[i].title,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.whiteColor,
                            fontWeight: selected == i
                                ? FontWeight.w600
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
          ],
        )),
      ),
    );
  }
}
