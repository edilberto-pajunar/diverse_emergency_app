import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const SettingTile({
    required this.title,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Icon(icon),
          ),
          title: Text(title),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: onPressed,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
