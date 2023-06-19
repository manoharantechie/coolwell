import 'package:coolwell/common/colors.dart';
import 'package:coolwell/common/data/api_utils.dart';
import 'package:coolwell/common/data/model/user_list_model.dart';
import 'package:coolwell/common/widget/custom_widget.dart';
import 'package:coolwell/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  int crossAxisCount = 6;
  double childAspectRatio = 1;

  bool loading=false;
  APIUtils apiUtils=APIUtils();

  List<Userlist> userList=[];

  String limit="20";
  String page="1";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading=true;
    getTechList();
  }
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: [
                 userList.length>0? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Customers",
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                            16.0,
                            AppColors.textColor,
                            FontWeight.w600,
                            "FontRegular",
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            SvgPicture.asset(
                              'assets/icon/list.svg',
                              height: 80.0,
                              width: 80.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SvgPicture.asset(
                              'assets/icon/grid.svg',
                              height: 80.0,
                              width: 80.0,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Responsive(
                      mobile: gridCustomer(
                          _size.width < 650 ? 2 : 4,
                          _size.width < 650 && _size.width > 350 ? 1.5 : 1,
                          _size
                      ),
                      tablet: gridCustomer(4, 1.0,  _size),
                      desktop: gridCustomer(
                          6,
                          _size.width < 1400 ? 1.1 : 1.4,  _size
                      ),
                    ),
                  ],
                ):Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  child: Center(
                    child: Text(
                      "No records found...!",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          16.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w700,
                          'FontRegular'),
                    ),
                  ),
                ),
                loading
                    ? CustomWidget(context: context)
                    .loadingIndicator(AppColors.appColor)
                    : Container()
              ],
            )
        ));
  }

  Widget gridCustomer(int crossCounts, double childRatio,Size _size) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: userList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCounts,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: childRatio,
      ),
      itemBuilder: (context, index) => customerCard(_size,userList[index]),
    );
  }

  Widget customerCard(Size _size,Userlist techListData) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      techListData.name.toString(),
                      style:
                      CustomWidget(context: context).CustomSizedTextStyle(
                        14.0,
                        AppColors.textColor,
                        FontWeight.w500,
                        "FontRegular",
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      techListData.phone.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                      CustomWidget(context: context).CustomSizedTextStyle(
                        10.0,
                        AppColors.dashtextColor,
                        FontWeight.w500,
                        "FontRegular",
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      techListData.email.toString(),
                      style:
                      CustomWidget(context: context).CustomSizedTextStyle(
                        10.0,
                        AppColors.dashtextColor,
                        FontWeight.w500,
                        "FontRegular",
                      ),
                    ),
                  ],
                ),flex: 1,),
                Image.asset(
                  'assets/icon/customer.png',
                  height: 45.0,
                  width:_size.width < 650 && _size.width > 350? 50.0:30.0,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(

                      child: SvgPicture.asset('assets/icon/mail.svg'),
                      onTap: (){
                        _makeEmail(techListData.email.toString());

                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      child:  SvgPicture.asset('assets/icon/call.svg'),
                      onTap: (){
                        _makePhoneCall(techListData.phone.toString());

                      },
                    )
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makeEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }

  getTechList() {
    apiUtils
        .getUserList(limit, page).then((Userlistmodel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;
            userList=loginData.result!.docs!;

          });


        } else {

          loading = false;

        }
      });
    }).catchError((Object error) {
      print(error);

      setState(() {
        loading = false;
      });
    });
  }
}
