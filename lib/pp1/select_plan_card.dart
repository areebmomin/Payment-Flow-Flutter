import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaadi_payment_flow/data/pp1_data.dart';
import 'package:shaadi_payment_flow/order_summary/order_summary_bottom_sheet.dart';
import '../utils/colors.dart';

class SelectPlanCardBig extends StatelessWidget {
  final SelectPlanCardData selectPlanCardData;

  const SelectPlanCardBig(this.selectPlanCardData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 16),
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/select_shaadi_top_design.png'),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: SvgPicture.asset(
              'assets/images/select_shaadi_logo.svg',
              width: 200,
            ),
          ),
          const Text(
            'A Personalised Matchmaking\nService for You',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: darkTextColor,
                letterSpacing: 0.2,
                height: 1.3),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: SvgPicture.asset(
              'assets/images/select_shaadi_middle_design.svg',
              width: 200,
            ),
          ),
          const SelectShaadiCardBenefitItem(
            'assets/images/dedicated_advisor.svg',
            'Dedicated Advisor',
          ),
          const SelectShaadiCardBenefitItem(
            'assets/images/handpicked_matches.svg',
            'Handpicked Matches as per Your Preferences',
          ),
          const SelectShaadiCardBenefitItem(
            'assets/images/introductions_and_meetings.svg',
            'Introductions and Meetings',
          ),
          const SelectShaadiCardBenefitItem(
            'assets/images/all_premium_matches.svg',
            'All Premium Benefits Included',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  thickness: 1,
                ),
                Container(
                  color: Colors.white,
                  child: SvgPicture.asset(
                    'assets/images/green_plan_strip.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Text(
                  '1 extra week for FREE 🔥',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: greenDiscountColor,
                  ),
                ),
              ],
            ),
          ),
          SelectCardPlanGridView(selectPlanCardData.selectPlanList),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              onTap: () {
                showOrderSummaryBottomSheet(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 13, bottom: 13, left: 48, right: 48),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFDF4A45),
                      Color(0xFFCE2772),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: buttonShadowColor,
                      blurRadius: 16,
                      spreadRadius: 16,
                    ),
                  ],
                ),
                child: const Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              'Need more information?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: greyLightHeadingColor2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 32),
            child: InkWell(
              onTap: () {
                debugPrint('Consult');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/phone.svg',
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Request a free Select Shaadi consultation',
                    style: TextStyle(
                      color: selectShaadiRequestTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SelectShaadiCardBenefitItem extends StatelessWidget {
  final String imageName;
  final String text;

  const SelectShaadiCardBenefitItem(this.imageName, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48, top: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageName,
            width: 32,
            height: 32,
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: selectShaadiBenefitTextColor,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectCardPlanGridView extends StatefulWidget {
  final List<SelectPlanCardDataItem> selectPlanList;

  const SelectCardPlanGridView(this.selectPlanList, {Key? key}) : super(key: key);

  @override
  State<SelectCardPlanGridView> createState() => _SelectCardPlanGridViewState();
}

class _SelectCardPlanGridViewState extends State<SelectCardPlanGridView> {
  int selectedPlanIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: const EdgeInsets.only(left: 16, right: 16),
      children: List.generate(2, (index) {
        bool isSelectedItem = selectedPlanIndex == index;

        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedPlanIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: isSelectedItem
                      ? [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 25,
                            blurStyle: BlurStyle.outer,
                          ),
                        ]
                      : null,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                      color: isSelectedItem
                          ? selectShaadiRequestTextColor
                          : selectPlanDisableBackgroundColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 20,
                          decoration: BoxDecoration(
                              color: isSelectedItem
                                  ? selectShaadiBenefitTextColor
                                  : selectPlanDisableBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  topRight: Radius.circular(7))),
                        ),
                        Text(
                          widget.selectPlanList[index].duration,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: isSelectedItem
                                ? Colors.white
                                : greyLightHeadingColor2,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          widget.selectPlanList[index].actualPrice,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: greyLightHeadingColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        widget.selectPlanList[index].sellingPrice,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: isSelectedItem
                              ? selectShaadiBenefitTextColor
                              : greyLightHeadingColor2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 8),
                      child: Text(
                        widget.selectPlanList[index].amountPerMonth,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: isSelectedItem
                              ? selectShaadiBenefitTextColor
                              : greyLightHeadingColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
