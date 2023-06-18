import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaadi_payment_flow/pp2/pp2_page_ui.dart';
import '../utils/colors.dart';
import '../data/order_summary_data.dart';

Future showOrderSummaryBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  color: orderSummaryTitleBackground,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: darkTextColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Gold',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: darkTextColor,
                          ),
                        ),
                        Text(
                          '(3 months + 1 week extra)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: darkTextColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text(
                    '₹4,990',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: darkTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Flexible(
                    child: Text(
                      'Saving (70% off)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: darkTextColor,
                      ),
                    ),
                  ),
                  Text(
                    '-₹3,493',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: greenDiscountColor,
                    ),
                  ),
                ],
              ),
            ),
            const SelectableAddonsListWidget(),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Divider(
                thickness: 2,
                indent: 12,
                endIndent: 12,
                color: selectPlanDisableBackgroundColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: darkTextColor,
                    ),
                  ),
                  Text(
                    '₹2,395',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: darkTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 40),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF60CED4),
                      Color(0xFF00BCD5),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(140, 48),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Pp2PageUi()),
                    );
                  },
                  child: const Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
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

class SelectableAddonsListWidget extends StatefulWidget {
  const SelectableAddonsListWidget({Key? key}) : super(key: key);

  @override
  State<SelectableAddonsListWidget> createState() =>
      _SelectableAddonsListWidgetState();
}

class _SelectableAddonsListWidgetState
    extends State<SelectableAddonsListWidget> {
  List<SelectableAddon> selectableAddons = [
    SelectableAddon(
        false, 'Promote my profile', '', 'Boost your profile', '', '₹499'),
    SelectableAddon(false, 'Add Sangam membership',
        '50 Contact no. for 1 month', 'Get Sangam membership', '₹599', '₹499'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getSelectableAddonsList(),
    );
  }

  List<Widget> getSelectableAddonsList() {
    List<Widget> selectableAddonsList = [];

    for (SelectableAddon selectableAddon in selectableAddons) {
      selectableAddonsList.add(getSelectableAddonWidget(selectableAddon));
    }

    return selectableAddonsList;
  }

  Widget getSelectableAddonWidget(SelectableAddon selectableAddon) {
    final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Checkbox(
            value: selectableAddon.isSelected,
            activeColor: const Color(0xFF00BCD5),
            checkColor: Colors.white,
            onChanged: (selected) {
              setState(() {
                if (selected != null) {
                  selectableAddon.isSelected = selected;
                }
              });
            },
          ),
          Expanded(
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Column(
                children: [
                  Text(
                    selectableAddon.info1,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: darkTextColor,
                    ),
                  ),
                  Visibility(
                    visible: selectableAddon.info2.isNotEmpty,
                    child: Text(
                      selectableAddon.info2,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: darkTextColor,
                      ),
                    ),
                  ),
                ],
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
                  'assets/images/tooltip_small.svg',
                  width: 16,
                  height: 16,
                ),
              ),
              Tooltip(
                key: tooltipKey,
                triggerMode: TooltipTriggerMode.manual,
                showDuration: const Duration(milliseconds: 300),
                message: selectableAddon.tooltipText,
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                enableFeedback: true,
                preferBelow: false,
              ),
            ]),
          ),
          Visibility(
            visible: selectableAddon.actualAmount.isNotEmpty,
            child: Text(
              selectableAddon.actualAmount,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: orderSummaryActualAmountTextColor,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            selectableAddon.discountedAmount,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: darkTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
