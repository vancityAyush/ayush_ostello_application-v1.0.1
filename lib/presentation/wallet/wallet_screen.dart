import 'package:ayush_s_application5/core/app_export.dart';
import 'package:ayush_s_application5/core/utils/widgtes.dart';
import 'package:ayush_s_application5/presentation/wallet/widgets/transaction_item_widget.dart';
import 'package:ayush_s_application5/presentation/wallet/widgets/wallet_balance_widget.dart';
import 'package:ayush_s_application5/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

import 'controller/wallet_screen_controller.dart';
import 'models/payment_model.dart';

class WalletScreen extends GetWidget<WalletScreenController> {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.h, right: 25.h, bottom: 12.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildBackButton(),
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Text("lbl_wallet".tr,
                        style: theme.textTheme.headlineLarge),
                  ),
                  SizedBox(height: 14.v),
                  WalletBalanceWidget(controller: controller),
                  SizedBox(height: 24.v),
                  _buildReferEarnSection(),
                  SizedBox(height: 26.v),
                  _buildFrameSection(context),
                  SizedBox(height: 23.v),
                  _buildRecentPayments()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildReferEarnSection() {
    return Container(
        margin: EdgeInsets.only(right: 3.h),
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

  /// Section Widget
  Widget _buildFrameSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("lbl_recent_payments".tr, style: theme.textTheme.bodyLarge),
          Spacer(),
          InkWell(
            onTap: () async {
              FilterType? f = await Get.bottomSheet(
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 29.h,
                    vertical: 8.v,
                  ),
                  child: Obx(() {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 4.v,
                          width: 43.h,
                          margin: EdgeInsets.only(bottom: 3.v),
                          decoration: BoxDecoration(
                            color: Color(0xffA0A0A0),
                            borderRadius: BorderRadius.circular(2.h),
                          ),
                        ),
                        SizedBox(height: 30.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Filters",
                              style: TextStyle(
                                fontSize: 22.fSize,
                                fontWeight: FontWeight.w800,
                                fontFamily: "avenir",
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back(result: null);
                              },
                              child: Text(
                                "Clear Filters",
                                style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30.v),
                        for (FilterType filter in FilterType.values)
                          ListTile(
                            onTap: () {
                              Get.back(result: filter);
                            },
                            leading: Radio<FilterType>(
                              value: filter,
                              groupValue: controller.filterType,
                              activeColor: Color(0xff7D23E0),
                              onChanged: (FilterType? value) {
                                Get.back(result: value);
                              },
                            ),
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 0,
                            minLeadingWidth: 0,
                            minVerticalPadding: 0,
                            title: Text(
                              filter.toString(),
                              style: TextStyle(
                                fontSize: 18.fSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48.h),
                    topRight: Radius.circular(48.h),
                  ),
                ),
                backgroundColor: Colors.white,
              );
              controller.filterType = f;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  return Visibility(
                    visible: controller.isFilterApplied,
                    child: Container(
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                      margin: EdgeInsets.only(bottom: 5.v),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                    ),
                  );
                }),
                SizedBox(width: 5.h),
                CustomImageView(
                    imagePath: ImageConstant.imgFilter,
                    height: 22.v,
                    width: 22.h,
                    alignment: Alignment.centerLeft),
                Text(
                  "lbl_filter".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          // Container(
          //   height: 18.v,
          //   width: 43.h,
          //   margin: EdgeInsets.only(left: 11.h, bottom: 3.v),
          //   child: Stack(
          //     alignment: Alignment.centerLeft,
          //     children: [
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRecentPayments() {
    return Padding(
      padding: EdgeInsets.only(left: 1.h, right: 3.h),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0.v),
                child: SizedBox(
                    width: 368.h,
                    child: Divider(
                        height: 1.v, thickness: 1.v, color: appTheme.gray200)));
          },
          itemCount: controller.recentPaymentsList.length,
          itemBuilder: (context, index) {
            PaymentModel model = controller.recentPaymentsList[index];
            return PaymentItemWidget(model);
          },
        ),
      ),
    );
  }
}
