import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/sign_up/bloc/signup_bloc.dart';
import 'package:emergency_test/features/sign_up/sign_up_home_address/view/sign_up_home_address_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpHomeAddressPage extends StatelessWidget {
  static String route = "/home_address_page_route";
  const SignUpHomeAddressPage({
    required this.signUpBloc,
    super.key,
  });

  final SignUpBloc signUpBloc;

  @override
  Widget build(BuildContext context) {
    final address = context.read<AppBloc>().state.currentLocation;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<AppBloc>(),
        ),
        BlocProvider.value(
          value: signUpBloc
            ..add(
              SignUpHomeAddressRequested(
                country: address?.address!.split(",").last ?? "",
                address: address?.address! ?? "",
              ),
            ),
        ),
      ],
      child: const SignUpHomeAddressView(),
    );
  }
}
