import 'package:flutter/material.dart';

import '../theme/theme.dart';

class NavigationButtonFactory {
  NavigationButtonFactory._();

  static List<Widget> buildNavigationButtons({
    required final BuildContext context,
    required final void Function()? backFunction,
    required final void Function()? forwardFunction,
    required final void Function()? submitFunction,
    required final void Function()? goHomeFunction,
    required final String forwardButtonTxt,
    required final String backButtonTxt,
    required final String submitButtonTxt,
    required final String goHomeButtonTxt,
    required final bool isViewingAnswers,
    required final bool isFinalPage,
  }) {
    if (isViewingAnswers) {
      return <Widget>[
        // back button
        _myButton(
          backButtonTxt,
          backFunction,
          context,
          color: context.colorScheme.tertiary,
        ),
        const SizedBox(width: 20,),
        _myButton(goHomeButtonTxt, goHomeFunction, context),
      ];
    }

    return <Widget>[
      // back button
      _myButton(
        backButtonTxt,
        backFunction,
        context,
        color: context.colorScheme.tertiary,
      ),
      const SizedBox(width: 20,),
      // forward button + submit button
      _myButton(
        isFinalPage ? submitButtonTxt : forwardButtonTxt,
        isFinalPage ? submitFunction : forwardFunction,
        context,
        // color: isFinalPage ? context.colorScheme.tertiary : null,
      ),
    ];
  }

  static Widget _myButton(
    final String text,
    final VoidCallback? onPressed,
    final BuildContext context, {
    final Color? color,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(text, style: context.textTheme.displayMedium),
      ),
    );
  }
}
