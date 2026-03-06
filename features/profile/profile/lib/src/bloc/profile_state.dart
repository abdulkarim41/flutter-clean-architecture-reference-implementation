
import 'package:equatable/equatable.dart';

import '../model/profile_model.dart';

class ProfileState extends Equatable {

  final bool loading;
  final ProfileModel? profile;

  const ProfileState({
    this.loading = false,
    this.profile,
  });

  ProfileState copyWith({
    bool? loading,
    ProfileModel? profile,
  }) {
    return ProfileState(
      loading: loading ?? this.loading,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [loading, profile];
}