import 'package:coolwell/common/data/model/recent_his_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/colors.dart';
import '../../../common/data/api_utils.dart';
import '../../../common/data/model/complaint_list_model.dart';
import '../../../common/widget/custom_widget.dart';
import '../../../responsive/responsive.dart';
import 'dash_board.dart';

class TaskManagementScreen extends StatefulWidget {
  const TaskManagementScreen({Key? key}) : super(key: key);

  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {

  bool loading=false;
  APIUtils apiUtils=APIUtils();
  List<ComplaintList> history=[];

  @override
  Widget build(BuildContext context) {
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
                "Task Management",
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

          history.length>0?  Container(
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
                    "Service",
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
                    (index) => recentFileDataRow(history[index] as HistoryList,context),
              ),
            ),
          ):
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            child: Center(
              child: Text(
                "No records found...!",
                style: CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    16.0,
                    AppColors.textColor,
                    FontWeight.w700,
                    'FontRegular'),
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



