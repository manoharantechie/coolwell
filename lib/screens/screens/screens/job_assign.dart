import 'package:coolwell/common/colors.dart';
import 'package:coolwell/common/data/api_utils.dart';
import 'package:coolwell/common/data/model/complaint_list_model.dart';
import 'package:coolwell/common/widget/custom_widget.dart';
import 'package:coolwell/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobAssignScreen extends StatefulWidget {
  const JobAssignScreen({Key? key}) : super(key: key);

  @override
  State<JobAssignScreen> createState() => _JobAssignScreenState();
}

class _JobAssignScreenState extends State<JobAssignScreen> {
  APIUtils apiUtils=APIUtils();
  bool loading=false;


  List<ComplaintList> history=[];

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
      child: Stack(
        children: [

          Column(
            children: [

              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(height: 16.0),
                        recentJobs(),
                        if (Responsive.isMobile(context)) SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context)) SizedBox(width: 16.0),
                  // On Mobile means if the screen is less than 850 we don't want to show it
                ],
              )
            ],
          ),
          loading
              ? CustomWidget(context: context)
              .loadingIndicator(AppColors.appColor)
              : Container()
        ],
      )
      ,
    );
  }

  Widget recentJobs() {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today Jobs ",
                style: CustomWidget(context: context).CustomSizedTextStyle(
                  16.0,
                  AppColors.textColor,
                  FontWeight.w600,
                  "FontRegular",
                ),
              ),
              SvgPicture.asset('assets/icon/filter.svg')
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: DataTable(
              columnSpacing: 16.0,
              showBottomBorder: false,



              // minWidth: 600,
              columns: [
                DataColumn(
                  label: Text(
                    "Customer Name",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                      10.0,
                      AppColors.hintColor,
                      FontWeight.w400,
                      "FontRegular",
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Title",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                      10.0,
                      AppColors.hintColor,
                      FontWeight.w400,
                      "FontRegular",
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Deadline",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                      10.0,
                      AppColors.hintColor,
                      FontWeight.w400,
                      "FontRegular",
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Amount",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                      10.0,
                      AppColors.hintColor,
                      FontWeight.w400,
                      "FontRegular",
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Status",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                      10.0,
                      AppColors.hintColor,
                      FontWeight.w400,
                      "FontRegular",
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                      10.0,
                      AppColors.hintColor,
                      FontWeight.w400,
                      "FontRegular",
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                      10.0,
                      AppColors.hintColor,
                      FontWeight.w400,
                      "FontRegular",
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                      10.0,
                      AppColors.hintColor,
                      FontWeight.w400,
                      "FontRegular",
                    ),
                  ),
                ),
              ],
              rows: List.generate(
                history.length,
                    (index) => recentFileDataRow(history[index],context),
              ),
            ),
          ),
        ],
      ),
    );
  }


  getTechList() {
    apiUtils.getComplaintlist().then((ComplaintListModel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            loading = false;
            history = loginData.result!;
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

DataRow recentFileDataRow(ComplaintList fileInfo,BuildContext context) {
  var date = new DateTime.fromMillisecondsSinceEpoch(int.parse(fileInfo.date.toString()) * 1000);
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.asset(
              'assets/icon/user.png',
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(fileInfo.serviceStatus.toString(),style:  CustomWidget(context: context).CustomSizedTextStyle(
                10.0,
                AppColors.textColor,
                FontWeight.w500,
                "FontRegular",
              ),),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.serviceStatus!.toString(),style:  CustomWidget(context: context).CustomSizedTextStyle(
        10.0,
        AppColors.hintColor,
        FontWeight.w400,
        "FontRegular",
      ),)),
      DataCell(Text(date.toString(),style:  CustomWidget(context: context).CustomSizedTextStyle(
        10.0,
        AppColors.hintColor,
        FontWeight.w400,
        "FontRegular",
      ),)),
      DataCell(Text(fileInfo.amount.toString(),style:  CustomWidget(context: context).CustomSizedTextStyle(
        10.0,
        AppColors.hintColor,
        FontWeight.w400,
        "FontRegular",
      ),)),
      DataCell(Container(
        padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 3.0,bottom: 3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: fileInfo.serviceStatus.toString()=="1"?AppColors.gradi1Color:fileInfo.serviceStatus.toString()=="2"?AppColors.buyColor:AppColors.buttonColor,

        ),
        child: Text(fileInfo.serviceStatus.toString()=="1"?"Processing":fileInfo.serviceStatus.toString()=="2"?"Completed":"Waiting",style:  CustomWidget(context: context).CustomSizedTextStyle(
          10.0,
          AppColors.whiteColor,
          FontWeight.w400,
          "FontRegular",
        ),),
      )),
      DataCell(
        SvgPicture.asset(
          'assets/icon/view.svg',
          height: 20,
          width: 20,
        ),
      ),
      DataCell(
        SvgPicture.asset(
          'assets/icon/trash.svg',
          height: 20,
          width: 20,
        ),
      ),
      DataCell(
        SvgPicture.asset(
          'assets/icon/more.svg',
          height: 20,
          width: 20,
        ),
      ),
    ],
  );
}
