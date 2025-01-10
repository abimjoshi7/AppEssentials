// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// ///  [
// ///   DataColumn2(
// ///     label: Text('Column A'),
// ///     size: ColumnSize.L,
// ///   ),
// ///   DataColumn(
// ///     label: Text('Column B'),
// ///   ),
// class CustomTable extends HookWidget {
//   const CustomTable({
//     required this.columnList,
//     required this.rowList,
//     this.columnSpacing = 12,
//     this.horizontalMargin = 12,
//     this.minWidth = 600,
//   });

//   final List<DataColumn> columnList;
//   final List<DataRow> rowList;
//   final double columnSpacing;
//   final double horizontalMargin;
//   final double minWidth;

//   @override
//   Widget build(BuildContext context) {
//     return DataTable2(
//       columns: columnList,
//       rows: rowList,
//       columnSpacing: columnSpacing,
//       horizontalMargin: horizontalMargin,
//       minWidth: minWidth,
      
//     );
//   }
// }

//       //  List<DataRow>.generate(
//       //   100,
//       //   (index) => DataRow(
//       //     cells: rowList.map((e) => e).toList(),
//       //  [
//       //   DataCell(Text('A' * (10 - index % 10))),
//       //   DataCell(Text('B' * (10 - (index + 5) % 10))),
//       //   DataCell(Text('C' * (15 - (index + 5) % 10))),
//       //   DataCell(Text('D' * (15 - (index + 10) % 10))),
//       //   DataCell(Text(((index + 0.1) * 25.4).toString()))
//       // ],
//       // ),
//       // ),