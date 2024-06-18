import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/user_map/bloc/map_bloc.dart';
import 'package:emergency_test/models/app_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IconTitle extends StatelessWidget {
  const IconTitle({
    required this.title,
    required this.color,
    required this.icon,
    super.key,
  });

  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppBloc, AppState, AppLocation?>(
      selector: (state) => state.currentLocation,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state != null) {
              context.read<MapBloc>().add(
                    MapNearbyPlaceRequested(
                      lat: state.location.$1,
                      lng: state.location.$2,
                      type: title,
                    ),
                  );
            }
          },
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 30.0,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Text(title),
            ],
          ),
        );
      },
    );
  }
}
