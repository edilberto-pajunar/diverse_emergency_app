import 'package:auto_route/annotations.dart';
import 'package:emergency_test/features/user_map/bloc/map_bloc.dart';
import 'package:emergency_test/features/user_map/view/user_map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UserMapPage extends StatelessWidget {
  const UserMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(),
      child: const UserMapView(),
    );
  }
}
