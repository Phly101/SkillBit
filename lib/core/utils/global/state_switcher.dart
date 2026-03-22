import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';

class StateSwitcher<B extends StateStreamable<S>, S> extends StatelessWidget {
  const StateSwitcher({
    super.key,
    required this.onSuccess,
    this.onInitial,
    this.loadingWidget,
    this.onError,
    this.buildWhen,
  });

  final Widget Function(BuildContext context, S state) onSuccess;
  final Widget Function(BuildContext context, S state)? onInitial;
  final bool Function(S previous, S current)? buildWhen;
  final Widget? loadingWidget;
  final Widget Function(String message, BuildContext context, S state)? onError;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: buildWhen,
      builder: (final BuildContext context, final S state) {
        if (state is LoadingState) {
          return loadingWidget ??
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
        }
        if (state is ErrorState) {
          final dynamic errorState = state;
          final String message = errorState.message ?? 'An error occurred';
          return onError?.call(message, context, errorState) ??
              Center(child: Text(message));
        }
        if (state is SuccessState) {
          return onSuccess(context, state);
        }
        return onInitial?.call(context, state) ??
            const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
