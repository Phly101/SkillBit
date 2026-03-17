import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';

import '../../../../../utils/global/assets.dart';

class ParticipantsTile extends StatelessWidget {
  const ParticipantsTile({super.key, this.numOfParticipants = 0});

  final int? numOfParticipants;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      child: ListTile(
        leading: Image.asset(Assets.icon('Group.png')),
        title: Align(
          alignment: .centerLeft,
          child: Text('Contestants', style: context.textTheme.displayMedium!.copyWith(
            color: Colors.black
          )),
        ),
        trailing: Text(
          numOfParticipants.toString(),
          style: context.textTheme.displayMedium!.copyWith(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
