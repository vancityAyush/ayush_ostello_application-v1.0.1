import 'package:ayush_s_application5/core/app_export.dart';
import 'package:ayush_s_application5/presentation/wallet/controller/wallet_screen_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable

class AddValueWidget extends StatelessWidget {
  AddValueWidget(
    this.value, {
    Key? key,
  }) : super(
          key: key,
        );

  int value;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 6.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "+₹$value",
        style: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.fSize,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w500,
        ),
      ),
      // selected: (fourteenItemModelObj.isSelected?.value ?? false),
      selected: true,
      backgroundColor: theme.colorScheme.onPrimary,
      selectedColor: theme.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: theme.colorScheme.primaryContainer,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(
          17.h,
        ),
      ),
      onSelected: (_) {
        Get.find<WalletScreenController>().addMoreMoney(value);
      },
    );
  }
}
