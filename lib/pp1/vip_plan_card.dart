import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaadi_payment_flow/data/pp1_data.dart';
import '../utils/colors.dart';

class VipPlanCardWidget extends StatelessWidget {
  final VipPlanCardData vipPlanCardData;

  const VipPlanCardWidget(this.vipPlanCardData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 16),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SvgPicture.asset(
            'assets/images/vip_shaadi_background.svg',
            width: MediaQuery.of(context).size.width - 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70, bottom: 36),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              onTap: () {
                _dialogBuilder(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 13, bottom: 13, left: 48, right: 48),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: buttonShadowColor,
                      blurRadius: 16,
                      spreadRadius: 16,
                    ),
                  ],
                ),
                child: const Text(
                  'Get Invited',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selectShaadiBenefitTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: SvgPicture.asset(
                  'assets/images/call.svg',
                  width: 90,
                  height: 90,
                ),
              ),
              const Text(
                'Please confirm if you would like to\nreceive free VIP consultation',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: greyDarkHeadingColor,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, top: 40),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        top: 13, bottom: 13, left: 48, right: 48),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF764CA5),
                          Color(0xFF55347B),
                          Color(0xFF492B6C),
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
                      'Yes, please',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 2),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Not now',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: lightTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
