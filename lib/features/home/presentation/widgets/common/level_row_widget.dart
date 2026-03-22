import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/home_strings.dart';
import '../../Bloc/home_bloc.dart';
import 'level_button_widget.dart';

class LevelRowWidget extends StatelessWidget {
  const LevelRowWidget({super.key, required this.currentLevel});
  final String currentLevel;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LevelButtonWidget(
          level: HomeStrings.lvl1,
          isSelected: currentLevel == 'lvl_1',
          function: () {
            context.read<HomeBloc>().add(const LoadHomeData(levelId: 'lvl_1'));
          },
        ),
        LevelButtonWidget(
          level: HomeStrings.lvl2,
          isSelected: currentLevel == 'lvl_2',
          function: () {
            context.read<HomeBloc>().add(const LoadHomeData(levelId: 'lvl_2'));
          },
        ),
        LevelButtonWidget(
          level: HomeStrings.lvl3,
          isSelected: currentLevel == 'lvl_3',
          function: () {
            context.read<HomeBloc>().add(const LoadHomeData(levelId: 'lvl_3'));
          },
        ),
      ],
    );
  }
}
