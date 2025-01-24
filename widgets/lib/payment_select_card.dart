import 'package:flutter/material.dart';
import 'package:utils/utils.dart';
import 'package:widgets/widgets.dart';

class PaymentSelectCard extends StatefulWidget {
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
  State<PaymentSelectCard> createState() => _PaymentSelectCardState();
}

class _PaymentSelectCardState extends State<PaymentSelectCard> {
  late DateTime chequeDate;
  late TextEditingController bankName;
  late TextEditingController chequeNumber;
  late TextEditingController onlineTransactionId;

  @override
  void initState() {
    super.initState();
    chequeDate = DateTime.now();
    bankName = TextEditingController();
    chequeNumber = TextEditingController();
    onlineTransactionId = TextEditingController();
  }

  @override
  void dispose() {
    bankName.dispose();
    chequeNumber.dispose();
    onlineTransactionId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.paymentMethod,
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
                        groupValue: widget.paymentMethod.value,
                        onChanged: (value) {
                          setState(() {
                            widget.paymentMethod.value = value!;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            labelText: "Payment Method",
            hintText: widget.paymentMethod.value.name,
          ),
          switch (widget.paymentMethod.value) {
            PaymentMethod.Online => CustomTextFormField(
                isRequired: true,
                controller: onlineTransactionId,
                labelText: "Transaction Id",
                onChanged: (value) {
                  if (widget.getTransactionId != null) {
                    widget.getTransactionId!(value);
                  }
                },
              ),
            PaymentMethod.Cheque => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DatePickerFormfield(
                      labelText: "Cheque Date",
                      isRequired: true,
                      date: chequeDate,
                      onChanged: (value) {
                        setState(() {
                          chequeDate = value;
                        });
                        if (widget.getTransactionId != null) {
                          widget.getChequeDate!(value);
                        }
                      },
                    ),
                    CustomTextFormField(
                      controller: bankName,
                      isRequired: true,
                      labelText: "Bank Name",
                      onFieldSubmitted: (value) {
                        if (widget.getBankName != null) {
                          widget.getBankName!(value);
                        }
                      },
                    ),
                    CustomTextFormField(
                      isRequired: true,
                      controller: chequeNumber,
                      labelText: "Cheque Number",
                      onFieldSubmitted: (value) {
                        if (widget.getChequeNumber != null) {
                          widget.getChequeNumber!(value);
                        }
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
