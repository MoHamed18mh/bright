import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/contact/presentation/widgets/contact_text_form_field_widget.dart';
import 'package:flutter/material.dart';

class CustomContactForm extends StatelessWidget {
  const CustomContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
        child: Column(
          children: [
            // ************** name field
            ContactTextFormFieldWidget(text: AppStrings.name),
            const SizedBox(height: AppSpace.smallSpace),

            // ************** email field
            ContactTextFormFieldWidget(text: AppStrings.email),
            const SizedBox(height: AppSpace.smallSpace),

            // *************** subject field
            ContactTextFormFieldWidget(text: AppStrings.subject),
            const SizedBox(height: AppSpace.smallSpace),

            // **************** message field
            ContactTextFormFieldWidget(
              text: AppStrings.message,
              maxLines: 5,
            ),
            const SizedBox(height: AppSpace.meduimSpace1),

            // ***************** button
            MaterialButtonWidget(onPressed: () {}, text: AppStrings.send),
          ],
        ),
      ),
    );
  }
}
