import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';
import 'package:skill_bit/features/profile/presentation/pages/contact_us%20page/widget/banner_item.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../../../../../../core/constants/contact_us_strings.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/assets.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      child: Padding(
        padding: const .only(top: 10),
        child: Column(
          mainAxisAlignment: .start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const .only(
                  topLeft: .circular(8),
                  topRight: .circular(8),
                ),
                image: DecorationImage(
                  fit: .cover,
                  opacity: 0.2,
                  image: Svg(Assets.image('wave3.svg')),
                ),
                gradient: RadialGradient(
                  focal: .topRight,
                  radius: 4,
                  focalRadius: 0.4,
                  colors: <Color>[
                    context.colorScheme.secondary,
                    const Color(0xff3A418E),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  ContactUsStrings.title,
                  style: context.textTheme.displayLarge!.copyWith(
                    fontSize: 22,
                    color: context.colorScheme.surface,
                  ),
                ).pNum(10),
              ),
            ),
            15.heightBox,
            const BannerItem(
              icon: Icons.mail,
              iconColor: Colors.deepPurpleAccent,
              link: ContactUsStrings.email,
            ),
            Divider(color: context.colorScheme.outline),
            const BannerItem(
              icon: Icons.language_outlined,
              iconColor: Colors.blue,
              link: ContactUsStrings.website,
            ),
            20.heightBox,
          ],
        ).pH(10),
      ),
    );
  }
}
