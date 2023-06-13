import 'package:coolwell/common/data/api_utils.dart';
import 'package:coolwell/common/data/model/common_model.dart';
import 'package:coolwell/common/data/model/tech_list_model.dart';
import 'package:coolwell/common/widget/textformfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:coolwell/common/colors.dart';
import 'package:coolwell/common/widget/custom_widget.dart';
import 'package:coolwell/responsive/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({Key? key}) : super(key: key);

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen> {
  int crossAxisCount = 6;
  double childAspectRatio = 1;
  APIUtils apiUtils = APIUtils();

  FocusNode namedFocus = FocusNode();
  FocusNode rollFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode areaFocus = FocusNode();
  FocusNode pincodeFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  final emailformKey = GlobalKey<FormState>();
  bool loading = false;

  List<TechList> techList = [];

  bool addTech = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
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
                addTech
                    ? addTechUI()
                    : techList.length > 0
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Customers",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                      16.0,
                                      AppColors.textColor,
                                      FontWeight.w600,
                                      "FontRegular",
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        child: SvgPicture.asset(
                                          'assets/icon/add.svg',
                                          height: 80.0,
                                          width: 80.0,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            addTech = true;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
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
                                    _size.width < 650 && _size.width > 350
                                        ? 1.5
                                        : 1,
                                    _size),
                                tablet: gridCustomer(4, 1.0, _size),
                                desktop: gridCustomer(
                                    6, _size.width < 1400 ? 1.1 : 1.4, _size),
                              ),
                            ],
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.5,
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
            )));
  }

  Widget addTechUI() {
    return Container(
      child: Form(
        key: emailformKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Technician",
                  style: CustomWidget(context: context).CustomSizedTextStyle(
                    16.0,
                    AppColors.textColor,
                    FontWeight.w600,
                    "FontRegular",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          12.0,
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldCustom(
                        onEditComplete: () {
                          namedFocus.unfocus();
                          FocusScope.of(context).requestFocus(cityFocus);
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
                        focusNode: namedFocus,
                        maxlines: 1,
                        text: '',
                        hintText: "Name",
                        obscureText: false,
                        textChanged: (value) {},
                        onChanged: () {},
                        suffix: Container(
                          width: 0.0,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Name";
                          }

                          return null;
                        },
                        enabled: true,
                        textInputType: TextInputType.name,
                        controller: nameController,
                      )
                    ],
                  ),
                  flex: 1,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City",
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          12.0,
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldCustom(
                        onEditComplete: () {
                          cityFocus.unfocus();
                          FocusScope.of(context).requestFocus(areaFocus);
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
                        focusNode: cityFocus,
                        maxlines: 1,
                        text: '',
                        hintText: "City",
                        obscureText: false,
                        textChanged: (value) {},
                        onChanged: () {},
                        suffix: Container(
                          width: 0.0,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter City";
                          }

                          return null;
                        },
                        enabled: true,
                        textInputType: TextInputType.name,
                        controller: cityController,
                      )
                    ],
                  ),
                  flex: 1,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Area",
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          12.0,
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldCustom(
                        onEditComplete: () {
                          areaFocus.unfocus();
                          FocusScope.of(context).requestFocus(pincodeFocus);
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
                        focusNode: areaFocus,
                        maxlines: 1,
                        text: '',
                        hintText: "Area",
                        obscureText: false,
                        textChanged: (value) {},
                        onChanged: () {},
                        suffix: Container(
                          width: 0.0,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Area";
                          }

                          return null;
                        },
                        enabled: true,
                        textInputType: TextInputType.name,
                        controller: areaController,
                      )
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pincode",
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          12.0,
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldCustom(
                        onEditComplete: () {
                          pincodeFocus.unfocus();
                          FocusScope.of(context).requestFocus(emailFocus);
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
                        focusNode: pincodeFocus,
                        maxlines: 1,
                        text: '',
                        hintText: "Pincode",
                        obscureText: false,
                        textChanged: (value) {},
                        onChanged: () {},
                        suffix: Container(
                          width: 0.0,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Pincode";
                          }

                          return null;
                        },
                        enabled: true,
                        textInputType: TextInputType.name,
                        controller: pincodeController,
                      )
                    ],
                  ),
                  flex: 1,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          12.0,
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldCustom(
                        onEditComplete: () {
                          emailFocus.unfocus();
                          FocusScope.of(context).requestFocus(passwordFocus);
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
                      )
                    ],
                  ),
                  flex: 1,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          12.0,
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldCustom(
                        onEditComplete: () {
                          passwordFocus.unfocus();
                          FocusScope.of(context).requestFocus(mobileFocus);
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
                        focusNode: passwordFocus,
                        maxlines: 1,
                        text: '',
                        hintText: "Password",
                        obscureText: false,
                        textChanged: (value) {},
                        onChanged: () {},
                        suffix: Container(
                          width: 0.0,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Password";
                          }

                          return null;
                        },
                        enabled: true,
                        textInputType: TextInputType.name,
                        controller: passwordController,
                      )
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mobile",
                        style:
                            CustomWidget(context: context).CustomSizedTextStyle(
                          12.0,
                          AppColors.hintColor,
                          FontWeight.w400,
                          "FontRegular",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldCustom(
                        onEditComplete: () {
                          mobileFocus.unfocus();
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
                        focusNode: mobileFocus,
                        maxlines: 1,
                        text: '',
                        hintText: "Mobile Number",
                        obscureText: false,
                        textChanged: (value) {},
                        onChanged: () {},
                        suffix: Container(
                          width: 0.0,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Mobile number";
                          }

                          return null;
                        },
                        enabled: true,
                        textInputType: TextInputType.name,
                        controller: mobileController,
                      )
                    ],
                  ),
                  flex: 1,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: 150.0,
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                      setState(() {
                        addTech = false;
                      });
                    },
                    child: Container(
                      width: 150.0,
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        addTech = false;

                        nameController.clear();
                        rollController.clear();
                        cityController.clear();
                        areaController.clear();
                        pincodeController.clear();
                        emailController.clear();
                        passwordController.clear();
                        mobileController.clear();
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
                      setState(() {
                        if (emailformKey.currentState!.validate()) {
                          loading = true;
                          addTEchni();
                        }
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
                          "Add",
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
          ],
        ),
      ),
    );
  }

  Widget gridCustomer(int crossCounts, double childRatio, Size _size) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: techList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCounts,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: childRatio,
      ),
      itemBuilder: (context, index) => customerCard(_size, techList[index]),
    );
  }

  Widget customerCard(Size _size, TechList techListData) {
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
                Flexible(
                  child: Column(
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
                  ),
                  flex: 1,
                ),
                Image.asset(
                  'assets/icon/customer.png',
                  height: 45.0,
                  width: _size.width < 650 && _size.width > 350 ? 50.0 : 30.0,
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
                      onTap: () {
                        _makeEmail(techListData.email.toString());
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      child: SvgPicture.asset('assets/icon/call.svg'),
                      onTap: () {
                        _makePhoneCall(techListData.phone.toString());
                      },
                    )
                  ],
                ),
                InkWell(
                  child: SvgPicture.asset('assets/icon/edit.svg'),
                  onTap: () {},
                )
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
    apiUtils.getTechList().then((TechListModel loginData) {
      setState(() {
        if (loginData.success) {
          setState(() {
            loading = false;
            techList = loginData.result;
          });
        } else {
          loading = false;
        }
      });
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }

  addTEchni() {
    apiUtils
        .addTechnician(
            nameController.text.toString(),
            cityController.text.toString(),
            areaController.text.toString(),
            pincodeController.text.toString(),
            emailController.text.toString(),
            passwordController.text.toString(),
            mobileController.text.toString())
        .then((CommonModel loginData) {
      setState(() {
        if (loginData.success!) {
          setState(() {
            addTech = false;
            nameController.clear();
            rollController.clear();
            cityController.clear();
            areaController.clear();
            pincodeController.clear();
            emailController.clear();
            passwordController.clear();
            mobileController.clear();
            getTechList();

            CustomWidget(context: context)
                .custombar(context, loginData.message.toString(), true);
          });
        } else {
          loading = false;
          CustomWidget(context: context)
              .custombar(context, loginData.message.toString(), false);
        }
      });
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
}
