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
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
        child: Column(
          children: [
            //  name 
            const ContactTextFormFieldWidget(text: AppStrings.name),
            const SizedBox(height: AppSpace.small2),

            //  email 
            const ContactTextFormFieldWidget(text: AppStrings.email),
            const SizedBox(height: AppSpace.small2),

            //  subject 
            const ContactTextFormFieldWidget(text: AppStrings.subject),
            const SizedBox(height: AppSpace.small2),

            //  message 
            const ContactTextFormFieldWidget(
              text: AppStrings.message,
              maxLines: 5,
            ),
            const SizedBox(height: AppSpace.meduim1),

            //  send button
            MaterialButtonWidget(onPressed: () {}, text: AppStrings.send),
          ],
        ),
      ),
    );
  }
}
