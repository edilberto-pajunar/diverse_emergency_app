import 'package:emergency_test/features/request/view/request_view.dart';
import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestPage extends StatelessWidget {
  static String route = "request_page_route";
  const RequestPage({
    required this.userActivitiesBloc,
    super.key,
  });

  final UserActivitiesBloc userActivitiesBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userActivitiesBloc,
      child: const RequestView(),
    );
  }
}
