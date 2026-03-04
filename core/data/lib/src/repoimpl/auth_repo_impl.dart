import 'package:common/common.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:entity/entity.dart';
import 'package:apiresponse/apiresponse.dart';

final class AuthRepoImpl with ApiHandler implements AuthRepository {
  final NetworkClient _client;
  final SharedPrefs _sharedPrefs;
  final SecureStorage _secureStorage;

  AuthRepoImpl({
    required NetworkClient client,
    required SharedPrefs sharedPrefs,
    required SecureStorage secureStorage,
  }) : _client = client,
       _sharedPrefs = sharedPrefs,
       _secureStorage = secureStorage;

  @override
  Future<Result<LoginApiEntity>> login(LoginApiParams params) async {
    final result = await performApiCall<LoginApiEntity,LoginApiResponse>(
      request: () async {
        final result = await _client.post(
          endpoint: "auth/login",
          body: params.toJson(),
        );
        return LoginApiResponse.fromJson(result);
      },
      mapResponse: LoginApiMapper.toEntity,
    );

    if (result is Success<LoginApiEntity>) {
      await _secureStorage.set(
        key: SpKey.accessToken,
        value: result.data.accessToken,
      );
    }
    return result;

  }

  @override
  Future<Result<ProfileApiEntity>> fetchProfile() {
    return performApiCall(
      request: () async {
        final result = await _client.get(endpoint: "auth/me");
        return ProfileApiResponse.fromJson(result);
      },
      mapResponse: ProfileApiMapper.toEntity,
      onSuccess: _cacheProfileData
    );
  }

  void _cacheProfileData(ProfileApiEntity data) {
    _sharedPrefs
      ..set(key: SpKey.firstName, value: data.firstName)
      ..set(key: SpKey.lastName, value: data.lastName)
      ..set(key: SpKey.email, value: data.email)
      ..set(key: SpKey.gender, value: data.gender)
      ..set(key: SpKey.isUserAuthenticate, value: true);
  }

}
