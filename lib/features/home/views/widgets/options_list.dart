import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skrew/features/home/cubit/players_number_cubit.dart';
import 'package:skrew/features/home/cubit/players_number_state.dart';

import 'options_item.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersNumberCubit, PlayersNumberState>(
      builder: (context, state) {
        final cubit = PlayersNumberCubit.of(context);
        return ListView.separated(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemBuilder: (context, index) => OptionsItem(
            title: PlayersNumberCubit.options[index],
            isSelected: cubit.currentOptionIndex == index,
            onTap: () => cubit.selectOption(optionIndex: index),
          ),
          separatorBuilder: (context, index) => const Gap(5),
          itemCount: PlayersNumberCubit.options.length,
        );
      },
    );
  }
}
