import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/personal_info.dart/personal_info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoPage extends StatelessWidget {
  static String route = "/personal_info_page_route";
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<AppBloc>(),
      child: const PersonalInfoView(),
    );
  }
}
