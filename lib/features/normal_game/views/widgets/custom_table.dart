import 'package:flutter/material.dart';
import 'package:skrew/common/models/table_item_model.dart';
import 'package:skrew/features/normal_game/views/widgets/custom_table_row.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    super.key,
    required this.tableItems,
  });
  final List<List<TableItemModel>> tableItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: List.generate(tableItems.length, (index) {
            return CustomTableRow(
              tableItems: tableItems.elementAt(index),
              isLast: index == tableItems.length - 1,
            );
          }),
        ),
      ),
    );
  }
}
