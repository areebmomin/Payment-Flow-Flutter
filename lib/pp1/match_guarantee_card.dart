import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaadi_payment_flow/data/pp1_data.dart';
import '../utils/colors.dart';

class MatchGuaranteeCardWidget extends StatelessWidget {
  final MatchGuaranteeCardData matchGuaranteeCardData;

  MatchGuaranteeCardWidget(this.matchGuaranteeCardData, {super.key});

  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        children: [
          const Text(
            'The safest, smartest, & the most secure',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: darkTextColor,
            ),
          ),
          const Text(
            'matchmaking service in India',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: darkTextColor,
            ),
          ),
          Card(
            elevation: 4,
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
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
                        showDuration: const Duration(milliseconds: 300),
                        message: matchGuaranteeCardData.tooltip,
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
                const Text(
                  'If you do not find a match within 30 days,\nget a full refund without any questions asked',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyLightHeadingColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 28, bottom: 28, left: 8, right: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x66F9F9F9),
                            Color(0xFFF4F4F7),
                            Color(0x66F9F9F9)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      MatchGuaranteeBenefitsWidget(
                          'assets/images/best_matches.svg', 'Best\nMatches'),
                      MatchGuaranteeBenefitsWidget(
                          'assets/images/verified_profiles.svg',
                          'Verified\nProfiles'),
                      MatchGuaranteeBenefitsWidget(
                          'assets/images/100_privacy.svg', '100%\nPrivacy'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MatchGuaranteeBenefitsWidget extends StatelessWidget {
  final String iconName;
  final String text;

  const MatchGuaranteeBenefitsWidget(this.iconName, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconName,
          width: 56,
          height: 56,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: greenDiscountColor,
          ),
        ),
      ],
    );
  }
}
