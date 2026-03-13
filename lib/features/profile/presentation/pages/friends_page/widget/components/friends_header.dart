import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/search_field_widget.dart';

class FriendsHeader extends StatelessWidget {
  const FriendsHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: <Widget>[
            IconButton(
              onPressed: //Todo: Implement Function logic
              () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                fontWeight: .bold,
                size: 30,
                color: context.colorScheme.onSurface,
              ),
            ),
            Align(
              alignment: .center,
              child: Text(
                'My Learning Circle',
                style: context.textTheme.displayLarge,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SearchFieldWidget(width: MediaQuery.sizeOf(context).width * 0.8),
        const SizedBox(height: 16),
      ],
    );
  }
}
