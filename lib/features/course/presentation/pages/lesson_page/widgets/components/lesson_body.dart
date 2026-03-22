import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/global/expandable_text_state.dart';

import '../../../../../../../core/utils/global/assets.dart';

class LessonBody extends StatelessWidget {
  const LessonBody({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.courseId,
  });

  final String imageUrl;
  final String description;
  final String courseId;

  @override
  Widget build(final BuildContext context) {
    return Hero(
      tag: courseId,
      child: Column(
        children: <Widget>[
          // course image
          Container(
            width: double.infinity,
            height: MediaQuery.heightOf(context) * 0.35,
            decoration: BoxDecoration(
              borderRadius: .circular(12),
              image: DecorationImage(
                image: AssetImage(Assets.imageCourse(imageUrl)),
                fit: .fill,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // course description
          ExpandableText(text: description),
        ],
      ),
    );
  }
}
