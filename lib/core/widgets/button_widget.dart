import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.child,
    this.color,
    this.padding,
    this.function,
  });

  final Widget? child;
  final Color? color;
  final double? padding;
  final void Function()? function;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: //Todo: Implement Function logic
          function,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.mainGrey.withValues(alpha: 0.8),
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 10.0),
          child: Center(
            child: child ?? const SizedBox(child: Text('no widget')),
          ),
        ),
      ),
    );
  }
}
