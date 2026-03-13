import 'package:flutter/material.dart';
import 'package:skill_bit/features/profile/domain/entities/friends_entity.dart';
import '../../../../../../../core/theme/theme.dart';
import '../../../../../../../core/widgets/search_field_widget.dart';
import '../common/friend_list_card.dart';

class FriendsBody extends StatelessWidget {
  const FriendsBody({super.key, required this.friendsList});

  final List<FriendsEntity> friendsList;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        // search bar
        SearchFieldWidget(width: MediaQuery.sizeOf(context).width * 0.95),
        const SizedBox(height: 16),
        // The Count indicator
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Your Circle (${friendsList.length})',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        // The Scrollable List
        Expanded(
          child: ListView.builder(
            itemCount: friendsList.length,
            itemBuilder: (final BuildContext context, final int index) {
              final FriendsEntity friend = friendsList[index];

              return FriendListCard(
                name: friend.name ?? 'user',
                points: friend.scorePoints ?? 0,
                progress: friend.progress ?? 0,
                profileUrl: friend.profileUrl ?? '',
              ).pNum(10);
            },
          ),
        ),
      ],
    );
  }
}
