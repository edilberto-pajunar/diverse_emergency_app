import 'package:flutter/material.dart';
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

    return Column(
      children: [
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        const SizedBox(height: 24.0),
        Text(
          "Explore New York",
          style: theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
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
              title: "Popular",
              color: Colors.yellow,
              icon: Icons.event,
            ),
            IconTitle(
              title: "Popular",
              color: Colors.green,
              icon: Icons.more_horiz_rounded,
            ),
          ],
        ),
        const Text("Images"),
      ],
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
    return Column(
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
    );
  }
}
