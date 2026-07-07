import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';

import '../../../../../../../core/utils/global/assets.dart';

class ResourcesTile extends StatelessWidget {
  const ResourcesTile({super.key,  required this.function});


  final void Function()? function;

  @override
  Widget build(final BuildContext context) {


    return GestureDetector(
      onTap: function,
      child: ShadowContainer(
        borderRadius: 12,
        color: AppColors.mainBlue,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  Assets.image('web_icon.svg'),
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  width: 30,
                ),
              ),

              Text(
                'Learn now!',
                style: context.textTheme.displayMedium?.copyWith(color: Colors.white),
              ),

              const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
              ),
            ],
          ),
        ),
      ).pV(10),
    );
  }
}
