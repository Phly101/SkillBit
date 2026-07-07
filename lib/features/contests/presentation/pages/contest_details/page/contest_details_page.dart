import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import '../../../../../../core/widgets/contest/contest_details_skeleton.dart';
import '../../../Bloc/contest_bloc.dart';
import '../widgets/components/contest_details_body.dart';

class ContestDetailsPage extends StatelessWidget {
  const ContestDetailsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<ContestBloc>(
      create: (final BuildContext context) =>
          sl<ContestBloc>()..add(const ContestDetailsRequested()),
      child: BoxStateSwitcher<ContestBloc, ContestState>(
        buildWhen: (final ContestState previous, final ContestState current) =>
            current is ContestDetailsLoading ||
            current is ContestDetailsSuccess ||
            current is ContestDetailsError,
        onInitial: (final BuildContext context, final ContestState state) =>
            const Center(child: CircularProgressIndicator()),
        loadingWidget: const ContestDetailsBodySkeleton(),
        onError:
            (
              final String message,
              final BuildContext context,
              final ContestState state,
            ) => ErrorStateWidget(
              message: message,
              reFreshFunction: () => context.read<ContestBloc>().add(
                const ContestDetailsRequested(),
              ),
            ),
        onSuccess: (final BuildContext context, final ContestState state) {
          if (state is ContestDetailsSuccess) {
            return ContestDetailsBody(
              contestId: state.contestDetails.id,
              contestDate: state.contestDetails.startingDate,
              difficulty: state.contestDetails.difficulty,
            ).pH(10);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
