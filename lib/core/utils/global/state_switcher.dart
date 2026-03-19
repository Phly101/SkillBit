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
  });

  final Widget Function(BuildContext context, S state) onSuccess;
  final Widget Function(BuildContext context, S state)? onInitial;
  final Widget? loadingWidget;
  final Widget Function(String message)? onError;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<B, S>(
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
          return onError?.call(message) ?? Center(child: Text(message));
        }
        if (state is SuccessState) {
          return onSuccess(context, state);
        }
        return onInitial?.call(context, state) ?? const  SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
