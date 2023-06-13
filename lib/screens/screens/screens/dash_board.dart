import 'package:coolwell/common/data/api_utils.dart';
import 'package:coolwell/common/data/model/tech_list_model.dart';
import 'package:coolwell/common/widget/custom_widget.dart';
import 'package:coolwell/screens/screens/models/RecentFile.dart';
import 'package:coolwell/screens/screens/screens/dashboard/components/chart.dart';

import 'package:flutter/material.dart';
import 'package:coolwell/common/colors.dart';
import 'package:coolwell/responsive/responsive.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  APIUtils apiUtils=APIUtils();
  bool loading=false;
  int techCount=0;
  int userCount=0;
  int jobCount=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: _size.width < 650 ? 20 : 50.0,
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon/green_dot.svg'),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "FontRegular"),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon/blue_dot.svg'),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "FontRegular"),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.0 * 0.75),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: SvgPicture.asset(
                                'assets/icon/people.svg',
                              ),
                            ),
                            Container(
                              width: 50.0,
                              child: Chart(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Total customers",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomWidget(context: context).CustomTextStyle(
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "256",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          21.0,
                          AppColors.textColor,
                          FontWeight.w600,
                          "FontRegular",
                        ),
                      ),

                      // ProgressLine(
                      //   color: info.color,
                      //   percentage: info.percentage,
                      // ),
                    ],
                  ),
                ),
                flex: 1,
              ),
              SizedBox(
                width: _size.width < 650 ? 20 : 50.0,
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon/green_dot.svg'),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "FontRegular"),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon/blue_dot.svg'),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "FontRegular"),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.0 * 0.75),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: SvgPicture.asset(
                                'assets/icon/people.svg',
                              ),
                            ),
                            Container(
                              width: 50.0,
                              child: Chart(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Total Technicians",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomWidget(context: context).CustomTextStyle(
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "256",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          21.0,
                          AppColors.textColor,
                          FontWeight.w600,
                          "FontRegular",
                        ),
                      ),

                      // ProgressLine(
                      //   color: info.color,
                      //   percentage: info.percentage,
                      // ),
                    ],
                  ),
                ),
                flex: 1,
              ),
              SizedBox(
                width: _size.width < 650 ? 20 : 30.0,
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon/green_dot.svg'),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "FontRegular"),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon/blue_dot.svg'),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.hintColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "FontRegular"),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.0 * 0.75),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: SvgPicture.asset(
                                'assets/icon/people.svg',
                              ),
                            ),
                            Container(
                              width: 50.0,
                              child: Chart(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(

                        "Total jobs",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomWidget(context: context).CustomTextStyle(
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        jobCount.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          21.0,
                          AppColors.textColor,
                          FontWeight.w600,
                          "FontRegular",
                        ),
                      ),

                      // ProgressLine(
                      //   color: info.color,
                      //   percentage: info.percentage,
                      // ),
                    ],
                  ),
                ),
                flex: 1,
              ),
              SizedBox(
                width: _size.width < 650 ? 20 : 30.0,
              ),
            ],
          ),
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
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index],context),
              ),
            ),
          ),
        ],
      ),
    );
  }


}

DataRow recentFileDataRow(RecentFile fileInfo,BuildContext context) {
  return DataRow(

    cells: [
      DataCell(
        Row(
          children: [
            Image.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(fileInfo.title!,style:  CustomWidget(context: context).CustomSizedTextStyle(
                10.0,
                AppColors.textColor,
                FontWeight.w500,
                "FontRegular",
              ),),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!,style:  CustomWidget(context: context).CustomSizedTextStyle(
        10.0,
        AppColors.hintColor,
        FontWeight.w400,
        "FontRegular",
      ),)),
      DataCell(Text(fileInfo.size!,style:  CustomWidget(context: context).CustomSizedTextStyle(
        10.0,
        AppColors.hintColor,
        FontWeight.w400,
        "FontRegular",
      ),)),
      DataCell(Text(fileInfo.size!,style:  CustomWidget(context: context).CustomSizedTextStyle(
        10.0,
        AppColors.hintColor,
        FontWeight.w400,
        "FontRegular",
      ),)),
      DataCell(Text(fileInfo.status!,style:  CustomWidget(context: context).CustomSizedTextStyle(
        10.0,
        AppColors.hintColor,
        FontWeight.w400,
        "FontRegular",
      ),)),
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
