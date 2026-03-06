import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:profile/src/profile_screen.dart';

import 'bloc/profile_cubit.dart';

class ProfileRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesPath.profileScreenPath,
      name: AppRoutesName.profileScreenName,
      builder: (context, state) => BlocProvider(
        create: (_) => ProfileCubit(ProfileLocalDataSource()),
        child: const ProfileScreen(),
      ),
    ),
  ];
}