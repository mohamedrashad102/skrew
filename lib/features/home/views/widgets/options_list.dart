import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skrew/features/home/views/widgets/options_item.dart';

class OptionsList extends StatefulWidget {
  const OptionsList({
    super.key,
    required this.onSelect,
    required this.options,
  });
  final List<String> options;
  final void Function(int index) onSelect;

  @override
  State<OptionsList> createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => OptionsItem(
        title: widget.options[index],
        isSelected: currentIndex == index,
        onTap: () => _selectOption(index: index),
      ),
      separatorBuilder: (context, index) => const Gap(5),
      itemCount: widget.options.length,
    );
  }

  _selectOption({required int index}) {
    setState(() {
      currentIndex = index;
      widget.onSelect(index);
    });
  }
}
