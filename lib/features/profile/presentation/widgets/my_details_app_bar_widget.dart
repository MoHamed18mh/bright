import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class MyDetailsAppBarWidget extends StatelessWidget {
  const MyDetailsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const BackButtonWidget(),
      actions: [
        IconButton(
          onPressed: () => navigate(context, RouteKey.profileEditView),
          icon: Icon(
            Icons.edit,
            color: AppColors.primaryColor,
            size: 30,
          ),
        )
      ],
    );
  }
}
