import 'package:flutter/material.dart';

import '../data/thank_you_page_data.dart';
import '../utils/colors.dart';

class ThankYouPageUi extends StatefulWidget {
  ThankYouPageUi({Key? key}) : super(key: key);

  final List<OrderDetail> orderDetailList = [
    OrderDetail('Order Id', '167629277436'),
    OrderDetail('Payment Mode', 'PAYTM'),
    OrderDetail('Selected Plan', 'Gold Plus'),
    OrderDetail('Gold Plus Membership', '₹6,299'),
    OrderDetail('50 extra Contact nos added', '₹299'),
    OrderDetail('Promote my Profile', '₹399'),
    OrderDetail('Shaadi.org Contribution', '₹20'),
    OrderDetail('Total Amount', '₹4,182'),
  ];

  @override
  State<ThankYouPageUi> createState() => _ThankYouPageUiState();
}

class _ThankYouPageUiState extends State<ThankYouPageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: serviceCallTextColor,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 24, bottom: 16),
                color: Colors.white,
                shadowColor: Colors.grey.shade100,
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.orderDetailList[index].name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: darkTextColor,
                              ),
                            ),
                            Text(
                              widget.orderDetailList[index].value,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: darkTextColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const Text(
                'Start searching and connecting with your potential\npartners right away.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: darkTextColor,
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 16),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        top: 13, bottom: 13, left: 24, right: 24),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: serviceCallTextColor,
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
              const Text(
                'For help call us on',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: darkTextColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4, bottom: 24),
                child: Text(
                  '+91-7862889999',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: serviceCallTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
