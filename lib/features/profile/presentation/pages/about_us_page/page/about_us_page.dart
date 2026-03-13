import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/about_us_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/gradiant_container.dart';
import 'package:skill_bit/features/profile/presentation/pages/about_us_page/widgets/member_card.dart';
import '../../../../../../core/utils/assets.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: //Todo: Implement Function logic
          () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Text(
          AboutUsStrings.aboutUs,
          style: context.textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: <Widget>[
          GradiantContainer(
            width: double.infinity,
            radius: 12,
            inverted: true,
            begin: .topLeft,
            end: .bottomRight,
            image: Assets.image('wave1.svg'),
            child: Center(
              child: Text(
                AboutUsStrings.title,
                style: context.textTheme.displayLarge!.copyWith(
                  color: context.colorScheme.surface,
                ),
              ).pNum(20),
            ),
          ),
          // basel
          MemberCard(
            profileUrl: 'basel_image.jfif',
            tag: 'basel-tag',
            name: AboutUsStrings.teamNames['Basel']!,
            role: AboutUsStrings.roles['Basel']!,
            bioPreview: AboutUsStrings.bioPreview['Basel']!,
            about: AboutUsStrings.aboutMembers['Basel']!,
            advice: AboutUsStrings.adviceMember['Basel']!,
          ).pV(30),
          // Hagar
          MemberCard(
            profileUrl: 'hagar_image.jpeg',
            tag: 'hagar-tag',
            name: AboutUsStrings.teamNames['Hagar']!,
            role: AboutUsStrings.roles['Hagar']!,
            bioPreview: AboutUsStrings.bioPreview['Hagar']!,
            about: AboutUsStrings.aboutMembers['Hagar']!,
            advice: AboutUsStrings.adviceMember['Hagar']!,
          ).pV(30),
          // ahmed
          MemberCard(
            profileUrl: 'ahmed_image.jfif',
            tag: 'ahmed-tag',
            name: AboutUsStrings.teamNames['Ahmed']!,
            role: AboutUsStrings.roles['Ahmed']!,
            bioPreview: AboutUsStrings.bioPreview['Ahmed']!,
            about: AboutUsStrings.aboutMembers['Ahmed']!,
            advice: AboutUsStrings.adviceMember['Ahmed']!,
          ).pV(30),
          // menna
          MemberCard(
            profileUrl: 'Menna_image.jpeg',
            tag: 'menna-tag',
            name: AboutUsStrings.teamNames['Menna']!,
            role: AboutUsStrings.roles['Menna']!,
            bioPreview: AboutUsStrings.bioPreview['Menna']!,
            about: AboutUsStrings.aboutMembers['Menna']!,
            advice: AboutUsStrings.adviceMember['Menna']!,
          ).pV(30),
        ],
      ).p10(),
    );
  }
}
