import 'package:coolwell/common/colors.dart';
import 'package:coolwell/common/data/api_utils.dart';
import 'package:coolwell/common/data/model/common_model.dart';
import 'package:coolwell/common/data/model/complaint_list_model.dart';
import 'package:coolwell/common/data/model/tech_list_model.dart';
import 'package:coolwell/common/widget/custom_widget.dart';
import 'package:coolwell/common/widget/dotted_line_widget.dart';
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

  List<TechList> techList = [];

  TechList? selTectList;
  ComplaintList? selList;
   bool assignView=false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    loading=true;
    getTechList();
    getList();
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
               assignView?"Assign Technician": "Jobs ",
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

    assignView?assignWidget(selList!):    history.length>0?  Container(
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
                    (index) => recentFileDataRow(history[index],context),
              ),
            ),
          ):Container(
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


  Widget assignWidget(ComplaintList details){
    var date = new DateTime.fromMillisecondsSinceEpoch(int.parse(details.date.toString()) * 1000);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0,),

        Row(
          children: [
            Text(

              "Choose Technician ",
              style: CustomWidget(context: context).CustomSizedTextStyle(
                14.0,
                AppColors.textColor,
                FontWeight.w500,
                "FontRegular",
              ),
            ),

            const SizedBox(width: 15.0,),
            Container(

              height: 35.0,
              width: MediaQuery.of(context).size.width*0.5,
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: AppColors.gradi1Color,
              ),
              child: Center(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor:AppColors.gradi1Color,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: techList
                          .map((value) => DropdownMenuItem(
                        child: Text(
                          value.name.toString(),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              12.0,
                              AppColors.whiteColor,
                              FontWeight.w500,
                              'FontRegular'),
                        ),
                        value: value,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {

                          selTectList=value;
                        });
                      },
                      isExpanded: true,
                      value: selTectList,

                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 20.0,),
                Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.0),
                    color: AppColors.whiteColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height *0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22.0),
                                topRight: Radius.circular(22.0)
                            ),
                          gradient: LinearGradient(
                              colors: [AppColors.gradi1Color, AppColors.gradi2Color],
                              begin: Alignment.topRight,
                              //const FractionalOffset(0.0, 0.5),
                              end: Alignment.bottomLeft,
                              //const FractionalOffset(1.0, 0.6),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                            // image: DecorationImage(
                            //   colorFilter: ColorFilter.mode(
                            //       Color(0xFF1F598E).withOpacity(0.6),
                            //       BlendMode.dstATop),
                            //   image: NetworkImage(
                            //       details!.coverImage![0].toString()
                            //   ),
                            //   fit: BoxFit.cover,
                            // )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 25.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          child: Text(
                                            details.serviceId!.serviceName.toString(),
                                            style: CustomWidget(
                                                context:
                                                context)
                                                .CustomSizedTextStyle(
                                                18.0,
                                                 AppColors.textColor,
                                                FontWeight
                                                    .w600,
                                                'FontRegular'),
                                            textAlign:
                                            TextAlign.start,
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "₹"+ details.amount.toString(),
                                              style: CustomWidget(
                                                  context:
                                                  context)
                                                  .CustomSizedTextStyle(
                                                  13.0,
                                                  Theme.of(
                                                      context)
                                                      .primaryColor,
                                                  FontWeight
                                                      .w800,
                                                  'FontRegular'),
                                              textAlign:
                                              TextAlign
                                                  .center,
                                            ),
                                            SizedBox(
                                              width: 12.0,
                                            ),
                                            Container(
                                              width: 3.0,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Theme.of(
                                                    context)
                                                    .primaryColor,
                                              ),
                                            ),

                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              "Target time "+ date.toString(),
                                              style: CustomWidget(
                                                  context:
                                                  context)
                                                  .CustomSizedTextStyle(
                                                  10.0,
                                                  Theme.of(
                                                      context)
                                                      .primaryColor,
                                                  FontWeight
                                                      .w400,
                                                  'FontRegular'),
                                              textAlign:
                                              TextAlign
                                                  .center,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                Flexible(
                                  child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10.0),
                                      image: DecorationImage(

                                        image: AssetImage(
                                          "assets/images/cleaning.png",),
                                        fit: BoxFit.cover,
                                      ),),
                                    width: 85.0,
                                    height: 80,
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            DottedLine(
                              direction: Axis.horizontal,
                              dashColor: Theme.of(context).shadowColor,
                            ),
                            const SizedBox(height: 20.0,),
                            Text(
                              // "User name",
                              details.userId!.name.toString(),
                              style: CustomWidget(
                                  context:
                                  context)
                                  .CustomSizedTextStyle(
                                  18.0,
                                  Theme.of(
                                      context)
                                      .primaryColor,
                                  FontWeight
                                      .w700,
                                  'FontRegular'),
                              textAlign:
                              TextAlign.start,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                            ),
                            const SizedBox(height: 5.0,),

                            const SizedBox(height: 20.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                      "Service details",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            18.0,
                                             AppColors.textColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),

                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),



                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                      "Indoor & Outer unit servicing",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            14.0,
                                             AppColors.textColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                              "Intence",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  12.0,
                                                   AppColors.textColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Duration",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            14.0,
                                             AppColors.textColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                              "45 mins",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  12.0,
                                                   AppColors.textColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "ACs serviced 5-12 months ago",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                             AppColors.textColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                      flex: 3,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                              "",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  12.0,
                                                   AppColors.textColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 20.0,
                                            color:  AppColors.textColor,
                                          ),
                                          const SizedBox(width: 5.0,),
                                          Flexible(
                                            child:  Text(
                                             details.address.toString(),
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  10.0,
                                                   AppColors.textColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )

                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),

                                    ],
                                  ),
                                ),flex: 1,),
                                Flexible(child: Container(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(
                                      "assets/images/scan.svg",
                                      height: 80.0,
                                      color:  AppColors.textColor,
                                    ),
                                  ),
                                ), flex: 1,)

                              ],
                            ),
                            const SizedBox(height: 20.0,),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),



                const SizedBox(height: 30.0,),
              ],
            ),
          ),
        ),



        const SizedBox(width: 15.0,),

        InkWell(
          onTap: (){
            setState(() {
              loading=true;
              assignjobs(selList!.id.toString(),selTectList!.id.toString());
            });

          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                      colors: [AppColors.gradi1Color, AppColors.gradi1Color],
                      begin: Alignment.topRight,
                      //const FractionalOffset(0.0, 0.5),
                      end: Alignment.bottomLeft,
                      //const FractionalOffset(1.0, 0.6),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),

                width:MediaQuery.of(context).size.width*0.25,
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                child: Text("Assign",style: CustomWidget(context: context).CustomSizedTextStyle(
                  14.0,
                  AppColors.whiteColor,
                  FontWeight.w500,
                  "FontRegular",
                ),textAlign: TextAlign.center,),
              ),
            ),
          ),
        )



      ],
    );
  }

  getList() {
    apiUtils.getTechList().then((TechListModel loginData) {
      setState(() {
        if (loginData.success) {
          setState(() {

            techList = loginData.result;
            selTectList=techList.first;
          });
        } else {

        }
      });
    }).catchError((Object error) {

      print(error);
      setState(() {
        loading = false;
      });
    });
  }


  assignjobs(String Complaint_id,String Technician_id) {
    print("Test");
    apiUtils.assignTech(Complaint_id, Technician_id).then((CommonModel loginData) {
      setState(() {
        if (loginData.success!) {



            CustomWidget(context: context).
            custombar(context, loginData.message.toString(), true);
            assignView=false;

            getTechList();


        } else {
          loading=false;

          CustomWidget(context: context).
          custombar(context, loginData.message.toString(), false);

        }
      });
    }).catchError((Object error) {

      print("Mano");
      print(error);
      setState(() {
        loading = false;
      });
    });
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
                child: Text(fileInfo.userId!.name.toString(),style:  CustomWidget(context: context).CustomSizedTextStyle(
                  10.0,
                  AppColors.textColor,
                  FontWeight.w500,
                  "FontRegular",
                ),),
              ),
            ],
          ),
        ),
        DataCell(Text(fileInfo.serviceId!.serviceName!.toString(),style:  CustomWidget(context: context).CustomSizedTextStyle(
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
        DataCell(InkWell(
          onTap: (){
           setState(() {
             selList=fileInfo;
             assignView=true;
           });

          },
          child: Container(
            height: 30.0,
            padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 3.0,bottom: 3.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.gradi1Color
            ),
            child: Center(
              child: Text("Assign",style:  CustomWidget(context: context).CustomSizedTextStyle(
                16.0,
                AppColors.whiteColor,
                FontWeight.w600,
                "FontRegular",
              ),),
            ),
          ),
        ))
      ],
    );


  }
}


