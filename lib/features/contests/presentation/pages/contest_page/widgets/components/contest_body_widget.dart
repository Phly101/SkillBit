import 'package:flutter/material.dart';

import '../../../../../../../core/utils/global/box_state_switcher.dart';
import '../../../../Bloc/contest_bloc.dart';
import 'contest_error_widget.dart';
import 'contest_loading_widget.dart';
import 'contest_success_widget.dart';

class ContestBodyWidget extends StatelessWidget {
  const ContestBodyWidget({
    super.key,
    required this.contestId,
    required this.pageController,
    required this.onTick,
    required this.onSubmit,
  });

  final String contestId;
  final PageController pageController;
  final ValueChanged<Duration> onTick;

  final void Function(BuildContext context, ContestStartSuccess state) onSubmit;

  @override
  Widget build(final BuildContext context) {
    return BoxStateSwitcher<ContestBloc, ContestState>(
      buildWhen: _buildWhen,
      onInitial: (_, final _) => const ContestLoadingWidget(),
      loadingWidget: const ContestLoadingWidget(),
      onError:
          (
            final String message,
            final BuildContext context,
            final ContestState state,
          ) => ContestErrorWidget(message: message),
      onSuccess: (final BuildContext context, final ContestState state) {
        if (state is! ContestStartSuccess) {
          return const SizedBox.shrink();
        }

        return ContestSuccessWidget(
          contestState: state,
          pageController: pageController,
          onTick: onTick,
          onSubmit: () => onSubmit(context, state),
        );
      },
    );
  }

  bool _buildWhen(final ContestState previous, final ContestState current) {
    return current is ContestStartLoading ||
        current is ContestStartSuccess ||
        current is ContestStartError ||
        current is ContestSubmitLoading;
  }
}
