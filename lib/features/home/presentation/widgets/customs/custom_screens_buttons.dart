import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/home/models/home_model.dart';
import 'package:bright/features/home/presentation/widgets/image_button_widget.dart';
import 'package:flutter/material.dart';

class CustomScreensButtons extends StatelessWidget {
  const CustomScreensButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppSpace.size1,
        mainAxisExtent: AppSpace.max4,
        crossAxisSpacing: AppSpace.small2,
        mainAxisSpacing: AppSpace.small2,
      ),
      itemBuilder: (context, index) {
        String title = buttonsData.keys.elementAt(index);
        ButtonModel buttonModel = buttonsData[title]!;

        return ImageButtonWidget(title: title, buttonModel: buttonModel);
      },
      itemCount: buttonsData.length,
    );
  }
}
