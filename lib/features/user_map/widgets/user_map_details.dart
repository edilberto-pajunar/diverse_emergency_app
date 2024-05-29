import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/user_map/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMapDetails extends StatefulWidget {
  const UserMapDetails({
    required this.fabHeight,
    super.key,
  });

  final double fabHeight;

  @override
  State<UserMapDetails> createState() => _UserMapDetailsState();
}

class _UserMapDetailsState extends State<UserMapDetails> {
  final ScrollController panelController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.appLocationStatus == AppLocationStatus.loading ||
            state.appLocationStatus == AppLocationStatus.idle) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final currentLocation = state.currentLocation!.location;
          return BlocBuilder<MapBloc, MapState>(
            builder: (context, nearbyPlace) {
              return Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (controller) => context
                        .read<AppBloc>()
                        .add(AppInitGoogleMapControllerStarted(
                          controller: controller,
                        )),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation.$1, currentLocation.$2),
                      zoom: 13,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId("source"),
                        position: LatLng(state.currentLocation!.location.$1,
                            state.currentLocation!.location.$2),
                        icon: BitmapDescriptor.defaultMarker,
                      ),
                      ...nearbyPlace.markers
                    },
                  ),
                  Positioned(
                    bottom: widget.fabHeight,
                    right: 20,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      onPressed: () => state.googleMapController!
                          .animateCamera(CameraUpdate.newLatLng(LatLng(
                        currentLocation.$1,
                        currentLocation.$2,
                      ))),
                      child: const Icon(Icons.location_searching_rounded),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
