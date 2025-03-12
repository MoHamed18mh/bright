import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:flutter/material.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        radius: AppSpace.max1,
        backgroundImage: (imageUrl == ApiKey.imageNull)
            ? const AssetImage(Assets.assetsImagesUser)
            : NetworkImage(imageUrl),
      ),
    );
  }
}
