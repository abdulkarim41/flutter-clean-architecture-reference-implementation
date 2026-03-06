
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:profile/src/bloc/profile_state.dart';

import '../model/profile_model.dart';

class ProfileCubit extends Cubit<ProfileState> {

  final ProfileLocalDataSource dataSource;

  ProfileCubit(this.dataSource) : super(const ProfileState());

  Future<void> loadProfile() async {

    emit(state.copyWith(loading: true));

    final profile = await dataSource.getProfile();

    emit(state.copyWith(
      loading: false,
      profile: profile,
    ));
  }
}

class ProfileLocalDataSource {

  Future<ProfileModel> getProfile() async {
    final prefs = GetIt.I.get<SharedPrefs>();
    final fullName = "${prefs.get<String>(key: SpKey.firstName)} ${prefs.get<String>(key: SpKey.lastName)}";

    return ProfileModel(
      name: fullName,
      email: prefs.get<String>(key: SpKey.email),
      imageUrl: prefs.get<String>(key: SpKey.profileImageUrl),
    );
  }
}