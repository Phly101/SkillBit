import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/features/search/presentation/bloc/search_friends_bloc/search_friends_bloc.dart';
import '../../../../../../../core/theme/theme.dart';
import '../../../../../../../core/widgets/search_field_widget.dart';
import '../../../../../../search/domain/entities/search_friends_entity.dart';
import '../common/friend_list_card.dart';

class FriendsBody extends StatefulWidget {
  const FriendsBody({
    super.key,
    required this.friendsList,
    required this.isLoading,
    this.errorMessage,
  });

  final bool isLoading;

  final String? errorMessage;
  final List<SearchFriendsEntity>? friendsList;

  @override
  State<FriendsBody> createState() => _FriendsBodyState();
}

class _FriendsBodyState extends State<FriendsBody> {
  final TextEditingController _controller = .new();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final SearchFriendsBloc friendsBloc = context.read<SearchFriendsBloc>();
    Widget content;
    if (widget.isLoading) {
      content = const Center(child: CircularProgressIndicator());
    } else if (widget.errorMessage != null) {
      content = Center(child: Text(widget.errorMessage!));
    } else if (widget.friendsList == null || widget.friendsList!.isEmpty) {
      content = const Center(child: Text('No friends found.'));
    } else {
      content = ListView.builder(
        itemCount: widget.friendsList!.length,
        itemBuilder: (final BuildContext context, final int index) {
          final SearchFriendsEntity friend = widget.friendsList![index];
          return FriendListCard(
            name: friend.name,
            points: friend.scorePoints,
            progress: friend.progress,
            profileUrl: friend.profileUrl,
          ).pNum(10);
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        SearchFieldWidget(
          controller: _controller,
          width: MediaQuery.sizeOf(context).width * 0.95,
          onChanged: (final String value) {
            friendsBloc.add(SearchFriendsUpdated(value));
          },
          function: () {
            _controller.clear();
            friendsBloc.add(SearchFriendsCleared());
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Your Circle (${widget.friendsList?.length ?? 0})',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Expanded(child: content),
      ],
    );
  }
}
