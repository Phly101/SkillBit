import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/user/avatar_widget.dart';
import 'package:skill_bit/core/widgets/global/button_widget.dart';

import '../../../../../core/widgets/global/search_field_widget.dart';
import '../../../../search/presentation/bloc/search_course_bloc/search_course_bloc.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({
    super.key,
    required this.name,
    required this.onTap,
    required this.profileUrl,
  });

  final String profileUrl;
  final String name;
  final void Function() onTap;

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  final TextEditingController _controller = .new();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final SearchCourseBloc courseBloc = context.read<SearchCourseBloc>();
    return Column(
      children: <Widget>[
        Align(
          alignment: const Alignment(-0.98, 0),
          child: Text(
            HomeStrings.greeting(widget.name),
            style: context.textTheme.displayLarge,
          ),
        ),
        10.heightBox,
        Row(
          children: <Widget>[
            InkWell(
              onTap: widget.onTap,
              child: Text(
                HomeStrings.assessmentExam,
                style: context.textTheme.displayMedium!.copyWith(
                  color: context.colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Spacer(),
            AvatarWidget(profileUrl: widget.profileUrl),
          ],
        ),
        30.heightBox,
        Row(
          mainAxisAlignment: .spaceBetween,
          children: <Widget>[
            SearchFieldWidget(
              controller: _controller,
              width: MediaQuery.sizeOf(context).width * 0.8,
              onChanged: (final String value) {
                courseBloc.add(SearchCourseUpdated(value));
              },
              function: () {
                _controller.clear();
                courseBloc.add(SearchCourseCleared());
              },
            ),
            ButtonWidget(
              function:
              () {
                context.go(AppRoutes.notifications);
              },
              child: Icon(
                Icons.notifications,
                color: context.colorScheme.secondary,
                size: 35,
              ),
            ),
          ],
        ),
        25.heightBox,

        // Align(
        //   alignment: const Alignment(-0.98, 0),
        //   child: Text(
        //     HomeStrings.explore,
        //     style: context.textTheme.displayMedium!.copyWith(
        //       fontSize: 18,
        //       color: context.colorScheme.onSurface,
        //     ),
        //   ),
        // ),
        15.heightBox,
      ],
    );
  }
}
