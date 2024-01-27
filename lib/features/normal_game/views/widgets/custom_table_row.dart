import 'package:flutter/material.dart';
import 'package:skrew/common/models/table_item_model.dart';
import 'package:skrew/features/normal_game/views/widgets/custom_table_item.dart';

class CustomTableRow extends StatelessWidget {
  const CustomTableRow({
    super.key,
    this.isLast = false,
    required this.tableItems,
  });
  final bool isLast;
  final List<TableItemModel> tableItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        tableItems.length,
        (index) {
          return CustomTableItem(
            isLeft: index == 0 ? true : false,
            color: tableItems.elementAt(index).color,
            onlyNumbers: tableItems.elementAt(index).onlyNumbers,
            controller: tableItems.elementAt(index).controller,
            enable: tableItems.elementAt(index).enable,
            initialValue: tableItems.elementAt(index).initialValue,
            isLast: isLast,
            onChange: tableItems.elementAt(index).onChange,
            fontSize: tableItems.elementAt(index).fontSize,
          );
        },
      ),
    );
  }
}
