import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/home_strings.dart';
import '../../Bloc/home_bloc.dart';
import 'level_button_widget.dart';

class LevelRowWidget extends StatelessWidget {
  const LevelRowWidget({super.key, required this.currentLevel});

  final int currentLevel;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LevelButtonWidget(
          level: HomeStrings.lvl1,
          isSelected: currentLevel == 1,
          function: () {
            context.read<HomeBloc>().add(const GetHomeData(levelId: 1));
          },
        ),
        LevelButtonWidget(
          level: HomeStrings.lvl2,
          isSelected: currentLevel == 2,
          function: () {
            context.read<HomeBloc>().add(const GetHomeData(levelId: 2));
          },
        ),
        LevelButtonWidget(
          level: HomeStrings.lvl3,
          isSelected: currentLevel == 3,
          function: () {
            context.read<HomeBloc>().add(const GetHomeData(levelId: 3));
          },
        ),
      ],
    );
  }
}
