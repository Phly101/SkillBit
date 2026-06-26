import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/settings_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import 'package:skill_bit/features/settings/presentation/Bloc/settings_bloc.dart';
import 'package:skill_bit/features/settings/presentation/widgets/component/settings_body.dart';

import '../../../../core/widgets/settings/settings_skeleton.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (final BuildContext context) =>
          sl<SettingsBloc>()..add(const SettingsDetailsRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            SettingsStrings.settings,
            style: context.textTheme.displayLarge,
          ),
          centerTitle: true,
          leading: ArrowBackButton(function: () => context.pop()),
        ),
        body: BlocListener<SettingsBloc, SettingsState>(
          listener: (final BuildContext context, final SettingsState state) {
            if (state is UploadImageError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is UploadImageSuccess) {
              context.read<SettingsBloc>().add(
                const SettingsDetailsRequested(),
              );
            }
          },

          child: BoxStateSwitcher<SettingsBloc, SettingsState>(
            onInitial:
                (final BuildContext context, final SettingsState state) =>
                    const Center(child: CircularProgressIndicator()),
            loadingWidget: const SettingsBodySkeleton(),
            onError:
                (
                  final String message,
                  final BuildContext context,
                  final SettingsState state,
                ) => ErrorStateWidget(
                  message: message,
                  reFreshFunction: () => context.read<SettingsBloc>().add(
                    const SettingsDetailsRequested(),
                  ),
                ),
            onSuccess: (final BuildContext context, final SettingsState state) {
              if (state is SettingSuccess) {
                return SettingsBody(settingsEntity: state.s);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
