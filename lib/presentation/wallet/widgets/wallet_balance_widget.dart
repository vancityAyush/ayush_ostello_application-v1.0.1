import 'package:ayush_s_application5/core/app_export.dart';
import 'package:ayush_s_application5/presentation/wallet/controller/wallet_screen_controller.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class WalletBalanceWidget extends StatelessWidget {
  WalletBalanceWidget({
    Key? key,
    required this.controller,
  }) : super(
          key: key,
        );
  final WalletScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
            margin: EdgeInsets.only(right: 3.h),
            padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 5.v),
            decoration: AppDecoration.outlinePrimaryContainer
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder14),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1.v),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.h, vertical: 10.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_total_balance".tr,
                                style: theme.textTheme.bodyLarge,
                              ),
                              Text(
                                "₹" + controller.currentBalance,
                                style: CustomTextStyles.headlineLargeAvenir,
                              ),
                            ],
                          ),
                        ),
                        CustomElevatedButton(
                            width: 156.h,
                            onPressed: () {
                              Get.toNamed(AppRoutes.proceedToRechargeScreen);
                            },
                            text: "lbl_recharge_now".tr,
                            margin: EdgeInsets.only(top: 3.v, bottom: 9.v))
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isBalanceLow,
                    child: Padding(
                      padding: EdgeInsets.only(right: 34.h),
                      child: Row(
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgMaterialSymbolsError,
                              height: 16.adaptSize,
                              width: 16.adaptSize),
                          Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_please_maintain2".tr,
                                        style: CustomTextStyles
                                            .labelLargeAvenirRed500),
                                    TextSpan(
                                        text: "lbl".tr,
                                        style: CustomTextStyles
                                            .labelLargeAvenirRed500),
                                    TextSpan(
                                        text: "lbl_2000".tr,
                                        style: CustomTextStyles
                                            .labelLargeAvenirRed500)
                                  ]),
                                  textAlign: TextAlign.left))
                        ],
                      ),
                    ),
                  )
                ]));
      },
    );
  }
}
