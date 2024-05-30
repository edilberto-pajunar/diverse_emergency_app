import 'package:emergency_test/features/user_map/bloc/map_bloc.dart';
import 'package:emergency_test/features/user_map/widgets/icon_title.dart';
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

    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {
                    context.read<MapBloc>().add(MapPanelButtonTapped());
                    state.panelShow
                        ? panelController.close()
                        : panelController.open();
                  },
                  icon: Icon(
                    state.panelShow
                        ? Icons.arrow_drop_down_circle_sharp
                        : Icons.arrow_circle_up,
                  ),
                ),
              ),
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
                    title: "Restaurant",
                    color: Colors.blue,
                    icon: Icons.restaurant,
                  ),
                  IconTitle(
                    title: "Police",
                    color: Colors.orange,
                    icon: Icons.local_police,
                  ),
                  IconTitle(
                    title: "Hotel",
                    color: Colors.yellow,
                    icon: Icons.hotel,
                  ),
                  IconTitle(
                    title: "Church",
                    color: Colors.green,
                    icon: Icons.church,
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Text(
                "Places nearby",
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 12.0),
              BlocSelector<MapBloc, MapState, List<NearbyPlace>>(
                selector: (state) => state.nearbyPlaces,
                builder: (context, state) {
                  return SizedBox(
                    height: 150,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12.0,
                      ),
                      shrinkWrap: true,
                      itemCount: state.length,
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
                              ListTile(
                                title: Text(place.displayName.text),
                                subtitle: Text("Rating: ${place.rating}"),
                                leading: CircleAvatar(
                                  child: Text("${index + 1}"),
                                ),
                              ),
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
      },
    );
  }
}
