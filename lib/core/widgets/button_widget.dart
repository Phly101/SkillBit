import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../theme/theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.child,
    this.color,
    this.paddingR,
    this.function,
    this.radius,
    this.hasBorder = false,
    this.paddingL,
    this.paddingT,
    this.paddingB,
    this.padding,
  });

  final Widget? child;
  final Color? color;
  final double? paddingR;
  final double? paddingL;
  final double? paddingT;
  final double? paddingB;
  final double? radius;
  final void Function()? function;
  final bool hasBorder;
  final double? padding;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: //Todo: Implement Function logic
          function,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 8),
          border: hasBorder
              ? Border.all(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.4),
                  width: 1,
                )
              : Border.all(color: context.colorScheme.surface, width: 0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.mainGrey.withValues(alpha: 0.8),
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: padding == null
              ? EdgeInsets.only(
                  left: paddingL ?? 10,
                  right: paddingR ?? 10,
                  bottom: paddingB ?? 10,
                  top: paddingT ?? 10,
                )
              : EdgeInsets.all(padding!),

          child: Center(
            child: child ?? const SizedBox(child: Text('no widget')),
          ),
        ),
      ),
    );
  }
}
