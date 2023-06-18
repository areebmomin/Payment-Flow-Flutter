import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaadi_payment_flow/thankyou_page/thank_you_page_animation.dart';
import 'package:shaadi_payment_flow/thankyou_page/thank_you_page_ui.dart';
import '../utils/colors.dart';

const List<String> list = <String>[
  'All Banks',
  'State Bank of India',
  'HDFC Bank',
  'ICICI Bank',
  'Axis Bank',
  'IDBI Bank',
  'Kotak Bank',
  'Punjab National Bank',
  'Union Bank of India',
  'Bank of Baroda',
];

enum BankName { hdfc, icici, axis, sbi, idbi, punjab}

const List<String> bankImageName = [
  'assets/images/hdfc.png',
  'assets/images/icici.png',
  'assets/images/axis.png',
  'assets/images/sbi.png',
  'assets/images/idbi.png',
  'assets/images/punjab.png',
];

class Pp2PageUi extends StatefulWidget {
  const Pp2PageUi({Key? key}) : super(key: key);

  @override
  State<Pp2PageUi> createState() => _Pp2PageUiState();
}

class _Pp2PageUiState extends State<Pp2PageUi> {
  String dropdownValue = list.first;
  BankName? _bankName = BankName.hdfc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Options',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              getExpandablePaymentMethod('assets/images/credit_card.svg',
                  'Credit Card', getCreditDebitCardExpandedWidget()),
              getExpandablePaymentMethod('assets/images/debit_card.svg',
                  'Debit Card', getCreditDebitCardExpandedWidget()),
              getExpandablePaymentMethod('assets/images/net_banking.svg',
                  'Net Banking', getNetBankingCardExpandedWidget()),
              getExpandablePaymentMethod(
                  'assets/images/upi.svg', 'UPI', getUpiCardExpandedWidget()),
              getExpandablePaymentMethod('assets/images/paytm.svg', 'PayTM',
                  getPaytmCardExpandedWidget()),
              const Pp2MatchGuaranteeCard(),
              const Text(
                'By clicking on Confirm Payment, you authorize\nShaadi.com to charge your Card (details mentioned\nabove). IP Address of this  transaction is',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: darkTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                '125.16.124.218',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: darkTextColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: Image.asset(
                  'assets/images/secured.png',
                  height: 40,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getExpandablePaymentMethod(
      String iconName, String methodName, Widget expandedWidget) {
    return ExpansionTile(
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconName, width: 24),
        ],
      ),
      iconColor: darkTextColor,
      collapsedIconColor: darkTextColor,
      title: Text(
        methodName,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: darkTextColor,
        ),
      ),
      children: [
        expandedWidget,
      ],
    );
  }

  Widget getCreditDebitCardExpandedWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Card Number',
              focusColor: serviceCallTextColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: serviceCallTextColor, width: 2),
              ),
            ),
            cursorColor: serviceCallTextColor,
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: false),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Valid Through (MM/YY)',
                    focusColor: serviceCallTextColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: serviceCallTextColor, width: 2),
                    ),
                  ),
                  cursorColor: serviceCallTextColor,
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 120,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'CVV',
                    focusColor: serviceCallTextColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: serviceCallTextColor, width: 2),
                    ),
                  ),
                  cursorColor: serviceCallTextColor,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Card Holder’s Name',
              focusColor: serviceCallTextColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: serviceCallTextColor, width: 2),
              ),
            ),
            cursorColor: serviceCallTextColor,
            keyboardType: TextInputType.text,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: serviceCallTextColor,
              fixedSize: const Size(double.infinity, 48),
              elevation: 1,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThankYouPageUi()),
              );
            },
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Total Amount :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: darkTextColor,
                ),
              ),
              Text(
                '₹6,798',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getNetBankingCardExpandedWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text(
            'Popular Banks',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
            ),
          ),
        ),
        GridView.count(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 24),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: (1 / .82),
          children: List.generate(6, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Align(
                child: Container(
                  padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade500,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: BankName.values[index],
                        groupValue: _bankName,
                        toggleable: true,
                        activeColor: serviceCallTextColor,
                        onChanged: (value) {
                          setState(() {
                            _bankName = value!;
                          });
                        },
                      ),
                      Image.asset(
                        bankImageName[index],
                        width: double.infinity,
                        height: 20,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: DropdownButton(
              value: dropdownValue,
              underline: const SizedBox(),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: serviceCallTextColor,
              fixedSize: const Size(double.infinity, 48),
              elevation: 1,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThankYouPageUi()),
              );
            },
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Total Amount :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: darkTextColor,
                ),
              ),
              Text(
                '₹6,798',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getUpiCardExpandedWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 16),
          child: Text(
            'UPI Address (VPA Address)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Text(
            'You will receive a request in your UPI App',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 24),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your UPI ID',
              focusColor: serviceCallTextColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: serviceCallTextColor, width: 2),
              ),
            ),
            cursorColor: serviceCallTextColor,
            keyboardType: TextInputType.text,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: serviceCallTextColor,
              fixedSize: const Size(double.infinity, 48),
              elevation: 1,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThankYouPageUi()),
              );
            },
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Total Amount :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: darkTextColor,
                ),
              ),
              Text(
                '₹6,798',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 24),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                color: serviceCallTextColor,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Pay using other UPI App',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: serviceCallTextColor,
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/bhim.svg',
                  width: 80,
                ),
                SvgPicture.asset(
                  'assets/images/google_pay.svg',
                  width: 32,
                ),
                SvgPicture.asset(
                  'assets/images/phonepe.svg',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getPaytmCardExpandedWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 16),
          child: Text(
            'Pay using your PayTM Account',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Text(
            'Pay using PayTM Postpaid, Wallet, UPI or Save Cards',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: serviceCallTextColor,
              fixedSize: const Size(double.infinity, 48),
              elevation: 1,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThankYouPageAnimationWidget()),
              );
            },
            child: const Text(
              'Pay with PayTM',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Total Amount :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: darkTextColor,
                ),
              ),
              Text(
                '₹6,798',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Pp2MatchGuaranteeCard extends StatefulWidget {
  const Pp2MatchGuaranteeCard({Key? key}) : super(key: key);

  @override
  State<Pp2MatchGuaranteeCard> createState() => _Pp2MatchGuaranteeCardState();
}

class _Pp2MatchGuaranteeCardState extends State<Pp2MatchGuaranteeCard> {
  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SvgPicture.asset(
              'assets/images/match_guarantee_logo.svg',
              width: 96,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Match Guarantee!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: darkTextColor,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    // Show Tooltip programmatically on button tap.
                    tooltipKey.currentState?.ensureTooltipVisible();
                  },
                  child: SvgPicture.asset(
                    'assets/images/tooltip.svg',
                    width: 16,
                    height: 16,
                  ),
                ),
                Tooltip(
                  key: tooltipKey,
                  triggerMode: TooltipTriggerMode.manual,
                  showDuration: const Duration(minutes: 2),
                  message: 'If you have sent at-least 10\nConnects and you don'
                      't have a\nsingle Accept, we will refund your\nentire fee!',
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  enableFeedback: true,
                  preferBelow: false,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Get a full refund within 30 days\nif you don’t find a match.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: greyLightHeadingColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
