import 'package:coolwell/common/colors.dart';
import 'package:coolwell/common/widget/custom_widget.dart';
import 'package:coolwell/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  int crossAxisCount = 6;
  double childAspectRatio = 1;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
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
                    'assets/icon/add.svg',
                    height: 80.0,
                    width: 80.0,
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
              _size.width < 650 && _size.width > 350 ? 1.3 : 1,
            ),
            tablet: gridCustomer(4, 1.0),
            desktop: gridCustomer(
              6,
              _size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        ],
      ),
    ));
  }

  Widget gridCustomer(int crossCounts, double childRatio) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCounts,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: childRatio,
      ),
      itemBuilder: (context, index) => customerCard(),
    );
  }

  Widget customerCard() {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Bararak Saiq",
                      style:
                          CustomWidget(context: context).CustomSizedTextStyle(
                        16.0,
                        AppColors.textColor,
                        FontWeight.w500,
                        "FontRegular",
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Address line",
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
                      "example @gmail.com",
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
                Image.asset(
                  'assets/icon/customer.png',
                  height: 45.0,
                  width: 50.0,
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
                    SvgPicture.asset('assets/icon/mail.svg'),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SvgPicture.asset('assets/icon/call.svg')
                  ],
                ),
                SvgPicture.asset('assets/icon/edit.svg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
