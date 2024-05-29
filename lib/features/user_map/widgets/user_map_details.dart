import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMapDetails extends StatefulWidget {
  const UserMapDetails({super.key});

  @override
  State<UserMapDetails> createState() => _UserMapDetailsState();
}

class _UserMapDetailsState extends State<UserMapDetails> {
  final ScrollController panelController = ScrollController();

  @override
  Widget build(BuildContext context) {
    const LatLng googlePlex = LatLng(37.4223, -122.0848);
    const LatLng mountainView = LatLng(37.3861, -122.0839);

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.appLocationStatus == AppLocationStatus.loading ||
            state.appLocationStatus == AppLocationStatus.idle) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Stack(
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.location_searching_outlined),
              ),
              GoogleMap(
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
              ),
            ],
          );
        }
      },
    );
  }
}
