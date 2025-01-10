// import 'package:flutter/material.dart';
// import 'package:raindrop_erp/core/core.dart';
// import 'package:raindrop_erp/features/features.dart';

// class PaymentTile extends StatelessWidget {
//   final PaymentEntity payment;

//   const PaymentTile({super.key, required this.payment});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               Text(
//                 payment.id?.toString() ?? "0",
//                 style: context.labelLarge,
//               ),
//               Text(
//                 payment.date?.dMy ?? DateTime.now().dMy,
//                 style: context.labelSmall?.copyWith(
//                   color: context.disabledColor,
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Text(
//                 payment.paymentAmount?.toString() ?? "0.00",
//                 style: context.labelLarge,
//               ),
//               Text(
//                 payment.paymentMethod?.toString() ?? "Cash",
//                 style: context.labelSmall?.copyWith(
//                   color: context.disabledColor,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// TODO: Revamp