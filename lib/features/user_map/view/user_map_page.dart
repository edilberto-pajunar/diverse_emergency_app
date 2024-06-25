import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:emergency_test/features/user_map/bloc/map_bloc.dart';
import 'package:emergency_test/features/user_map/view/user_map_view.dart';
import 'package:emergency_test/repository/place_repository.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserMapPage extends StatelessWidget {
  static String route = "user_map_page_route";

  const UserMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapBloc(
            placeRepository: context.read<PlaceRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserActivitiesBloc(
            userRepository: context.read<UserRepository>(),
          ),
        ),
      ],
      child: const UserMapView(),
    );
  }
}
