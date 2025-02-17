import 'package:flutter/material.dart';

class ContactModel {
  final String subTitle;
  final IconData iconData;

  ContactModel({required this.subTitle, required this.iconData});
}

Map<String, ContactModel> contactModelMap = {
  'office': ContactModel(
    subTitle: 'Tanta',
    iconData: Icons.place,
  ),
  'mobile': ContactModel(
    subTitle: '+012 34567 890',
    iconData: Icons.phone,
  ),
  'email': ContactModel(
    subTitle: 'info@example.com',
    iconData: Icons.email_rounded,
  ),
};
