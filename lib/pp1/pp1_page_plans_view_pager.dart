import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaadi_payment_flow/data/pp1_data.dart';
import 'package:shaadi_payment_flow/order_summary/order_summary_bottom_sheet.dart';
import '../utils/colors.dart';

class PP1PagePlansViewPager extends StatelessWidget {
  final PP1PlanViewPager pp1planViewPager;

  PP1PagePlansViewPager(this.pp1planViewPager, {super.key});

  final ValueNotifier<int> currentPage = ValueNotifier(0);

  final PageController pageController = PageController(
    viewportFraction: 0.85,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });

    return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (context, value, child) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              color: shaadiThemeColor,
            ),
            Column(
              children: [
                PlansIndicatorWidget(currentPage, (index) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.decelerate,
                  );
                }),
                SizedBox(
                  height: 460,
                  child: PageView(
                    scrollBehavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    controller: pageController,
                    children: const [
                      MembershipPlanCard(),
                      MembershipPlanCard(),
                      MembershipPlanCard(),
                      SelectPlanCard(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class PlansIndicatorWidget extends StatelessWidget {
  final ValueListenable<int> currentPage;
  final Function(int index) callback;

  const PlansIndicatorWidget(this.currentPage, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (BuildContext context, int value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            getIndicatorWidget('S', 0, value),
            getIndicatorWidget('G', 1, value),
            getIndicatorWidget('G+', 2, value),
            getIndicatorWidget('Sel', 3, value),
          ],
        );
      },
    );
  }

  Widget getIndicatorWidget(String text, int index, int currentPage) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 0),
      child: InkWell(
        onTap: () {
          callback(index);
        },
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.white : shaadiThemeColor,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: currentPage == index ? shaadiThemeColor : Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MembershipPlanCard extends StatelessWidget {
  const MembershipPlanCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 2, left: 2),
      child: Card(
        color: Colors.white,
        shadowColor: shaadiPaymentBackgroundColor,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    'GOLD PLUS',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: greyDarkHeadingColor,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    '3 MONTHS',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: greyLightHeadingColor,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SvgPicture.asset(
                  'assets/images/green_plan_strip.svg',
                  fit: BoxFit.fitWidth,
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
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 32, right: 32),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xFFF4F4F7),
                          Color(0xFFCDCED1),
                          Color(0xFFF4F4F7),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 4),
                    decoration: const BoxDecoration(
                      color: badgeBackground,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'TOP SELLER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '60% off ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: greenDiscountColor,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '₹14,650',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: darkTextColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            const Text(
              '₹5,190',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: greyDarkHeadingColor,
                letterSpacing: 1,
              ),
            ),
            const Text(
              '₹488 per month',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: lightTextColor,
                letterSpacing: -0.28,
              ),
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
              ),
              itemBuilder: (buildContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tick_green.svg',
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Send unlimited Messages',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: darkTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
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
                        Color(0xFF60CED4),
                        Color(0xFF00BCD5),
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
          ],
        ),
      ),
    );
  }
}

class SelectPlanCard extends StatelessWidget {
  const SelectPlanCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 2, left: 2),
      child: Card(
        color: Colors.white,
        shadowColor: shaadiPaymentBackgroundColor,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'SELECT - ASSISTED PLAN',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/green_plan_strip.svg',
                    fit: BoxFit.fitWidth,
                  ),
                  const Text(
                    'Gold Membership for FREE 🔥',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: greenDiscountColor,
                    ),
                  ),
                ],
              ),
            ),
            const SelectPlanListWidget(),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 16,
              ),
              itemBuilder: (buildContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tick_green.svg',
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Send unlimited Messages',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: darkTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
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
                        Color(0xFF60CED4),
                        Color(0xFF00BCD5),
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
          ],
        ),
      ),
    );
  }
}

class SelectPlanListWidget extends StatefulWidget {
  const SelectPlanListWidget({Key? key}) : super(key: key);

  @override
  State<SelectPlanListWidget> createState() => _SelectPlanListWidgetState();
}

class _SelectPlanListWidgetState extends State<SelectPlanListWidget> {
  int selectedPlanIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      children: List.generate(2, (index) {
        bool isSelectedItem = selectedPlanIndex == index;

        return Center(
          child: InkWell(
            onTap: () {
              setState(() {
                selectedPlanIndex = index;
              });
            },
            child: Container(
              height: isSelectedItem ? 116 : 104,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: isSelectedItem
                    ? [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 20,
                          blurStyle: BlurStyle.outer,
                        ),
                      ]
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                    color: isSelectedItem
                        ? selectCardEnabledBackgroundColor
                        : selectPlanBorderColor,
                    width: isSelectedItem ? 2 : 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 22,
                        decoration: BoxDecoration(
                            color: isSelectedItem
                                ? selectCardEnabledBackgroundColor
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(2),
                                topRight: Radius.circular(2))),
                      ),
                      Text(
                        '03 MONTHS',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: isSelectedItem
                              ? Colors.white
                              : selectPlanDeSelectedPlanName,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '20% off',
                          style: TextStyle(
                            fontSize: isSelectedItem ? 12 : 11,
                            fontWeight: isSelectedItem
                                ? FontWeight.w700
                                : FontWeight.w400,
                            color: isSelectedItem
                                ? greenDiscountColor
                                : greyLightHeadingColor,
                          ),
                        ),
                        Text(
                          ' • ',
                          style: TextStyle(
                            fontSize: isSelectedItem ? 12 : 11,
                            fontWeight: FontWeight.w400,
                            color: greyLightHeadingColor,
                          ),
                        ),
                        Text(
                          '₹32,500',
                          style: TextStyle(
                            fontSize: isSelectedItem ? 12 : 11,
                            fontWeight: FontWeight.w400,
                            color: greyLightHeadingColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '₹26,000',
                      style: TextStyle(
                        fontSize: isSelectedItem ? 20 : 18,
                        fontWeight:
                            isSelectedItem ? FontWeight.w800 : FontWeight.w700,
                        color: isSelectedItem
                            ? greyDarkHeadingColor
                            : greyLightHeadingColor2,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      '₹8,667 /month',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: greyLightHeadingColor2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
