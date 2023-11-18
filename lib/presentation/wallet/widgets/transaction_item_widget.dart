import 'package:ayush_s_application5/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/payment_model.dart';

// ignore: must_be_immutable
class PaymentItemWidget extends StatelessWidget {
  PaymentItemWidget(
    this.paymentItem, {
    Key? key,
  }) : super(
          key: key,
        );

  PaymentModel paymentItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 6.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: paymentItem.image,
            height: 58.adaptSize,
            width: 58.adaptSize,
            radius: BorderRadius.circular(
              29.h,
            ),
            margin: EdgeInsets.only(bottom: 4.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 22.h,
                top: 4.v,
                bottom: 12.v,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentItem.name,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        paymentItem.paymentTypeColorAndText.$2,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: paymentItem.paymentTypeColorAndText.$1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentItem.mobileNo,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        DateFormat('dd MMM yyyy').format(
                          paymentItem.date,
                        ),
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
