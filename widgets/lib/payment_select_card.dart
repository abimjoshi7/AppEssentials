// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:utils/utils.dart';
import 'package:widgets/widgets.dart';

class PaymentSelectCard extends HookWidget {
  const PaymentSelectCard({
    super.key,
    required this.paymentMethod,
    this.getChequeDate,
    this.getBankName,
    this.getChequeNumber,
    this.getTransactionId,
  });

  final ValueNotifier<PaymentMethod> paymentMethod;
  final ValueChanged<DateTime>? getChequeDate;
  final ValueChanged<String>? getBankName;
  final ValueChanged<String>? getChequeNumber;
  final ValueChanged<String>? getTransactionId;

  @override
  Widget build(BuildContext context) {
    final chequeDate = useState(DateTime.now());
    final bankName = useTextEditingController();
    final chequeNumber = useTextEditingController();
    final onlineTransactionId = useTextEditingController();

    return ValueListenableBuilder(
      valueListenable: paymentMethod,
      builder: (context, value, child) => Column(
        children: [
          CustomTextFormField(
            suffixIcon: const Icon(
              Icons.arrow_drop_down_rounded,
            ),
            readOnly: true,
            onTap: () => context.showBottomSheet(
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select payment method",
                        style: context.bodyLarge,
                      ),
                      IconButton(
                        onPressed: context.burn,
                        icon: Icon(
                          Icons.clear,
                          color: context.disabledColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      PaymentMethod.values.length,
                      (index) => RadioListTile.adaptive(
                        title: Text(
                          PaymentMethod.values[index].name,
                        ),
                        value: PaymentMethod.values[index],
                        groupValue: paymentMethod.value,
                        onChanged: (value) {
                          paymentMethod.value = value!;
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            labelText: "Payment Method",
            hintText: paymentMethod.value.name,
          ),
          switch (paymentMethod.value) {
            PaymentMethod.Online => CustomTextFormField(
                isRequired: true,
                controller: onlineTransactionId,
                labelText: "Transaction Id",
                onChanged: (value) {
                  if (getTransactionId != null) getTransactionId!(value);
                },
              ),
            PaymentMethod.Cheque => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DatePickerFormfield(
                      labelText: "Cheque Date",
                      isRequired: true,
                      date: chequeDate.value,
                      onChanged: (value) {
                        chequeDate.value = value;
                        if (getTransactionId != null) getChequeDate!(value);
                      },
                    ),
                    CustomTextFormField(
                      controller: bankName,
                      isRequired: true,
                      labelText: "Bank Name",
                      onFieldSubmitted: (value) {
                        if (getBankName != null) getBankName!(value);
                      },
                    ),
                    CustomTextFormField(
                      isRequired: true,
                      controller: chequeNumber,
                      labelText: "Cheque Number",
                      onFieldSubmitted: (value) {
                        if (getChequeNumber != null) getChequeNumber!(value);
                      },
                    ),
                  ],
                ),
              ),
            _ => const SizedBox.shrink(),
          },
        ],
      ),
    );
  }
}
