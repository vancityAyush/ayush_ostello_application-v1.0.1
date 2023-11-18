import 'package:ayush_s_application5/core/app_export.dart';
import 'package:ayush_s_application5/presentation/wallet/controller/wallet_screen_controller.dart';
import 'package:ayush_s_application5/presentation/wallet/widgets/add_value_widget.dart';
import 'package:ayush_s_application5/widgets/custom_elevated_button.dart';
import 'package:ayush_s_application5/widgets/custom_outlined_button.dart';
import 'package:ayush_s_application5/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../core/utils/widgtes.dart';

final addAmount = [200, 500, 1000, 1200];

class WalletRechargeScreen extends GetWidget<WalletScreenController> {
  const WalletRechargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildBackButton(),
                  SizedBox(height: 34.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_wallet".tr,
                          style: theme.textTheme.headlineLarge)),
                  SizedBox(height: 14.v),
                  _buildFourRow(),
                  SizedBox(height: 24.v),
                  _buildAmountColumn(),
                  SizedBox(height: 37.v),
                  _buildReferEarnColumn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFourRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 13.v),
      decoration: AppDecoration.outlinePrimaryContainer
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 2.v),
              child: Column(children: [
                Text("lbl_total_balance".tr, style: theme.textTheme.bodyLarge),
                Text("₹${controller.currentBalance}",
                    style: CustomTextStyles.headlineLargeAvenir)
              ])),
          CustomImageView(
              imagePath: ImageConstant.imgFlag,
              height: 58.adaptSize,
              width: 58.adaptSize,
              margin: EdgeInsets.only(top: 5.v, right: 6.h))
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAmountColumn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 18.v),
      decoration: AppDecoration.outlinePrimaryContainer1
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("msg_add_money_to_wallet".tr,
                  style: CustomTextStyles.titleMediumOnPrimaryContainer)),
          SizedBox(height: 13.v),
          CustomTextFormField(
            controller: controller.amountController,
            textInputType: TextInputType.number,
            hintText: "lbl_enter_amount".tr,
            textInputAction: TextInputAction.done,
            textStyle: CustomTextStyles.titleMediumOnPrimaryContainer
                .copyWith(color: Colors.black),
          ),
          SizedBox(height: 19.v),
          Wrap(
            runSpacing: 5.v,
            spacing: 10.h,
            children: List<Widget>.generate(
              addAmount.length,
              (index) {
                return AddValueWidget(
                  addAmount[index],
                );
              },
            ),
          ),
          SizedBox(height: 26.v),
          CustomElevatedButton(
            text: "msg_proceed_to_recharge".tr,
            onPressed: () async {
              controller.addBalance();
              Get.back();
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReferEarnColumn() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 21.v),
        decoration: AppDecoration.outlinePrimaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 303.h,
                  margin: EdgeInsets.only(right: 20.h),
                  child: Text("msg_help_somebody_become".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMediumOnPrimaryContainer)),
              SizedBox(height: 10.v),
              Container(
                  width: 282.h,
                  margin: EdgeInsets.only(right: 41.h),
                  child: Text("msg_refer_and_earn_100".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelLargeBluegray500
                          .copyWith(height: 1.50))),
              SizedBox(height: 14.v),
              CustomOutlinedButton(text: "lbl_refer_earn".tr),
              SizedBox(height: 4.v)
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
