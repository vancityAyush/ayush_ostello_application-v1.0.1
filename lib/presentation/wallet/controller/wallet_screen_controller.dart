import 'package:ayush_s_application5/core/app_export.dart';
import 'package:flutter/cupertino.dart';

import '../models/payment_model.dart';

/// A controller class for the WalletScreenScreen.
///
/// This class manages the state of the WalletScreenScreen, including the
/// current WalletScreenModelObj
enum FilterType {
  all,
  paid,
  received,
  added,
  deducted;

  @override
  String toString() {
    switch (this) {
      case FilterType.all:
        return "All";
      case FilterType.paid:
        return "Paid";
      case FilterType.received:
        return "Received";
      case FilterType.added:
        return "Added";
      case FilterType.deducted:
        return "Deducted";
    }
  }
}

class WalletScreenController extends GetxController {
  final paymentList = <PaymentModel>[
    PaymentModel(
      image: ImageConstant.imgEllipse,
      name: "Basant Kumar",
      amount: 122.00,
      mobileNo: "+91 9834989189",
      date: DateTime(2021, 05, 22),
      id: 1,
      paymentType: PaymentType.paid,
    ),
    PaymentModel(
      image: ImageConstant.imgEllipse58x58,
      name: "Suraj Sharma",
      amount: 15600.00,
      paymentType: PaymentType.deducted,
      mobileNo: "+91 9834989189",
      date: DateTime(2021, 05, 22),
      id: 2,
    ),
    PaymentModel(
      image: ImageConstant.imgEllipse1,
      name: "Abhilasha K.",
      amount: 894.45,
      paymentType: PaymentType.received,
      mobileNo: "+91 9834989189",
      date: DateTime(2021, 05, 22),
      id: 3,
    ),
    PaymentModel(
      name: "Omveer",
      amount: 12000.00,
      paymentType: PaymentType.added,
      mobileNo: "+91 9834989189",
      date: DateTime(2021, 05, 22),
      id: 4,
    ),
  ];

  final TextEditingController amountController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    recentPaymentsList.addAll(paymentList);
    _filterType.listen((event) {
      updateList();
    });
  }

  void addMoreMoney(int addAmount) {
    double amount = double.parse(
        amountController.text.isNotEmpty ? amountController.text : "0");
    amount += addAmount;
    amountController.text = amount.toString();
  }

  bool checkIfPaymentTypeIsSelected(PaymentType paymentType) {
    switch (paymentType) {
      case PaymentType.paid:
        return filterType == FilterType.paid;
      case PaymentType.received:
        return filterType == FilterType.received;
      case PaymentType.added:
        return filterType == FilterType.added;
      case PaymentType.deducted:
        return filterType == FilterType.deducted;
    }
  }

  updateList() {
    recentPaymentsList.clear();
    if (filterType == null || filterType == FilterType.all) {
      recentPaymentsList.addAll(paymentList);
    } else {
      recentPaymentsList.addAll(paymentList
          .where((element) => checkIfPaymentTypeIsSelected(element.paymentType))
          .toList());
    }
  }

  final RxList<PaymentModel> recentPaymentsList = RxList<PaymentModel>([]);

  final RxDouble _currentBalance = RxDouble(500);
  final Rx<FilterType?> _filterType = Rx<FilterType?>(null);

  String get currentBalance => _currentBalance.value.toStringAsFixed(2);
  bool get isBalanceLow => _currentBalance.value < 2000;

  set filterType(FilterType? filterType) => _filterType.value = filterType;
  FilterType? get filterType => _filterType.value;

  get isFilterApplied => _filterType.value != null;

  void addBalance() {
    _currentBalance.value += double.parse(amountController.text);
  }

  @override
  void onClose() {
    super.onClose();
    amountController.dispose();
  }
}
