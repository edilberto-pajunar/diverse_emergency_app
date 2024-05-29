import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/user_map/bloc/map_bloc.dart';
import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/models/nearby_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UserMapPanel extends StatelessWidget {
  const UserMapPanel({
    required this.scrollController,
    required this.panelController,
    super.key,
  });

  final PanelController panelController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Center(
            child: Text(
              "Discover",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconTitle(
                title: "Popular",
                color: Colors.blue,
                icon: Icons.favorite,
              ),
              IconTitle(
                title: "Food",
                color: Colors.orange,
                icon: Icons.fastfood_rounded,
              ),
              IconTitle(
                title: "Event",
                color: Colors.yellow,
                icon: Icons.event,
              ),
              IconTitle(
                title: "See more",
                color: Colors.green,
                icon: Icons.more_horiz_rounded,
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            "Images",
            style: theme.textTheme.titleSmall,
          ),
          BlocSelector<MapBloc, MapState, List<NearbyPlace>>(
            selector: (state) => state.nearbyPlaces,
            builder: (context, state) {
              return SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 24.0,
                  ),
                  shrinkWrap: true,
                  itemCount: state.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final place = state[index];
                    return Container(
                      width: 300,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Column(
                        children: [
                          Text(place.name ?? ""),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

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
              context.read<MapBloc>().add(MapNearbyPlaceRequested(
                    lat: state.location.$1,
                    lng: state.location.$2,
                    type: title,
                  ));
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
