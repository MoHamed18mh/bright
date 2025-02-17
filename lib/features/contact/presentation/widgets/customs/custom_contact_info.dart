import 'package:bright/features/contact/models/contact_model.dart';
import 'package:bright/features/contact/presentation/widgets/contact_item_widget.dart';
import 'package:flutter/material.dart';

class CustomContactInfo extends StatelessWidget {
  const CustomContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: contactModelMap.length,
      itemBuilder: (context, index) {
        String title = contactModelMap.keys.elementAt(index);
        ContactModel contactModel = contactModelMap[title]!;

        return ContactInfoItemWidget(title: title, contactModel: contactModel);
      },
    );
  }
}
