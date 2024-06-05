import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserContact extends StatelessWidget {
  const UserContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    const image =
        "https://i.pinimg.com/564x/19/eb/fd/19ebfdaf81fe2546e14b5cb22e1072e1.jpg";

    return BlocBuilder<UserActivitiesBloc, UserActivitiesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contacts",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => context.read<UserActivitiesBloc>().add(
                      const UserContactTypeTapped(
                          contactType: ContactType.primary)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.contactType == ContactType.primary
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.onSecondary,
                  ),
                  child: Text(
                    "PRIMARIES",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: state.contactType == ContactType.primary
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                ElevatedButton(
                  onPressed: () => context.read<UserActivitiesBloc>().add(
                      const UserContactTypeTapped(
                          contactType: ContactType.taglist)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.contactType == ContactType.taglist
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.onSecondary,
                  ),
                  child: Text(
                    "TAG LIST",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: state.contactType == ContactType.taglist
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.contactPersons.length,
              itemBuilder: (context, index) {
                final contactPerson = state.contactPersons[index];

                return ListTile(
                  title: Text(contactPerson.username),
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.verified,
                        color: contactPerson.emailVerified
                            ? Colors.green
                            : Colors.black,
                        size: 12,
                      ),
                      Text(
                        "Email",
                        style: theme.textTheme.labelSmall,
                      ),
                      const SizedBox(width: 4.0),
                      Icon(
                        Icons.phone,
                        color: contactPerson.phoneVerified
                            ? Colors.green
                            : Colors.black,
                        size: 12,
                      ),
                      Text(
                        "Mobile",
                        style: theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                  contentPadding: EdgeInsets.zero,
                  isThreeLine: true,
                  trailing: TextButton(
                    onPressed: () => seeMore(context),
                    child: const Text("See More"),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> seeMore(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 400.0,
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Close"),
            ),
          ),
        );
      },
    );
  }
}
