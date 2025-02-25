import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/home/models/about_model.dart';
import 'package:bright/features/home/presentation/widgets/service_widget.dart';
import 'package:flutter/material.dart';

class CustomService extends StatelessWidget {
  const CustomService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppSpace.size4,
        mainAxisExtent: AppSpace.size3,
      ),
      itemBuilder: (context, index) {
        String title = aboutServices.keys.elementAt(index);
        AboutModel aboutModel = aboutServices[title]!;

        return ServiceWidget(title: title, aboutModel: aboutModel);
      },
      itemCount: aboutServices.length,
    );
  }
}
