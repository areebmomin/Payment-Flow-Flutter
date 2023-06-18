import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shaadi_payment_flow/utils/colors.dart';

import '../data/pp1_data.dart';

class PP1PageTopBanner extends StatefulWidget {
  final PP1TopBanner pp1topBanner;

  const PP1PageTopBanner(this.pp1topBanner, {super.key});

  @override
  State<PP1PageTopBanner> createState() => _PP1PageTopBannerState();
}

class _PP1PageTopBannerState extends State<PP1PageTopBanner> {
  String remainingTime = '';
  Timer? countDownTimer;
  late Duration duration;

  @override
  void initState() {
    super.initState();

    if (widget.pp1topBanner.showValidTillTimer) initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: shaadiThemeColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.pp1topBanner.showBannerImage,
            child: Image.asset(
              'assets/images/shaadi_pp1_banner.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Visibility(
            visible: widget.pp1topBanner.showValidValidTillDate,
            child: const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                'Valid till 15th February',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.pp1topBanner.showValidTillTimer,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                'Offer valid till: $remainingTime',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initializeTimer() {
    duration = widget.pp1topBanner.validTillDuration;
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateTimerText();
    });
  }

  void updateTimerText() {
    const reducedBySecond = 1;
    setState(() {
      final seconds = duration.inSeconds - reducedBySecond;
      if (seconds < 0) {
        countDownTimer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
        remainingTime =
            '${duration.inHours.remainder(24)} hrs : ${duration.inMinutes.remainder(60)} min : ${duration.inSeconds.remainder(60)} sec';
      }
    });
  }
}
