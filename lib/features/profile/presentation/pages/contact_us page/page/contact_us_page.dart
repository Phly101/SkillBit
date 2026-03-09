import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/about_us_strings.dart';
import 'package:skill_bit/core/constants/contact_us_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/presentation/pages/contact_us%20page/widget/banner_widget.dart';
import 'package:skill_bit/features/profile/presentation/pages/contact_us%20page/widget/team_tile_widget.dart';

import '../../../../../../core/utils/assets.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ContactUsStrings.contactUs,
          style: context.textTheme.displayLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            fontWeight: FontWeight.bold,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            10.heightBox,
            const BannerWidget(),
            10.heightBox,
            Divider(color: context.colorScheme.outline.withValues(alpha: 0.5)),
            Text(
              ContactUsStrings.ourExperts,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: .bold,
                fontSize: 20,
                color: const Color(0xff3A418E),
              ),
            ),
            10.heightBox,
            // Basel
            TeamTileWidget(
              profileUrl: Assets.image('basel_image.jfif'),
              tag: 'basel_tag',
              name: ContactUsStrings.teamNames['Basel']!,
              role: ContactUsStrings.roles['Basel']!,
              githubLink: ContactUsStrings.teamGitHubs['Basel']!,
              linkedInLink: ContactUsStrings.teamLinked['Basel']!,
              emailLink: ContactUsStrings.teamEmails['Basel']!,
              detailedName: AboutUsStrings.teamNames['Basel']!,
              detailedRole: AboutUsStrings.roles['Basel']!,
              about: AboutUsStrings.aboutMembers['Basel']!,
              advice: AboutUsStrings.adviceMember['Basel']!,
            ),
            // Hagar
            TeamTileWidget(
              profileUrl: Assets.image('hagar_image.jpeg'),
              tag: 'Hagar_tag',
              name: ContactUsStrings.teamNames['Hagar']!,
              role: ContactUsStrings.roles['Hagar']!,
              githubLink: ContactUsStrings.teamGitHubs['Hagar']!,
              linkedInLink: ContactUsStrings.teamLinked['Hagar']!,
              emailLink: ContactUsStrings.teamEmails['Hagar']!,
              detailedName: AboutUsStrings.teamNames['Hagar']!,
              detailedRole: AboutUsStrings.roles['Hagar']!,
              about: AboutUsStrings.aboutMembers['Hagar']!,
              advice: AboutUsStrings.adviceMember['Hagar']!,
            ),
            //Ahmed
            TeamTileWidget(
              profileUrl: Assets.image('ahmed_image.jfif'),
              tag: 'Ahmed_tag',
              name: ContactUsStrings.teamNames['Ahmed']!,
              role: ContactUsStrings.roles['Ahmed']!,
              githubLink: ContactUsStrings.teamGitHubs['Ahmed']!,
              linkedInLink: ContactUsStrings.teamLinked['Ahmed']!,
              emailLink: ContactUsStrings.teamEmails['Ahmed']!,
              detailedName: AboutUsStrings.teamNames['Ahmed']!,
              detailedRole: AboutUsStrings.roles['Ahmed']!,
              about: AboutUsStrings.aboutMembers['Ahmed']!,
              advice: AboutUsStrings.adviceMember['Ahmed']!,
            ),
            // Menna
            TeamTileWidget(
              profileUrl: Assets.image('Menna_image.jpeg'),
              tag: 'Menna_tag',
              name: ContactUsStrings.teamNames['Menna']!,
              role: ContactUsStrings.roles['Menna']!,
              githubLink: ContactUsStrings.teamGitHubs['Menna']!,
              linkedInLink: ContactUsStrings.teamLinked['Menna']!,
              emailLink: ContactUsStrings.teamEmails['Menna']!,
              detailedName: AboutUsStrings.teamNames['Menna']!,
              detailedRole: AboutUsStrings.roles['Menna']!,
              about: AboutUsStrings.aboutMembers['Menna']!,
              advice: AboutUsStrings.adviceMember['Menna']!,
            ),
          ],
        ).pH(10),
      ),
    );
  }
}
