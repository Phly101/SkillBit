import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/core/theme/theme.dart';

class PageProgress extends StatelessWidget {
  const PageProgress({
    super.key,
    required this.currentPageNum,
    required this.lastPageNum,
  });

  final int currentPageNum;
  final int lastPageNum;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: .centerLeft,
          child: Text(
            'Page $currentPageNum of $lastPageNum',
            style: context.textTheme.displayMedium!.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: .circular(8),
          child: LinearProgressIndicator(
            value: currentPageNum.toDouble() / lastPageNum.toDouble(),
            minHeight: 10,
            backgroundColor: const Color(0xffCFDBE8),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
          ),
        ),
      ],
    );
  }
}
