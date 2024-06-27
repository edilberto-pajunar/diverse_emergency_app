import 'package:emergency_test/features/user_map/widgets/user_map_details.dart';
import 'package:emergency_test/features/user_map/widgets/user_map_panel.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UserMapView extends StatefulWidget {
  const UserMapView({super.key});

  @override
  State<UserMapView> createState() => _UserMapViewState();
}

class _UserMapViewState extends State<UserMapView> {
  final PanelController panelController = PanelController();
  static double fabHeightClosed = 280;
  double fabHeight = fabHeightClosed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final panelHeightClosed = size.height * 0.1;
    final panelHeightOpen = size.height * 0.5;

    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            controller: panelController,
            minHeight: panelHeightClosed,
            maxHeight: panelHeightOpen,
            parallaxEnabled: true,
            parallaxOffset: 0.5,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(18.0),
              topLeft: Radius.circular(18.0),
            ),
            body: UserMapDetails(
              fabHeight: fabHeight,
            ),
            panelBuilder: (controller) {
              return UserMapPanel(
                scrollController: controller,
                panelController: panelController,
              );
            },
            isDraggable: false,
            // onPanelSlide: (position) => setState(() {
            //   final panelMaxScollExtent = panelHeightOpen - panelHeightClosed;
            //   fabHeight = position * panelMaxScollExtent + fabHeightClosed;
            // }),
          ),
        ],
      ),
    );
  }
}
