import 'package:flutter/material.dart';
import 'package:shaadi_payment_flow/data/pp1_data.dart';
import 'package:shaadi_payment_flow/pp1/faq_card.dart';
import 'package:shaadi_payment_flow/pp1/match_guarantee_card.dart';
import 'package:shaadi_payment_flow/pp1/pp1_page_plans_view_pager.dart';
import 'package:shaadi_payment_flow/pp1/pp1_page_top_banner.dart';
import 'package:shaadi_payment_flow/pp1/select_plan_card.dart';
import 'package:shaadi_payment_flow/pp1/vip_plan_card.dart';
import 'package:shaadi_payment_flow/utils/strings.dart';

import '../utils/colors.dart';

class PP1Page extends StatefulWidget {
  final PP1Data pp1data;

  const PP1Page(this.pp1data, {super.key});

  @override
  State<PP1Page> createState() => _PP1PageState();
}

class _PP1PageState extends State<PP1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          upgradeToPremium,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: shaadiPaymentBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getPP1ComponentWidgets(widget.pp1data),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getPP1ComponentWidgets(PP1Data pp1data) {
    List<Widget> pp1ComponentList = [];

    pp1data.components.forEach((key, value) {
      switch (key) {
        case PP1Component.topBanner:
          pp1ComponentList.add(PP1PageTopBanner(value as PP1TopBanner));
          break;
        case PP1Component.plansViewPager:
          pp1ComponentList.add(PP1PagePlansViewPager(value as PP1PlanViewPager));
          break;
        case PP1Component.selectPlanCard:
          pp1ComponentList.add(SelectPlanCardBig(value as SelectPlanCardData));
          break;
        case PP1Component.vipPlanCard:
          pp1ComponentList.add(VipPlanCardWidget(value as VipPlanCardData));
          break;
        case PP1Component.matchGuaranteeCard:
          pp1ComponentList.add(MatchGuaranteeCardWidget(value as MatchGuaranteeCardData));
          break;
        case PP1Component.faqCard:
          pp1ComponentList.add(FaqCardWidget(value as FaqCardWidgetData));
          break;
      }
    });

    return pp1ComponentList;
  }
}
