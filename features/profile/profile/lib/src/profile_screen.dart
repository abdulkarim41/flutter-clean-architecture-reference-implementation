import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'bloc/profile_cubit.dart';
import 'bloc/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          ProfileHeader(),

          SizedBox(height: 30),

          Divider(),

          ProfileMenu(),

          Divider(),

          LogoutButton(),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocSelector<ProfileCubit, ProfileState, ProfileState>(
      selector: (state) => state,
      builder: (context, state) {

        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final profile = state.profile;

        if (profile == null) {
          return const SizedBox();
        }

        return Column(
          children: [

            ProfileAvatar(
              imageUrl: profile.imageUrl,
            ),

            const SizedBox(height: 12),

            Text(
              profile.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              profile.email,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        );
      },
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey.shade200,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,

          /// loading
          placeholder: (context, url) =>
          const CircularProgressIndicator(),

          /// error
          errorWidget: (context, url, error) =>
          const Icon(Icons.person, size: 50),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  Widget _item(
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        _item(
          Icons.person,
          "Edit Profile",
              () {},
        ),

        _item(
          Icons.settings,
          "Settings",
              () {},
        ),

        _item(
          Icons.lock,
          "Change Password",
              () {},
        ),

        _item(
          Icons.help_outline,
          "Help Center",
              () {},
        ),
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  void _showLogoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: Navigator.of(context, rootNavigator: true).context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Are you sure you want to logout from your account?",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 25),

              Row(
                children: [

                  /// Cancel
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(sheetContext),
                      child: const Text("Cancel"),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Logout
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        context.read<AuthBloc>().logout();
                      },
                      child: const Text("Logout"),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.logout,
        color: Colors.red,
      ),
      title: const Text(
        "Logout",
        style: TextStyle(color: Colors.red),
      ),
      onTap: () => _showLogoutSheet(context),
    );
  }
}
