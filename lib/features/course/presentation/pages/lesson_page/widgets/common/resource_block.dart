import 'package:flutter/material.dart';
import 'package:skill_bit/core/utils/global/launch_external_url.dart';
import 'package:skill_bit/features/course/domain/entities/resource_entity.dart';
import 'package:skill_bit/features/course/presentation/pages/lesson_page/widgets/common/resources_tile.dart';

class ResourceBlock extends StatelessWidget {
  const ResourceBlock({
    super.key,
    required this.resourceList,

  });

  final List<MaterialEntity>? resourceList;


  @override
  Widget build(final BuildContext context) {
    return Column(
      children:
          resourceList?.map((final MaterialEntity resourceItem) {
            return ResourcesTile(
              function: () {
              LaunchExternalUrl.launchExternalUrl(Uri.parse(resourceItem.url));
              },
            );
          }).toList() ??
          <Widget>[],
    );
  }
}
