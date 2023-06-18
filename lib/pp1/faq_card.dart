import 'package:flutter/material.dart';
import 'package:shaadi_payment_flow/data/pp1_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';

class FaqCardWidget extends StatelessWidget {
  final FaqCardWidgetData faqCardWidgetData;

  const FaqCardWidget(this.faqCardWidgetData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 40),
      child: Column(
        children: [
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: darkTextColor,
            ),
          ),
          Card(
            margin:
                const EdgeInsets.only(top: 16, bottom: 32, left: 20, right: 20),
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: FaqExpandableCardList(faqCardWidgetData.faqList),
          ),
          const Text(
            'Still Need Help?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: darkTextColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 4, bottom: 16),
            child: Text(
              'We are right here to help you. Give us a\ncall anytime between 10am to 7pm',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: greyLightHeadingColor,
                letterSpacing: -0.26,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'India -',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: darkTextColor,
                ),
              ),
              InkWell(
                onTap: () {
                  _launchUrl(faqCardWidgetData.servicePhoneNumber);
                },
                child: Text(
                  faqCardWidgetData.servicePhoneNumber,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: serviceCallTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String phoneNumber) async {
    if (!await launchUrl(Uri.parse('tel:$phoneNumber'))) {
      throw Exception('Could not launch');
    }
  }
}

class FaqExpandableCardList extends StatefulWidget {
  final List<FaqData> faqList;

  const FaqExpandableCardList(this.faqList, {super.key});

  @override
  State<FaqExpandableCardList> createState() => _FaqExpandableCardListState();
}

class _FaqExpandableCardListState extends State<FaqExpandableCardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.faqList.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: Text(
            widget.faqList[index].question,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: darkTextColor,
            ),
          ),
          backgroundColor: faqBackgroundColor,
          collapsedBackgroundColor: Colors.white,
          iconColor: Colors.black,
          collapsedIconColor: greyLightHeadingColor,
          trailing: widget.faqList[index].isExpanded
              ? getExpandedTrailingWidget()
              : const Icon(Icons.keyboard_arrow_down),
          onExpansionChanged: (isExpanded) {
            setState(() {
              widget.faqList[index].isExpanded = isExpanded;
            });
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
          ),
          tilePadding: const EdgeInsets.only(left: 16, right: 16),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 20, top: 12),
              child: Text(
                widget.faqList[index].answer,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: greyLightHeadingColor,
                  height: 1.2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget getExpandedTrailingWidget() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4)],
      ),
      child: const Icon(Icons.keyboard_arrow_up),
    );
  }
}
