import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController username = TextEditingController();
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Information",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: state.currentUserInfo!.user.email,
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: state.currentUserInfo!.username.isEmpty
                        ? "username"
                        : state.currentUserInfo!.username,
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
