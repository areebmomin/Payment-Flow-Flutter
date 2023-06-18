class PP1Data {
  Map<PP1Component, dynamic> components = {
    PP1Component.topBanner: PP1TopBanner(),
    PP1Component.plansViewPager: PP1PlanViewPager(),
    PP1Component.selectPlanCard: SelectPlanCardData(),
    PP1Component.vipPlanCard: VipPlanCardData(),
    PP1Component.matchGuaranteeCard: MatchGuaranteeCardData(),
    PP1Component.faqCard: FaqCardWidgetData(),
  };
}

enum PP1Component {
  topBanner,
  plansViewPager,
  selectPlanCard,
  vipPlanCard,
  matchGuaranteeCard,
  faqCard,
}

class PP1TopBanner {
  bool showBannerImage = true;
  bool showValidValidTillDate = false;
  bool showValidTillTimer = false;
  Duration validTillDuration = const Duration(hours: 2);
}

class PP1PlanViewPager {}

class SelectPlanCardData {
  List<SelectPlanCardDataItem> selectPlanList = [
    SelectPlanCardDataItem('03 MONTHS', '₹32,500', '₹26,000', '₹8,667 /month'),
    SelectPlanCardDataItem('06 MONTHS', '₹57,000', '₹45,600', '₹7,600 /month'),
  ];
}

class SelectPlanCardDataItem {
  String duration;
  String actualPrice;
  String sellingPrice;
  String amountPerMonth;

  SelectPlanCardDataItem(
      this.duration, this.actualPrice, this.sellingPrice, this.amountPerMonth);
}

class VipPlanCardData {}

class MatchGuaranteeCardData {
  String tooltip = 'If you have sent at-least 10\nConnects and you don'
      't have a\nsingle Accept, we will refund your\nentire fee!';
}

class FaqCardWidgetData {
  List<FaqData> faqList = [
    FaqData(
        question: 'What are some of the benefits of Premium plans?',
        answer:
            'As a Premium member, you can chat unlimited with your Matches, view their contact numbers and view hidden photos. You also get Premium Assistance on priority. These benefits will help you to accelerate your partner search.'),
    FaqData(
        question: 'What payment options do you offer?',
        answer:
            'We offer multiple Online and Offline payment options for you to pick and choose from based on your location. Choose your preferred plan and move forward to see the various options available to you.'),
    FaqData(
        question: 'What offer and discounts can I avail?',
        answer:
            'We keep you informed from time to time whenever you are eligible for different discounts and offers. Login frequently to check and avail the best available offer.'),
    FaqData(
        question: 'How safe will I be on Shaadi.com?',
        answer:
            'We go to great lengths to make sure you get the best possible experience here. Every single profile is screened & your matches are tailored to your preferences. But if you still have any unpleasant please do report the same to us'),
  ];

  String servicePhoneNumber = '+91 8149311487';
}

class FaqData {
  final String question;
  final String answer;
  bool isExpanded = false;

  FaqData(
      {required this.question, required this.answer, this.isExpanded = false});
}
