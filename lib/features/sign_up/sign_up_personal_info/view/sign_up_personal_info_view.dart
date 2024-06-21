import 'package:emergency_test/features/sign_up/bloc/signup_bloc.dart';
import 'package:emergency_test/features/sign_up/sign_up_home_address/view/sign_up_home_address_page.dart';
import 'package:emergency_test/features/sign_up/widget/layout_body.dart';
import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPersonalInfoView extends StatelessWidget {
  const SignUpPersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
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
            BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return Column(
                  children: [
                    PrimaryTextField(
                      hintText: "First Name",
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      initialValue: state.firstName,
                      onChanged: (val) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpPersonalInfoSubmitted(
                              firstName: val,
                            ));
                      },
                    ),
                    PrimaryTextField(
                      hintText: "Middle Name",
                      initialValue: state.middleName,
                      onChanged: (val) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpPersonalInfoSubmitted(
                              middleName: val,
                            ));
                      },
                    ),
                    PrimaryTextField(
                      hintText: "Last Name",
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      initialValue: state.lastName,
                      onChanged: (val) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpPersonalInfoSubmitted(
                              lastName: val,
                            ));
                      },
                    ),
                  ],
                );
              },
            ),
            BlocSelector<SignUpBloc, SignUpState, String?>(
              selector: (state) => state.birthday,
              builder: (context, birthday) {
                return PrimaryTextField(
                  hintText: "Birthday",
                  readOnly: true,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  controller: TextEditingController(text: birthday ?? ""),
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      firstDate: DateTime(1800),
                      initialDate: DateTime.now(),
                      lastDate: DateTime.now(),
                    ).then((val) {
                      context.read<SignUpBloc>().add(SignUpBirthdaySubmitted(
                            birthday: val!,
                          ));
                    });
                  },
                );
              },
            ),
            BlocSelector<SignUpBloc, SignUpState, String?>(
              selector: (state) => state.gender,
              builder: (context, gender) {
                return PrimaryTextField(
                  hintText: "Gender",
                  readOnly: true,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  controller: TextEditingController(text: gender ?? ""),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.male),
                              title: const Text('Male'),
                              onTap: () => context
                                ..read<SignUpBloc>().add(
                                    const SignUpGenderSubmitted(gender: "Male"))
                                ..pop(),
                            ),
                            ListTile(
                              leading: const Icon(Icons.female),
                              title: const Text('Female'),
                              onTap: () => context
                                ..read<SignUpBloc>().add(
                                    const SignUpGenderSubmitted(
                                        gender: "Female"))
                                ..pop(),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
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
                      if (formkey.currentState!.validate()) {
                        context.pushNamed(SignUpHomeAddressPage.route, extra: {
                          "signUpBloc": context.read<SignUpBloc>(),
                        });
                      }
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
