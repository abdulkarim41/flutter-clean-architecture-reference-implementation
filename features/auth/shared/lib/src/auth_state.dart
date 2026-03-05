
class AuthState {
  final AuthStatus status;
  const AuthState(this.status);
}

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  showOnboarding,
}