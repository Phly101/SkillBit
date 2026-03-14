import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.width,
    required this.onChanged,
    required this.function,
    required this.controller,
  });

  final double width;
  final ValueChanged<String> onChanged;
  final void Function()? function;
  final TextEditingController controller;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: width,
      child: SearchBar(
        controller: controller,
        onChanged: onChanged,
        elevation: WidgetStateProperty.all(0),
        side: WidgetStateProperty.all(
          BorderSide(
            color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
            width: 1,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: context.colorScheme.outline.withValues(alpha: 0.8),
            size: 24,
          ),
        ),
        hintText: HomeStrings.search,
        trailing: <Widget>[
          IconButton(
            onPressed: function,
            icon: const FaIcon(FontAwesomeIcons.xmark),
          ),
        ],
      ),
    );
  }
}
