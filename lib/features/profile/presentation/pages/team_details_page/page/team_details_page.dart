import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/about_us_strings.dart';
import 'package:skill_bit/core/widgets/avatar_widget.dart';
import 'package:skill_bit/features/profile/presentation/pages/team_details_page/widget/member_section_widget.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/image_utils.dart';
import '../../../../../../core/widgets/shadow_container.dart';

class TeamDetailsPage extends StatelessWidget {
  const TeamDetailsPage({
    super.key,
    required this.name,
    required this.role,
    required this.profileUrl,
    required this.about,
    required this.advice,
    required this.heroTag,
  });

  final String name;
  final String role;
  final String profileUrl;
  final String about;
  final String advice;
  final String heroTag;

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
        title: Text(name, style: context.textTheme.displayLarge),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black.withValues(alpha: 0.02),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  ImageUtils.showHeroPreview(
                    context: context,
                    profileUrl: profileUrl,
                    heroTag: heroTag,
                  );
                },
                child: Hero(
                  tag: heroTag,
                  child: ShadowContainer(
                    shape: BoxShape.circle,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                    margin: EdgeInsets.zero,
                    child: AvatarWidget(profileUrl: profileUrl, radius: 80),
                  ),
                ),
              ),
            ),
            24.heightBox,
            // name
            Text(
              name,
              style: context.textTheme.displayLarge!.copyWith(fontSize: 18),
            ),
            // role
            Text(
              role,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.primary,
                fontFamily: 'Poppins',
              ),
            ),
            32.heightBox,

            // About section
            MemberSectionWidget(
              title: AboutUsStrings.about,
              content: about,
              icon: Icons.error_outline,
              iconColor: Colors.blue,
            ),
            24.heightBox,
            // Advice section
            MemberSectionWidget(
              title: AboutUsStrings.advice,
              content: advice,
              icon: Icons.lightbulb_outline_rounded,
              iconColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
