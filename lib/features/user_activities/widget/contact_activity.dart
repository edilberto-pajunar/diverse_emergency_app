import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactActivity extends StatelessWidget {
  const ContactActivity({
    super.key,
  });

  static const image =
      "https://i.pinimg.com/564x/19/eb/fd/19ebfdaf81fe2546e14b5cb22e1072e1.jpg";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<UserActivitiesBloc, UserActivitiesState>(
      buildWhen: (prev, curr) => prev.contactStatus != curr.contactStatus,
      builder: (context, state) {
        if (state.contactStatus == ContactStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
                      const UserActivitiesContactTypeTapped(
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
                  onPressed: () => context
                      .read<UserActivitiesBloc>()
                      .add(const UserActivitiesContactTypeTapped(
                        contactType: ContactType.taglist,
                      )),
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.contactPersons.length,
              itemBuilder: (context, index) {
                final contactPerson = state.contactPersons[index];

                return ListTile(
                  title: Text(contactPerson.fullname ?? ""),
                  leading: Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        contactPerson.proPic ?? image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        !contactPerson.emailVerified!
                            ? Icons.close
                            : Icons.verified,
                        color: contactPerson.emailVerified!
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
                        !contactPerson.mobileVerified!
                            ? Icons.close
                            : Icons.phone,
                        color: contactPerson.mobileVerified!
                            ? Colors.green
                            : Colors.red,
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
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile.adaptive(
                value: false,
                onChanged: (val) {},
                title: const Text("To Receive SMS"),
              ),
              const Divider(),
              TextButton(
                onPressed: () {},
                child: const Text("Unset as Primary"),
              ),
              const Divider(),
              TextButton(
                onPressed: () {},
                child: const Text("Set tag relationship"),
              ),
            ],
          ),
        );
      },
    );
  }
}
