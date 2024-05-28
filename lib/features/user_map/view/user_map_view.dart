import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMapView extends StatelessWidget {
  const UserMapView({super.key});

  @override
  Widget build(BuildContext context) {
    const LatLng googlePlex = LatLng(37.4223, -122.0848);
    const LatLng mountainView = LatLng(37.3861, -122.0839);

    return Scaffold(
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.appLocationStatus == AppLocationStatus.loading ||
              state.appLocationStatus == AppLocationStatus.idle) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(state.currentLocation!.location.$1,
                  state.currentLocation!.location.$2),
              zoom: 13,
            ),
            markers: {
              const Marker(
                markerId: MarkerId("sourceLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: googlePlex,
              ),
              const Marker(
                markerId: MarkerId("destinationLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: mountainView,
              ),
              Marker(
                markerId: const MarkerId("currentLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(state.currentLocation!.location.$1,
                    state.currentLocation!.location.$2),
              ),
            },
          );
        },
      ),
    );
  }
}
