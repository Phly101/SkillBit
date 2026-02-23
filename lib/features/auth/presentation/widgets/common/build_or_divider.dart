import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class BuildOrDivider extends StatelessWidget {
  const BuildOrDivider({super.key});

  @override
  Widget build(final BuildContext context) {
    return   const Row(
        children: <Widget>[
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'or',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: AppColors.mainGrey,
              ),
            ),
          ),
          Expanded(child: Divider()),
        ]);
  }
}
