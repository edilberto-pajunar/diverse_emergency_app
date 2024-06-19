import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/history/view/history_page.dart';
import 'package:emergency_test/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserInfoDrawer extends StatelessWidget {
  const UserInfoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const image =
        "https://i.pinimg.com/564x/1e/44/65/1e44653d5d836e2d61d89b63da8b467a.jpg";

    return BlocSelector<AppBloc, AppState, AppUser?>(
      selector: (state) => state.currentUser,
      builder: (context, currentUser) {
        return Drawer(
          child: currentUser == null
              ? const Center(
                  child: Text("No user found"),
                )
              : Column(
                  children: [
                    DrawerHeader(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40.0,
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Text(currentUser.email!),
                        ],
                      ),
                    ),
                    ListTile(
                      title: const Text("History"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                      leading: const Icon(Icons.history),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("Connect"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                      leading: const Icon(Icons.connected_tv_rounded),
                      onTap: () {},
                    ),
                    const Divider(),

                    ListTile(
                      title: const Text("Account Settings"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                      leading: const Icon(Icons.person_2_rounded),
                      onTap: () {},
                    ),
                    const Divider(),

                    ListTile(
                      title: const Text("Topup"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                      leading: const SizedBox(),
                      onTap: () {},
                    ),
                    const Divider(),

                    ListTile(
                      title: const Text("History"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                      leading: const Icon(Icons.history),
                      onTap: () {},
                    ),
                    const Divider(),

                    ListTile(
                      title: const Text("GPS Tracker"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                      leading: const Icon(Icons.track_changes_rounded),
                      onTap: () {},
                    ),
                    const Divider(),

                    ListTile(
                      title: const Text("FAQs"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                      leading: const SizedBox(),
                      onTap: () {},
                    ),

                    // ListTile(
                    //   title: const Text("Invite a person"),
                    //   trailing: const Icon(
                    //     Icons.arrow_forward_ios_sharp,
                    //   ),
                    //   leading: const Icon(Icons.share),
                    //   onTap: () => context.push("/invitation"),
                    // ),

                    const Divider(),
                    ListTile(
                      title: const Text("Logout"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                      leading: const Icon(Icons.logout),
                      onTap: () {
                        context.read<AppBloc>().add(AppSignOutRequested());
                      },
                    ),

                    // IconButton(
                    // //   onPressed: () {
                    // //     context.read<AppBloc>().add(AppSignOutRequested());
                    // //   },
                    // //   icon: const Icon(
                    // //     Icons.gps_fixed,
                    // //     color: Colors.blue,
                    // //   ),
                    // // ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("v.1.0.0"),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
