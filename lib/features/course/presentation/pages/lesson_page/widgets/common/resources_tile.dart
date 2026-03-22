import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/features/course/domain/entities/enums/resource_type.dart';

import '../../../../../../../core/utils/global/assets.dart';

class ResourcesTile extends StatelessWidget {
  const ResourcesTile({super.key, required this.type, required this.function});

  final ResourceType type;
  final void Function()? function;

  @override
  Widget build(final BuildContext context) {
    final bool isYouTube = type == ResourceType.youTube;

    return GestureDetector(
      onTap: function,
      child: ShadowContainer(
        borderRadius: 12,
        color: isYouTube ? context.colorScheme.error : AppColors.mainBlue,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: isYouTube
                    ? const FaIcon(FontAwesomeIcons.youtube, color: Colors.white, size: 28)
                    : SvgPicture.asset(
                  Assets.image('web_icon.svg'),
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  width: 30,
                ),
              ),

              Text(
                isYouTube ? 'Watch Now!' : 'Visit Web Site!',
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
