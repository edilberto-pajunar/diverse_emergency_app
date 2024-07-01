import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/user_map/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
    final currentLocation =
        context.read<AppBloc>().state.currentLocation!.location;

    return BlocBuilder<MapBloc, MapState>(
      builder: (context, nearbyPlace) {
        return Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(
                  currentLocation.$1,
                  currentLocation.$2,
                ),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/pajunar04/clwsz2hfc016g01q17p1rhhso/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGFqdW5hcjA0IiwiYSI6ImNsd3N5cWc5ejAxOGsya3M2a3J3dTM5Nm8ifQ.TrTpwKH1kK_PIqYYPXm1rw",
                  additionalOptions: const {
                    "accessToken": String.fromEnvironment("MAPS_ACCESS_TOKEN"),
                    "id": "mapbox.mapbox-terrain-v2",
                  },
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(currentLocation.$1, currentLocation.$2),
                      child: const Icon(Icons.location_on_sharp),
                    ),
                    ...nearbyPlace.markers,
                  ],
                )
              ],
            ),
            //   GoogleMap(
            //     onMapCreated: (controller) => context
            //         .read<AppBloc>()
            //         .add(AppInitGoogleMapControllerStarted(
            //           controller: controller,
            //         )),
            //     initialCameraPosition: CameraPosition(
            //       target: LatLng(currentLocation.$1, currentLocation.$2),
            //       zoom: 13,
            //     ),
            //     markers: {
            //       Marker(
            //         markerId: const MarkerId("source"),
            //         position: LatLng(state.currentLocation!.location.$1,
            //             state.currentLocation!.location.$2),
            //         icon: BitmapDescriptor.defaultMarker,
            //       ),
            //       ...nearbyPlace.markers
            //     },
            //   ),
            //   Positioned(
            //     bottom: widget.fabHeight,
            //     right: 20,
            //     child: FloatingActionButton(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(100.0),
            //       ),
            //       onPressed: () => state.googleMapController!
            //           .animateCamera(CameraUpdate.newLatLng(LatLng(
            //         currentLocation.$1,
            //         currentLocation.$2,
            //       ))),
            //       child: const Icon(Icons.location_searching_rounded),
            //     ),
            //   ),
          ],
        );
      },
    );
  }
}
