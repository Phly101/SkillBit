import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/widgets/transition_screen_widget.dart';
import 'package:skill_bit/features/onboarding/presentation/Bloc/onboarding_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/app_state/app_state_notifier.dart';
import '../../../../core/utils/global/assets.dart';
import '../../../../core/constants/onboarding_strings.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (final BuildContext context, final OnboardingState state) {
          if (state is OnboardingSuccess) {
            context.read<AppStateNotifier>().setOnboarded();
          }
        },
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: PageView(
                controller: _controller,
                children: <Widget>[
                  TransitionScreenWidget(
                    assetUrl: Assets.animation('coding.json'),
                    screenTitle: OnboardingStrings.screen1Title,
                    description: OnboardingStrings.screen1Description,
                    buttonText: OnboardingStrings.buttonText1,
                    function: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  TransitionScreenWidget(
                    assetUrl: Assets.animation('Developer.json'),
                    screenTitle: OnboardingStrings.screen2Title,
                    description: OnboardingStrings.screen2Description,
                    buttonText: OnboardingStrings.buttonText2,
                    function: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  //Todo: do something about the lag
                  TransitionScreenWidget(
                    assetUrl: Assets.animation('podium_winners.json'),
                    screenTitle: OnboardingStrings.screen3Title,
                    description: OnboardingStrings.screen3Description,
                    buttonText: OnboardingStrings.buttonText2,
                    function: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  TransitionScreenWidget(
                    assetUrl: Assets.animation('Awards.json'),
                    screenTitle: OnboardingStrings.screen4Title,
                    description: OnboardingStrings.screen4Description,
                    buttonText: OnboardingStrings.buttonText2,
                    function: () {
                      context.read<OnboardingBloc>().add(
                        const CompleteOnboardingPressed(),
                      );
                    },
                  ),
                ],
              ),
            ),

            Container(
              alignment: const Alignment(0, 0.65),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: const JumpingDotEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  jumpScale: .7,
                  verticalOffset: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
