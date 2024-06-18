import 'package:emergency_test/features/add_contact/view/add_contact_view.dart';
import 'package:flutter/material.dart';

class AddContactPage extends StatelessWidget {
  static String route = "/add_contact_page_route";
  const AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddContactView();
  }
}
