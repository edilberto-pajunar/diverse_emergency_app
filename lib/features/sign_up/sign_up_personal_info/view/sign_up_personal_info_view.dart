import 'package:emergency_test/features/sign_up/sign_up_home_address/view/sign_up_home_address_page.dart';
import 'package:emergency_test/features/sign_up/widget/layout_body.dart';
import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPersonalInfoView extends StatelessWidget {
  const SignUpPersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstName = TextEditingController();
    final TextEditingController lastName = TextEditingController();
    final TextEditingController middleName = TextEditingController();
    final GlobalKey<FormState> formkey = GlobalKey();

    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: LayoutBody(
          children: [
            Text(
              "Sign Up - Personal Info",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
              "This is an Emergency App. To be able to help minimize risks and threats or help save lives and properties, please MAKE SURE to provide accurate details about yourself. Please DO NOT enter any false information.\n\nAny false or wrong information given will automatically render this application VOID and INVALID.",
            ),
            const SizedBox(height: 24.0),
            PrimaryTextField(
              hintText: "First Name",
              controller: firstName,
              validator: (val) {
                if (val!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
            ),
            PrimaryTextField(
              hintText: "Middle Name",
              controller: middleName,
            ),
            PrimaryTextField(
              hintText: "Last Name",
              controller: lastName,
              validator: (val) {
                if (val!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
            ),
            PrimaryTextField(
              hintText: "Birthday",
              controller: firstName,
              readOnly: true,
              validator: (val) {
                if (val!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
            ),
            PrimaryTextField(
              hintText: "Gender",
              controller: firstName,
              readOnly: true,
              validator: (val) {
                if (val!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    child: const Text("CANCEL"),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(SignUpHomeAddressPage.route);
                    },
                    child: const Text("NEXT"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
